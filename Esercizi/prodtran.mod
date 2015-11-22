###########################################################################
#                                                                         #
# Minimize the cost of producing different goods, and shipping them from  # 
# factories to warehouses and customers and warehouses to customers,      #
# while not exceeding the supply available from each factory or the       #
# capacity of each warehouse, and meeting the demand from each customer.  #
#                                                                         #
###########################################################################

set PRODUCTS;
set FACTORIES;
set WAREHOUSES;
set CUSTOMERS;

##############
# Parameters #
##############

param PRODUCTION_COST {PRODUCTS, FACTORIES};         # Cost to produce
param WAREHOUSE_CAPACITY {PRODUCTS,WAREHOUSES};      # Capacity of warehouses
param DEMAND {PRODUCTS,CUSTOMERS};                   # Demand of customers
param FAC_WARE_COST {PRODUCTS,FACTORIES,WAREHOUSES}; # Shipping cost
param WARE_CUS_COST {PRODUCTS,WAREHOUSES,CUSTOMERS}; # Shipping cost
param FAC_CUS_COST {PRODUCTS,FACTORIES,CUSTOMERS};   # Shipping cost

#############
# Variables #
#############

var PRODUCTS_MADE {PRODUCTS,FACTORIES} >=0;            # Products produced
var FAC_WARE_SHIP {PRODUCTS,FACTORIES,WAREHOUSES} >=0; # Products shipped
var WARE_CUS_SHIP {PRODUCTS,WAREHOUSES,CUSTOMERS} >=0; # Products shipped
var FAC_CUS_SHIP {PRODUCTS,FACTORIES,CUSTOMERS} >=0;   # Products shipped

#########
# Model #
#########

minimize TOTAL_COST:
   sum {i in PRODUCTS,j in FACTORIES} PRODUCTION_COST[i,j]*PRODUCTS_MADE[i,j]+
   sum {i in PRODUCTS,j in FACTORIES,k in WAREHOUSES}
      FAC_WARE_SHIP[i,j,k]*FAC_WARE_COST[i,j,k]+
   sum {i in PRODUCTS,k in WAREHOUSES,l in CUSTOMERS}
      WARE_CUS_SHIP[i,k,l]*WARE_CUS_COST[i,k,l]+
   sum {i in PRODUCTS,j in FACTORIES,l in CUSTOMERS}
      FAC_CUS_SHIP[i,j,l]*FAC_CUS_COST[i,j,l];
subject to
  Supply {i in PRODUCTS, j in FACTORIES}:
     PRODUCTS_MADE[i,j] = sum {k in WAREHOUSES} FAC_WARE_SHIP[i,j,k]+
                          sum {l in CUSTOMERS} FAC_CUS_SHIP[i,j,l];
  Demand {i in PRODUCTS, l in CUSTOMERS}:
     sum {j in FACTORIES} FAC_CUS_SHIP[i,j,l]+
     sum {k in WAREHOUSES} WARE_CUS_SHIP[i,k,l] = DEMAND[i,l];
  Warehouse_capacity {i in PRODUCTS, k in WAREHOUSES}:
     sum {j in FACTORIES} FAC_WARE_SHIP[i,j,k] <= WAREHOUSE_CAPACITY[i,k];
  Warehouse_flow {i in PRODUCTS, k in WAREHOUSES}:
     sum {j in FACTORIES} FAC_WARE_SHIP[i,j,k] = 
     sum {l in CUSTOMERS} WARE_CUS_SHIP[i,k,l];


    

