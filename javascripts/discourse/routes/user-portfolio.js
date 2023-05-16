import DiscourseRoute from "discourse/routes/discourse";
import Category from "discourse/models/category";

export default DiscourseRoute.extend({
  buildRouteInfoMetadata() {
    return {
      customThumbnailMode: settings.portfolio_thumbnail_style,
    };
  },

  setupController(controller) {
    this._super(...arguments);
    controller.setProperties({
      category: Category.findById(settings.portfolio_category),
    });
  },

  model() {
    const filterParams = {};
    const filterTags = settings.portfolio_tags.split("|").filter(Boolean);

    if (filterTags.length > 0) {
      filterParams["tags"] = filterTags;
    }

    if (settings.portfolio_category > 0) {
      filterParams["category"] = settings.portfolio_category;
    }

    filterParams["order"] = settings.portfolio_order;

    return this.store.findFiltered("topicList", {
      filter: `topics/created-by/${this.modelFor("user").username_lower}`,
      params: filterParams,
    });
  },
});
