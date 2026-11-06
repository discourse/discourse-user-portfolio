/* eslint-disable ember/no-classic-components, ember/require-tagless-components */
import Component from "@ember/component";
import { action } from "@ember/object";
import { service } from "@ember/service";
import { classNames, tagName } from "@ember-decorators/component";
import DButton from "discourse/components/d-button";

@tagName("li")
@classNames("user-card-additional-buttons-outlet", "portfolio-link")
export default class PortfolioLink extends Component {
  static shouldRender() {
    return settings.user_card_portfolio_link;
  }

  @service router;

  @action
  showPortfolio() {
    // Read the user first: closing the card clears it from the outlet args
    const username = this.user.username_lower;
    this.close();
    this.router.transitionTo("user.portfolio", username);
  }

  <template>
    <DButton
      class="btn-default"
      @action={{this.showPortfolio}}
      @icon={{settings.portfolio_icon}}
      @label={{themePrefix "portfolio"}}
    />
  </template>
}
