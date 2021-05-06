--Créer une table commander_articles constituées de colonnes :
--codart : id du produit
--qte : quantité à commander
--date : date du jour

CREATE TABLE `commander_articles`(
    cda_id INT(10) NOT NULL AUTO_INCREMENT,
    codart INT(10) UNSIGNED NOT NULL,
    qte INT(10) NOT NULL,
    cda_date DATETIME NOT NULL DEFAULT NOW(),
    PRIMARY KEY(cda_id),
    FOREIGN KEY(`codart`) REFERENCES products(`pro_id`)
) ENGINE = INNODB

--Créer un déclencheur after_products_update sur la table products : lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.

DELIMITER |
CREATE trigger after_products_update after after_products_update
ON products FOR EACH ROW
BEGIN   
    IF NEW.pro_stock < NEW.pro_stock_alerte
    THEN
    INSERT INTO commander_articles (qte,codart) VALUE ((NEW.prostock - NEW.pro_stock_alerte), NEW.pro_id);
    END IF;
END
DELIMITER 