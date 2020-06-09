import UserTopicListRoute from "discourse/routes/user-topic-list";
import UserAction from "discourse/models/user-action";

const filterTags = settings.portfolio_tags.split("|").filter(val => val);

export default UserTopicListRoute.extend({
  userActionType: UserAction.TYPES.topics,

  buildRouteInfoMetadata() {
    return {
      customThumbnailMode: settings.portfolio_thumbnail_style
    };
  },

  setupController() {
    this._super(...arguments);
    this.controllerFor("user-topics-list").setProperties({
      showPosters: true
    });
  },

  model: function() {
    const filterParams = {};

    if (settings.portfolio_category > 0) {
      filterParams["category"] = settings.portfolio_category;
    }

    if (filterTags.length > 0) {
      filterParams["tags"] = filterTags;
    }

    return this.store.findFiltered("topicList", {
      filter:
        "topics/created-by/" + this.modelFor("user").get("username_lower"),
      params: filterParams
    });
  }
});
