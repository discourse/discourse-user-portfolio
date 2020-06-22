// Hack to work around https://github.com/discourse/discourse/pull/10105
// Can be removed once the PR is merged to core
export default {
  name: "init-user-portfolio",

  initialize(container) {
    const thumbnailsService = container.lookup("service:topic-thumbnails");
    const portfolioThumbnailsEnabled = ["masonry", "grid"].includes(
      settings.portfolio_thumbnail_style
    );

    Ember.TEMPLATES["components/portfolio-basic-topic-list"] =
      Ember.TEMPLATES["components/basic-topic-list"];

    // Only allow mobile template if not using gallery layout
    if (
      !(
        thumbnailsService &&
        portfolioThumbnailsEnabled &&
        thumbnailsService.enabledForDevice
      )
    ) {
      Ember.TEMPLATES["mobile/components/portfolio-basic-topic-list"] =
        Ember.TEMPLATES["mobile/components/basic-topic-list"];
    }
  }
};
