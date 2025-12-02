import { OrderService } from "../services/OrderService";
import { Utils } from "../../config/tools/Utils";
import { CustomExceptions } from "../../config/tools/CustomExceptions";

class OrderModel {
  static async createOrder(
    idorder: string,
    total: number,
    origin: string,
    comments: string,
    client: string,
    users_idusers: string,
    order_details: any,
    date: string,
    status: number
  ) {
    const res = await OrderService.createOrder(
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
    if (res.error) return res;

    const msj = res.msg;
    return {
      error: false,
      msg: {
        idorder: msj,
        client: client,
        total: total,
        status: status,
        comment: comments,
      },
    };
  }

  static async viewOrder(idorder: string) {
    return await OrderService.viewOrder(idorder);
  }

  static async viewOrders(){
    return await OrderService.viewOrders();
  }

  static async updateStatus(idorder: string,status: number,users_idusers:string){
    return await OrderService.updateStatus(idorder,status,users_idusers);
  }
  
  static async lastOrder(iduser:string){
    return await OrderService.lastOrder(iduser);
  }
}
export { OrderModel };