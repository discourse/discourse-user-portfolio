import Controller from "@ember/controller";
import { action } from "@ember/object";

export default class UserPortfolioController extends Controller {
  @action
  loadMore() {
    this.model.loadMore();
  }
}
