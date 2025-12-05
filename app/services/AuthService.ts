import { DatabaseMethods } from '../../config/database/DatabaseMethods';
import { CustomExceptions } from '../../config/tools/CustomExceptions';
import { Utils } from '../../config/tools/Utils';

class AuthService {
    static async signIn(name: string, password: string) {

        // CORRECCION: Se quito "AND rol NOT IN (4)" para permitir entrar a clientes
        const res = await DatabaseMethods.query_one({
            query: "SELECT * FROM users WHERE name = ?;",
            params: [name]
        });
        
        if (res.error) return res;

        const msj = res.msg;

        if (typeof msj === 'string') {
            throw new CustomExceptions('004');
        }

        if (!msj) throw new CustomExceptions('004');

        if (!(await Utils.verify(password, msj.password))) throw new CustomExceptions('005');

        return { error: false, msg: msj };
    }

    static async signUp(name: string, password: string, id: string, phone: string, rol: number) {
        const queries = [
            {
                query: "INSERT INTO `users`(`idusers`, `name`, `password`, `phone`, `rol`) VALUES (?,?,?,?,?)",
                params: [id, name, password, phone, rol]
            },
        ];
        return await DatabaseMethods.save_transaction(queries);
    }
}

export { AuthService };