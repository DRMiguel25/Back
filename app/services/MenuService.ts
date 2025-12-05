import { DatabaseMethods } from '../../config/database/DatabaseMethods';
import { Utils } from '../../config/tools/Utils';
import { CustomExceptions } from '../../config/tools/CustomExceptions';
import { RowDataPacket } from 'mysql2';

class MenuService {
    static async viewIngredients() {
        // 1. Traer todos los productos (Hamburguesas, Snacks, etc.)
        const res = await DatabaseMethods.query({
            query: "SELECT p.idproducts, p.name, p.image, p.price, p.description, p.category_idcategory, c.name as name_category FROM products as p JOIN category c ON c.idcategory = p.category_idcategory WHERE p.active = 1 ORDER BY p.category_idcategory, p.name",
            params: []
        });
        if (res.error) return res;

        const msj = res.msg;

        if (typeof msj === 'string') {
            throw new CustomExceptions('004');
        }

        // 2. Traer los ingredientes de cada producto
        for (const [key, value] of Object.entries(msj)) {
            const res2 = await DatabaseMethods.query({
                query: `
                    SELECT 
                        i.idingredients, 
                        i.name, 
                        i.extra, 
                        i.cost, 
                        i.stock, 
                        i.required,
                        CONCAT(i.name, '.png') as image  -- <--- TRUCO: Generamos el nombre de la imagen aquí
                    FROM products_ingredients pi 
                    JOIN ingredients i ON i.idingredients = pi.ingredients_idingredients 
                    WHERE pi.products_idproducts = ?  -- <--- CORRECCIÓN: todo en minúsculas para Linux
                    ORDER BY i.name`,
                params: [(value as any).idproducts]
            });

            (msj as any)[Number(key)].ingredients = res2.msg;
        }
        return { error: false, msg: msj };
    }
}
export { MenuService };