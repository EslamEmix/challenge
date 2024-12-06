class OrdersMetricsEntity {
  final int ordersTotalCount;
  final double averagePrice;
  final int numberOfReturns;

  OrdersMetricsEntity(
      this.ordersTotalCount, this.averagePrice, this.numberOfReturns);
}
