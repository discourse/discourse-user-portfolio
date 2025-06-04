import Component from "@ember/component";
import { concat } from "@ember/helper";
import { classNames, tagName } from "@ember-decorators/component";
import DButton from "discourse/components/d-button";

@tagName("li")
@classNames("user-card-additional-buttons-outlet", "portfolio-link")
export default class PortfolioLink extends Component {
  static shouldRender() {
    return settings.user_card_portfolio_link;
  }

  <template>
    <DButton
      class="btn-default"
      @href={{concat
        "/u/"
        this.user.username_lower
        "/activity/"
        settings.portfolio_route_name
      }}
      @icon={{settings.portfolio_icon}}
      @label={{themePrefix "portfolio"}}
    />
  </template>
}
