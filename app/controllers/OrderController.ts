import { OrderModel } from "../models/OrderModel";
import { Utils } from "../../config/tools/Utils";
import { CustomExceptions } from "../../config/tools/CustomExceptions";

class OrderController {
  static async createOrder(req: any, res: any) {
    const { idorder, total, origin, comments, client, users_idusers, order_details, date, status } =
      req.body;
    
    // Validación de campos obligatorios
    if (Utils.hasEmptyParams([idorder, total, client, users_idusers, order_details])) 
        throw new CustomExceptions("007");

    const result = await OrderModel.createOrder(
      idorder,
      total,
      origin,
      comments,
      client,
      users_idusers,
      order_details,
      date,
      status
    );

    res.json(result);
  }

  static async viewOrder(req: any, res: any) {
    const keyParams = req.query.params;
    if (!keyParams) throw new CustomExceptions('007'); // Validación extra

    let params;
    try {
        params = JSON.parse(keyParams);
    } catch (e) {
        throw new CustomExceptions('007');
    }

    const { idorder } = params;
    if (Utils.hasEmptyParams([idorder])) throw new CustomExceptions('007');
    
    const result = await OrderModel.viewOrder(idorder);
    res.json(result);
  }

  // --- AQUÍ PUEDE ESTAR EL ERROR ---
  static async viewOrders(req: any, res:any){
    // Esta función no requiere parámetros, simplemente llama al modelo
    const result =  await OrderModel.viewOrders();
    res.json(result);
  }

  static async updateStatus(req:any, res:any){
    const keyParams = req.query.params;
    let params;
    try {
        params = JSON.parse(keyParams);
    } catch (e) {
        throw new CustomExceptions('007');
    }
    
    const {idorder,status,users_idusers} = params;
    if (Utils.hasEmptyParams([idorder,status, users_idusers]))
        throw new CustomExceptions("007");
  
      const result = await OrderModel.updateStatus(
        idorder,
        status,
        users_idusers
      );
  
      res.json(result);
  }

  static async lastOrder(req:any,res:any){
    const keyParams = req.query.params;
    let params;
    try {
        params = JSON.parse(keyParams);
    } catch (e) {
        throw new CustomExceptions('007');
    }
    
    const {iduser} = params;
    if (Utils.hasEmptyParams([iduser])) throw new CustomExceptions('007');
    const result = await OrderModel.lastOrder(iduser);
    res.json(result);
  }
}
export { OrderController };