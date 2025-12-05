import { UserService } from "../services/UserService";
import { Utils } from "../../config/tools/Utils";
import { CustomExceptions } from "../../config/tools/CustomExceptions";

class UserModel {
  static async viewUsers() {
    return await UserService.viewUsers();
  }

  static async viewUser(idusers: string) {
    return await UserService.viewUser(idusers);
  }

  static async updateUser(
    idusers: string,
    name: string,
    password: string,
    phone: string,
    rol: number
  ) {
    return await UserService.updateUser(idusers, name, password, phone, rol);
  }

  static async updateProfile(
    idusers: string, 
    name: string, 
    password: string, 
    phone: string
  ) {
    return await UserService.updateProfile(idusers, name, password, phone);
  }

  static async deleteUser(idusers: string) {
    return await UserService.deleteUser(idusers);
  }
}
export { UserModel };