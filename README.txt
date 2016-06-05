A continuación se detallan lo que hemos considerado aspectos importantes a tener en cuenta en nuestra implementación del proyecto y que no están reflejados en otras zonas del mismo:

Respecto a los Administradores del sistema:
- En el sistema hay dos Administradores ("admin/admin" y "admin2/admin2") con el fin de poder probar apartados que hacen referencia a quien borro elementos del sistema.

Respecto a los Barters:
- Tras discutirlo y hablarlo con nuestro profesor de prácticas, decidimos que un user pueda cancelar su propio barter. En el Statement nos especifican que sólo lo puede hacer un admin pero tras discutirlo con nuestro ingeniero de requisitos, vimos positivo que un user lo pudiese hacer ya que podría haber vendido el objeto en cuestión en otro sitio o se pudo haber producido una avería o la pérdida del mismo, razón más que suficiente para cancelar tu propio barter.

Respecto a los Complaints:
- Un usuario no podrá crear un complaint relativo a un Barter suyo ya que carecería de sentido poder presentar una queja sobre algo creado por el mismo usuario que la presenta.

Respecto a las AutoReplies:
- Hemos decidido que las autoreplies sólo miren el contenido del cuerpo del mensaje dejando de lado el asunto porque nosotros entendemos como contenido de un mensaje, su cuerpo y no el conjunto formado por el cuerpo y el asunto, así que hemos visto innecesario incluir a los asuntos en el sistema de autoreplies.

- En caso de que un mensaje coincida con más de un autoreply del mismo usuario será respondido tantas veces como autoreplies de ese usuario coincidan con el fin de que no se ignore información.

- En caso de que un mensaje originado como autorrespuesta coincida con un autoreply del otro usuario este NO SERÁ AUTORRESPONDIDO con el fin de evitar bucles de autorrespuestas.


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

Respecto a las pruebas funcionales:
- El caso de uso que tiene una buena cobertura y al menos 10 test es el de crear un match y está situado en MatchServiceTest del cual hay 12 test, cuyos nombres comienzan por TestCreateMatch.


