const mysql = require('mysql2/promise');

async function checkIngredients() {
    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'comandas_user',
        password: 'comandas_password_2025',
        database: 'comandas_db'
    });

    try {
        console.log('=== INGREDIENTES EN LA BASE DE DATOS ===\n');
        const [ingredients] = await connection.execute(
            'SELECT * FROM ingredients ORDER BY name'
        );
        console.log('Total de ingredientes:', ingredients.length);
        console.log('\nDetalle de ingredientes:');
        ingredients.forEach((ing, index) => {
            console.log(`\n${index + 1}. ${ing.name}`);
            console.log(`   ID: ${ing.idingredients}`);
            console.log(`   Extra: ${ing.extra ? 'Sí' : 'No'}`);
            console.log(`   Costo: $${ing.cost}`);
            console.log(`   Stock: ${ing.stock}`);
            console.log(`   Requerido: ${ing.required ? 'Sí' : 'No'}`);
            console.log(`   Imagen: ${ing.image || 'NO TIENE IMAGEN'}`);
        });

        console.log('\n\n=== PRODUCTOS Y SUS INGREDIENTES ===\n');
        const [products] = await connection.execute(
            'SELECT p.idproducts, p.name, p.image FROM products p WHERE p.active = 1 ORDER BY p.name'
        );
        
        for (const product of products) {
            console.log(`\n📦 ${product.name}`);
            console.log(`   Imagen producto: ${product.image || 'NO TIENE IMAGEN'}`);
            
            const [prodIngredients] = await connection.execute(
                `SELECT i.name, i.image, i.extra, i.required 
                 FROM products_ingredients pi 
                 JOIN ingredients i ON i.idingredients = pi.ingredients_idingredients 
                 WHERE pi.products_idProducts = ?
                 ORDER BY i.name`,
                [product.idproducts]
            );
            
            if (prodIngredients.length > 0) {
                console.log('   Ingredientes:');
                prodIngredients.forEach(ing => {
                    const tipo = ing.extra ? '(Extra)' : ing.required ? '(Requerido)' : '(Opcional)';
                    const imagen = ing.image ? '✓' : '✗';
                    console.log(`     - ${ing.name} ${tipo} [Imagen: ${imagen}]`);
                });
            } else {
                console.log('   ⚠️  SIN INGREDIENTES ASOCIADOS');
            }
        }

    } catch (error) {
        console.error('Error:', error.message);
    } finally {
        await connection.end();
    }
}

checkIngredients();
