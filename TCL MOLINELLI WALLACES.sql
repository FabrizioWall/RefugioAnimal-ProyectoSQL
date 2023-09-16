/*Inserto más paises en mi tabla, para completar.
	- Establezco SAVEPOINTS por si surgen inconvenientes
    - Confirmo la operación y libreo los SAVEPOINT*/
START TRANSACTION;
	INSERT INTO paises (id_pais, pais) VALUES ('10', 'Japan');
	INSERT INTO paises (id_pais, pais) VALUES ('11', 'Kenya');
	INSERT INTO paises (id_pais, pais) VALUES ('12', 'Lebanon');
	INSERT INTO paises (id_pais, pais) VALUES ('13', 'Mexico');
	INSERT INTO paises (id_pais, pais) VALUES ('14', 'Netherlands');
	INSERT INTO paises (id_pais, pais) VALUES ('15', 'Oman');
    SAVEPOINT ejercicio1;
	INSERT INTO paises (id_pais, pais) VALUES ('16', 'Peru');
	INSERT INTO paises (id_pais, pais) VALUES ('17', 'Qatar');
	INSERT INTO paises (id_pais, pais) VALUES ('18', 'Russia');
    SAVEPOINT ejercicio2;
	INSERT INTO paises (id_pais, pais) VALUES ('19', 'Spain');
	INSERT INTO paises (id_pais, pais) VALUES ('20', 'Turkey');
    
    SELECT *
    FROM paises;
	
COMMIT;
RELEASE SAVEPOINT ejercicio1;
RELEASE SAVEPOINT ejercicio2;

/*Elimino de mi tabla costos los id_producto mayores o iguales a 50 y luego revierto la operación*/
START TRANSACTION;
	DELETE FROM costos
    WHERE id_producto >= 50;
    
    SELECT *
    FROM costos;
    
ROLLBACK;

/*Actualizo las edades según el calculo de fecha de ingreso y la fecha actual*/
START TRANSACTION;
	
	SET SQL_SAFE_UPDATES = 0;
    UPDATE animales 
    SET edad_estimada_animal = (SELECT CEILING((DATEDIFF(curdate(), fecha_ingreso) /365)));
    
COMMIT;



