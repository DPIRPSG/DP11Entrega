A continuaci�n se detallan lo que hemos considerado aspectos importantes a tener en cuenta en nuestra implementaci�n del proyecto y que no est�n reflejados en otras zonas del mismo:

Respecto a los Barters:
- Tras discutirlo y hablarlo con nuestro profesor de pr�cticas, decidimos que un user pueda cancelar su propio barter. En el Statement nos especifican que s�lo lo puede hacer un admin pero tras discutirlo con nuestro ingeniero de requisitos, vimos positivo que un user lo pudiese hacer ya que podr�a haber vendido el objeto en cuesti�n en otro sitio o se pudo haber producido una aver�a o la p�rdida del mismo, raz�n m�s que suficiente para cancelar tu propio barter.

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
