import Component from "@ember/component";
import { LinkTo } from "@ember/routing";
import { classNames, tagName } from "@ember-decorators/component";
import icon from "discourse/helpers/d-icon";
import { i18n } from "discourse-i18n";

@tagName("li")
@classNames("user-main-nav-outlet", "portfolio-link")
export default class PortfolioLink extends Component {
  <template>
    {{#LinkTo route="user.portfolio"}}
      {{icon settings.portfolio_icon}}
      <span>{{i18n (themePrefix "portfolio")}}</span>
    {{/LinkTo}}
  </template>
}
