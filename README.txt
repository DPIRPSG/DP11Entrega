A continuaci�n se detallan lo que hemos considerado aspectos importantes a tener en cuenta en nuestra implementaci�n del proyecto y que no est�n reflejados en otras zonas del mismo:

Respecto a los Administradores del sistema:
- En el sistema hay dos Administradores ("admin/admin" y "admin2/admin2") con el fin de poder probar apartados que hacen referencia a quien borro elementos del sistema.

Respecto a los Barters:
- Tras discutirlo y hablarlo con nuestro profesor de pr�cticas, decidimos que un user pueda cancelar su propio barter. En el Statement nos especifican que s�lo lo puede hacer un admin pero tras discutirlo con nuestro ingeniero de requisitos, vimos positivo que un user lo pudiese hacer ya que podr�a haber vendido el objeto en cuesti�n en otro sitio o se pudo haber producido una aver�a o la p�rdida del mismo, raz�n m�s que suficiente para cancelar tu propio barter.

Respecto a los Complaints:
- Un usuario no podr� crear un complaint relativo a un Barter suyo ya que carecer�a de sentido poder presentar una queja sobre algo creado por el mismo usuario que la presenta.

Respecto a las AutoReplies:
- Hemos decidido que las autoreplies s�lo miren el contenido del cuerpo del mensaje dejando de lado el asunto porque nosotros entendemos como contenido de un mensaje, su cuerpo y no el conjunto formado por el cuerpo y el asunto, as� que hemos visto innecesario incluir a los asuntos en el sistema de autoreplies.

- En caso de que un mensaje coincida con m�s de un autoreply del mismo usuario ser� respondido tantas veces como autoreplies de ese usuario coincidan con el fin de que no se ignore informaci�n.

- En caso de que un mensaje originado como autorrespuesta coincida con un autoreply del otro usuario este NO SER� AUTORRESPONDIDO con el fin de evitar bucles de autorrespuestas.


Respecto al despliegue:
- Al desplegar el proyecto puede aparecer el error "java.lang.OutOfMemoryError: PermGen space" lo que provoca:
  + Que el servidor se estanque y no se pueda cargar el .war.
  + Que se muestre un mensaje al montar un .war tras hacer Undeploy de otro: FAIL - Deployed application at context path / but context failed to start.
  + Que se muestre un mensaje al montar un .war tras hacer Undeploy de otro: FAIL - Encountered exception javax.management.RuntimeErrorException: Error invoking method check.
- Se puede poner en otra ruta mientras otra instancia est� corriendo sin hacer Undeploy.
- Para solucionar este error se pueden tomar dos opciones:
  + Opci�n 1: Vaciar cache
    - Hacer Undeploy de todas las aplicaciones de Tomcat (excepto "/manager"). En caso de que no se pueda se reinicia la maquina virtual y se hace Undeploy.
    - Despu�s de hacer Undeploy en todas, es necesario reiniciar la m�quina virtual.
    - Una vez reiniciada se puede volver a montar el .war.
  + Opci�n 2: Aumentar cach�
    - Entrar en la configuraci�n de Tomcat desde la bandeja de notificaciones
    - Ir a la pesta�a "Java"
    - Al final de Java Options a�adir las siguientes l�neas:

        -Xms128m
        -Xmx1024m
        -XX:PermSize=64m
        -XX:MaxPermSize=256m

     PermSize refleja la capacidad del PermGen inicial, MaxPermSize refleja la cantidad m�xima de PermGen, es decir, cuanto mayor sea, m�s proyectos vamos a poder cargar y descargar sin necesidad de reiniciar la m�quina virtual para vaciar la cache.

Respecto a las pruebas funcionales:
- El caso de uso que tiene una buena cobertura y al menos 10 test es el de crear un match y est� situado en MatchServiceTest del cual hay 12 test, cuyos nombres comienzan por TestCreateMatch.


