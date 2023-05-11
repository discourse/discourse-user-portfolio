export default {
  resource: "user",
  map() {
    this.route("portfolio", {
      path: `activity/${settings.portfolio_route_name}`,
    });
  },
};
