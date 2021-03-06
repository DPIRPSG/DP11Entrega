A continuación se detallan lo que hemos considerado aspectos importantes a tener en cuenta en nuestra implementación del proyecto y que no están reflejados en otras zonas del mismo:

Respecto a las "queries":
- Para la query que realiza la acción "The most popular gym/s", hemos interpretado que se toma el gym con mayor número de feePayment activos a fecha de hoy. Se podría interpretar de otras formas pero vemos más lógico que un gym se considere popular respecto al número de usuarios activos y no respecto a su historial.

- Para la query que realiza la acción "The least popular gyms/s.", se toma el gym con el menor número de feePayment activos a fecha de hoy. Si el gym no tiene actualmente ningún feePayment activo, no se contará como el menos popular. Al igual que la query anterior, hay otras formas de interpretar lo que nos demandan pero vemos mejor no contabilizar los gimnasios sin feePayment activos ya que creemos que no aporta verdadera información. Creemos esto porque esta situación sólo ocurre cuando un gimnasio acaba de iniciarse o cuando está al borde de la bancarrota y por tanto será eliminado de los gimnasios disponibles.

- Para la query que realiza la acción "The average number of messages in an actors message boxes", ante la ambiegüedad del texto, lo hemos interpretado como la media de todos los mensajes enviados por todos los actor. Hemos decidido hacerlo así ya que es la forma más intuitiva de ver la actividad de los actores en el sistema de mensajes. 


Respecto al despliegue:
- Al desplegar el proyecto puede aparecer el error "java.lang.OutOfMemoryError: PermGen space" lo que provoca:
  + Que el servidor se estanque y no se pueda cargar el .war.
  + Que se muestre un mensaje al montar un .war tras hacer Undeploy de otro: FAIL - Deployed application at context path / but context failed to start.
  + Que se muestre un mensaje al montar un .war tras hacer Undeploy de otro: FAIL - Encountered exception javax.management.RuntimeErrorException: Error invoking method check.
- Se puede poner en otra ruta mientras otra instancia está corriendo sin hacer Undeploy.
- Para solucionar este error se pueden tomar dos opciones:
  + Opción 1: Vaciar cache
    - Hacer Undeploy de todas las aplicaciones de Tomcat (excepto "/manager"). En caso de que no se pueda se reinicia la maquina virtual y se hace Undeploy.
    - Después de hacer Undeploy en todas, es necesario reiniciar la máquina virtual.
    - Una vez reiniciada se puede volver a montar el .war.
  + Opción 2: Aumentar caché
    - Entrar en la configuración de Tomcat desde la bandeja de notificaciones
    - Ir a la pestaña "Java"
    - Al final de Java Options añadir las siguientes líneas:

        -Xms128m
        -Xmx1024m
        -XX:PermSize=64m
        -XX:MaxPermSize=256m

     PermSize refleja la capacidad del PermGen inicial, MaxPermSize refleja la cantidad máxima de PermGen, es decir, cuanto mayor sea, más proyectos vamos a poder cargar y descargar sin necesidad de reiniciar la máquina virtual para vaciar la cache.

Respecto a la clase Activity:
- Si no tiene customer apuntados, puedes editar todo. Si tiene customers, no puedes cambiar ni el servicio ni la room, si la nueva, se pretende que sea de un nuevo gimnasio. La razón de esta decisión es que consideramos que si nadie está apuntado en la actividad, no afecta a la coherencia del sistema. En cambio si ya hay gente apuntada, vemos que no tendría sentido cambiar de gimnasio, ya que los customers está apuntados a uno y no a otro, ni cambiar los servicios, ya que el customer, si ha elegido esa actividad es por ese servicio y no tiene sentido que se le cambie tras apuntarse.

- Una actividad no puede borrarse si tiene customers apuntados. Vemos como un requisito de calidad el que un gimnasio deba dar ese servicio aunque ocurra algo que le afecte. Los customers no deben preocuparse de que una actividad se pueda borrar, ellos se apuntan a una actividad y el gimnasio será el que tenga que gestionar la incidencia.

Respecto a Trainer:
- Si un trainer ya ha ejercido en un servicio, no se puede quitar ese servicio. Con esto nos evitamos incoherencias en la base de datos, tales como que un trainer que tuvo como especialidad un servicio, tiene una actividad con ese servicio que actualmente no tiene. Podría interpretarse por el admin como un fallo en el sistema, cuando no es así.