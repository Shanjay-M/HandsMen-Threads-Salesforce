public class OrderTriggerHandler {

    public static void validateOrderQuantity(
        List<HandsMen_Order__c> orderList
    ) {

        for (HandsMen_Order__c order : orderList) {

            // Confirmed orders
            if (order.Order_Status__c == 'Confirmed') {

                if (order.Quantity_c__c == null ||
                    order.Quantity_c__c <= 500) {

                    order.Quantity_c__c.addError(
                        'For Status "Confirmed", Quantity must be more than 500.'
                    );
                }
            }

            // Pending orders
            else if (order.Order_Status__c == 'Pending') {

                if (order.Quantity_c__c == null ||
                    order.Quantity_c__c <= 200) {

                    order.Quantity_c__c.addError(
                        'For Status "Pending", Quantity must be more than 200.'
                    );
                }
            }

            // Rejection orders
            else if (order.Order_Status__c == 'Rejection') {

                if (order.Quantity_c__c == null ||
                    order.Quantity_c__c != 0) {

                    order.Quantity_c__c.addError(
                        'For Status "Rejection", Quantity must be 0.'
                    );
                }
            }
        }

        System.debug('All records validated successfully.');
    }
}