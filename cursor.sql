do $$
declare
	registro record;
	VehiculoStock cursor for SELECT
		vehiculo.id_vehiculo as vehiculo,
		vehiculo.modelo as modelovehiculo,
		marcas.nombre_marca as marcavehiculo,
		vehiculo.precio as preciovehiculo,
		vehiculo.stock_vehiculo as stockvehiculo
		from marcas
		INNER JOIN public.vehiculo on vehiculo.id_vehiculo = marcas.id_marca
		where vehiculo.stock_vehiculo > '0';
		
begin
for registro in VehiculoStock loop
raise notice 'Vehiculo: % 
Modelo vehiculo: % 
Marca vehiculo %
Valor vehiculo: % 
Stock: %',
registro.vehiculo, registro.modelovehiculo, registro.marcavehiculo, registro.preciovehiculo, registro.stockvehiculo;
end loop;
end $$
language 'plpgsql';
