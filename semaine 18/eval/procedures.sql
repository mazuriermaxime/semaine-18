--Créez la procédure stockée facture qui permet d'afficher les informations nécessaires à une facture en fonction d'un numéro de commande. Cette procédure doit sortir le montant total de la commande.

DELIMITER |

CREATE PROCEDURE facture()
BEGIN
SELECT  ord_id, ord_order_date, ord_payment_date, ord_reception_date, cus_id, cus_lastname, cus_firstname, cus_address, cus_zipcode, cus_city, cus_mail, cou_name, ode_id, ode_unit_price, ode_discount, ,

(
    count(
        (
            ode_unit_price - ode_unit_price / 100 * ode_discount
        )    *ode_quantity,
        decimal(10. 2)

        )
) AS total, pro_ref, pro_name, cat_name
FROM countries
JOIN customers ON cou_id = cus_countries_id
JOIN orders ON cus_id = ord_cus_id
JOIN orders_details ON ode_ord_id = ord_id
JOIN products ON ode_pro_id = pro_id
JOIN categories ON pro_cat_id = cat_id

WHERE ord_id = p_orderid;

END
DELIMITER