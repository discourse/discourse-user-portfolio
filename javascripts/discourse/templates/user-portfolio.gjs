import RouteTemplate from "ember-route-template";
import BasicTopicList from "discourse/components/basic-topic-list";
import ConditionalLoadingSpinner from "discourse/components/conditional-loading-spinner";
import LoadMore from "discourse/components/load-more";
import htmlSafe from "discourse/helpers/html-safe";
import { i18n } from "discourse-i18n";

export default RouteTemplate(
  <template>
    <div class="user-content user-portfolio">
      {{#if @controller.model.topics}}
        <LoadMore
          @class="paginated-topics-list"
          @selector=".paginated-topics-list .topic-list tr"
          @action={{@controller.loadMore}}
        >
          <BasicTopicList
            @topicList={{@controller.model}}
            @showPosters={{true}}
          />
          <ConditionalLoadingSpinner
            @condition={{@controller.model.loadingMore}}
          />
        </LoadMore>
      {{else}}
        <div class="empty-portfolio">
          <div class="empty-portfolio-message">
            {{htmlSafe (i18n (themePrefix "empty_portfolio"))}}
            {{#if @controller.category}}
              <p>
                {{htmlSafe (i18n (themePrefix "empty_portfolio_link"))}}
                <a href={{@controller.category.url}}>
                  {{@controller.category.name}}
                </a>
              </p>
            {{/if}}
          </div>
        </div>
      {{/if}}
    </div>
  </template>
);
