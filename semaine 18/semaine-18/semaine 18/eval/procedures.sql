--Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.

DELIMITER |

CREATE PROCEDURE facture()
BEGIN
SELECT ord_id,ord_order_date,ord_payment_date,sum((ode_unit_price-(ode_unit_price*ode_discount/100))*ode_quantity) as total_commande,cus_id,CONCAT(cus_lastname,'  ',cus_firstname) FROM orders_details
JOIN orders
ON orders_details.ode_ord_id=orders.ord_id
JOIN customers
ON orders.ord_cus_id=customers.cus_id
group by ord_id;
END |

DELIMITER ;

--Pour appeler la procédure:

CALL facture