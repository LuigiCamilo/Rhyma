# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Limpiando datos previos.."
User.destroy_all
Theme.destroy_all
puts "Datos descartados!"

themes = ["Teoria musical", "Instrumentos de viento", "Instrumentos de cuerdas", "Instrumentos de percusión", "Instrumentos eléctricos", "Canto", "Otros" ]
themes.each do |theme|
  theme_new = Theme.create(title: theme)
  theme_new.save
end

puts "temas creados"
puts "Creando Usuarios..."
# db/seeds.rb
# Users
luigi = User.create!(
  nickname: 'luigidim',
  email: 'luigic22@gmail.com',
  password: '123456',
  first_name: 'Luigi',
  last_name: 'Di Martino',
  bio: 'Hola!, soy Luigi. Canto, toco piano y me apasiona enseñar',
  linkedin: 'https://www.linkedin.com/in/luigi-di-martino-torres/',
  instagram: 'luigicamilo',
  tiktok: 'camiloluigi'
)
luigi.photo.attach(io: File.open('app/assets/images/profiles/luigi.jpg'), filename: 'luigi.jpg', content_type: 'image/jpeg')
yonathan = User.create!(
  nickname: 'yoni',
  email: 'yonathanpalmarey@gmail.com',
  password: '123456',
  first_name: 'Yonathan',
  last_name: 'Palma',
  bio: 'Hola!, soy Yonathan. Me gustan los intrumentos de viento y me especializo en la flauta',
  linkedin: 'https://www.linkedin.com/in/yonathan-palma-8465532a6/',
  instagram: 'yonathan_palma',
  tiktok: 'yonathan_palma'
)
yonathan.photo.attach(io: File.open('app/assets/images/profiles/yonathan.jpg'), filename: 'yonathan.jpg', content_type: 'image/jpeg')

rossemil = User.create!(
  nickname: 'oridango',
  email: 'orianamazo@gmail.com',
  password: '123456',
  first_name: 'Rossemil',
  last_name: 'Mazo',
  bio: 'Hola!, soy Ross. Me gustan los instrumentos de cuerda. Mi favorito es el banjo',
  linkedin: 'https://www.linkedin.com/in/rossemilmazo/',
  instagram: '',
  tiktok: ''
)
rossemil.photo.attach(io: File.open('app/assets/images/profiles/rossemil.jpg'), filename: 'rossemil.jpg', content_type: 'image/jpeg')

ari = User.create!(
  nickname: 'arigo',
  email: 'ariannargt@gmail.com',
  password: '123456',
  first_name: 'Arianna',
  last_name: 'Gonzalez',
  bio: 'Hola!, soy Ari. Tengo 5 años dando clases de música',
  linkedin: 'https://www.linkedin.com/in/arianna-gonz%C3%A1lez/',
  instagram: 'arigon_z',
  tiktok: 'arichiquita'
)
ari.photo.attach(io: File.open('app/assets/images/profiles/ari.jpg'), filename: 'ari.jpg', content_type: 'image/jpeg')
puts "Usuarios creados!"

# Nombre de los cursos
courses = [
  { title: 'Teoría Musical. Conceptos Básicos. Tutoriales', image: 'conceptos_basicos.jpg', published: true, theme_id: Theme.where('title = ?', themes[0]).first.id },
  { title: 'Aprende a tocar el piano con mi curso de Piano Básico', image: 'piano_curso.jpg', published: true, theme_id: Theme.where('title = ?', themes[2]).first.id },
  { title: 'Cantar desde Cero para Principiantes', image: 'canto_curso.jpg', published: true, theme_id: Theme.where('title = ?', themes[5]).first.id },
  { title: 'Guitarra para principiantes', image: 'guitarra_curso.jpg', published: true, theme_id: Theme.where('title = ?', themes[2]).first.id },
  { title: 'Batería desde 0: Primeros Pasos, Curso Intensivo', image: 'bateria_curso.jpg', published: true, theme_id: Theme.where('title = ?', themes[3]).first.id },
  { title: 'Como tocar guitarra eléctrica', image: 'electrica_curso.jpg', published: true, theme_id: Theme.where('title = ?', themes[4]).first.id }
]
# Descripciones detalladas para cada curso
contents = {
  'El Círculo de Quintas' => '<p>El círculo de quintas permite comprender visualmente la relación entre las tonalidades y los acordes. Por ejemplo, puedes utilizar el círculo de quintas para:</p>
                               <ul><li>Recordar las armaduras de clave. La parte superior del círculo muestra la tonalidad de do mayor sin sostenidos ni bemoles. Por cada paso en el sentido de las agujas del reloj se añade un sostenido (♯) a la armadura. Por cada paso en sentido contrario a las agujas del reloj se añade un bemol (♭) a la armadura.</li>
                                <li>Componer música. La idea para una canción puede empezar con unos cuantos acordes que suenen bien juntos. Los tres acordes mayores y los tres acordes menores dentro de cualquier cuarto del círculo pertenecen a la misma tonalidad y, por lo tanto, suenan bien juntos.</li>
                                <li>Transportar acordes. Los acordes de una canción pueden colocarse en el círculo de quintas y posteriormente transportarse moviendo el patrón de acordes alrededor del círculo. Por ejemplo, coloca los acordes de do, fa y sol en el círculo de quintas. El do está en el centro, el fa está un paso en sentido contrario a las agujas del reloj y el sol está un paso hacia el lado de las agujas del reloj. Al transportar a la mayor, los acordes son la, re y mi.</li></ul>',
  'Cómo leer partituras: El Endecagrama Primigenio' => '<p>Para leer una partitura, se pueden seguir los siguientes pasos:</p>
                                                      <ul><li>Observar la clave para saber qué notas representan las líneas y espacios de la partitura.</li>
                                                      <li>Observar la clave para saber qué notas representan las líneas y espacios de la partitura.</li> <li> Fijarse en la duración de las notas para saber cuánto tiempo debes tocar cada una.</li> <li> Leer los signos de articulación para saber cómo debes tocar cada nota.</li> <li> Tomar en cuenta los signos de dinámica para saber la intensidad de la música.</li> <li>  Conocer el pentagrama, que consta de 5 líneas y 4 espacios, que sirven para colocar las notas musicales. Cada línea y cada espacio están relacionados con una nota, que viene determinada por la clave</li></ul>',
  '¿Por qué medimos el ritmo así?' => '<h3>Introducción:</h3>
                                        <p>Hola a todos, hoy vamos a hablar sobre cómo medimos el ritmo en la música. El ritmo es como el latido del corazón de una canción, ¡y es lo que nos hace querer mover los pies!</p>
                                        <h3>Compases y Pulsos:</h3>
                                        <p>Para empezar, tenemos que entender dos conceptos importantes: los compases y los pulsos.</p>
                                        <p>Imaginemos que estamos en una clase de matemáticas musical. Los compases son como los bloques de tiempo en los que dividimos la música. ¿Alguna vez han contado hasta cuatro? ¡Eso es un compás de 4/4! ¿O tal vez han contado hasta tres? ¡Eso es un compás de 3/4! Los compases nos ayudan a organizar la música en partes fácilmente contables.</p>
                                        <p>Ahora, dentro de cada compás, tenemos pulsos. Los pulsos son como los latidos de un reloj. Uno, dos, tres, cuatro... ¡estos son los pulsos! Y a veces, uno de esos pulsos es más fuerte que los demás. ¿Alguna vez has escuchado una canción y has sentido que alguien te está dando golpecitos en el hombro en ciertos momentos? ¡Eso son los pulsos acentuados!</p>
                                        <h3>Conclusión:</h3>
                                        <p>Así que, amigos, medimos el ritmo en la música utilizando compases y pulsos. Esto nos ayuda a entender la estructura y sentir la energía de la música. La próxima vez que escuchen una canción, ¡vean si pueden encontrar los compases y los pulsos! ¡Y recuerden, la música es matemática y magia al mismo tiempo!</p>',
  '¿Qué es un acorde?. Tipos de Acordes' => '<p>Un acorde es un grupo de tres o más notas que suenan juntas y crean un sonido armonioso. Los acordes son una parte fundamental de la música, ya que se utilizan para acompañar melodías, crear progresiones armónicas y dar color y profundidad a una composición.</p>
                                <p>Existen varios tipos de acordes, pero los más comunes son:</p>
                                <ol><li> Acorde Mayor: Este es un tipo de acorde que suena brillante y alegre. Se forma tomando la primera, tercera y quinta nota de una escala mayor. Por ejemplo, en la tonalidad de Do mayor, el acorde de Do mayor se forma utilizando las notas Do, Mi y Sol.
                                <li> Acorde Menor: A diferencia del acorde mayor, el acorde menor suena más oscuro y melancólico. Se forma tomando la primera, tercera y quinta nota de una escala menor. Por ejemplo, en la tonalidad de La menor, el acorde de La menor se forma utilizando las notas La, Do y Mi.</li>
                                <li> Acorde Disminuido: Este acorde tiene un sonido tenso y disonante. Se forma tomando la primera, tercera y quinta nota de una escala menor disminuida. Por ejemplo, el acorde de Do disminuido se forma utilizando las notas Do, Mi bemol y Sol bemol.</li>
                                <li> Acorde Aumentado: Al contrario del acorde disminuido, este acorde suena tenso pero con un carácter más brillante. Se forma tomando la primera, tercera y quinta nota de una escala aumentada. Por ejemplo, el acorde de La aumentado se forma utilizando las notas La, Do sostenido y Mi sostenido.</li></ol>
                                <p>Estos son solo algunos de los tipos de acordes más comunes, pero hay muchos más que se pueden explorar. Los acordes son una herramienta poderosa en la música para crear emociones y ambientes diferentes, y dominar su uso es esencial para cualquier músico</p>',
  '¿Qué es una escala musical?' => '<p>Una escala musical es una serie de notas organizadas de manera ascendente o descendente según una secuencia específica de tonos y semitonos. Las escalas son como las "reglas" básicas de la música, proporcionando un conjunto de notas para crear melodías y armonías</p>.
                                <p>Por ejemplo, la escala de Do mayor está formada por las notas Do, Re, Mi, Fa, Sol, La, Si y luego vuelve a Do. Esta secuencia sigue una pauta específica de tonos y semitonos entre cada nota, lo que da a la escala su carácter único.</p>
                                <p>Las escalas son fundamentales para entender la música y son la base sobre la cual se construyen muchas composiciones. Ayudan a establecer el tono y la atmósfera de una pieza musical, así como a proporcionar un marco para la improvisación y la composición.</p>
                                <p>En resumen, una escala musical es una serie de notas organizadas según una secuencia específica de tonos y semitonos, y son esenciales para la creación y comprensión de la música.<p>',
  '¿Qué es un intervalo musical?' => '<p>Un intervalo musical es la distancia entre dos notas musicales diferentes. Es una medida de la relación de altura entre las notas y es fundamental en la teoría musical y en la construcción de acordes y melodías.</p>
                                <p>Los intervalos se clasifican según dos características principales: su nombre y su calidad.</p>
                                <ol><li> Nombre del intervalo: El nombre de un intervalo se basa en el número de notas que lo componen. Por ejemplo, si la distancia entre dos notas es de tres tonos, se llama un intervalo de tercera. Los nombres de los intervalos van desde la segunda hasta la octava.</li>
                                <li>Calidad del intervalo: La calidad de un intervalo se refiere a cómo suena en términos de mayor o menor, justo, disminuido o aumentado. Por ejemplo, una tercera mayor tiene una calidad diferente a una tercera menor. La calidad de un intervalo se basa en la distancia exacta entre las dos notas.</li>
                                Ahora, hablemos de algunos ejemplos comunes de intervalos:
                                <li>Segunda mayor: La distancia entre Do y Re en la escala de Do mayor.</li>
                                <li>Tercera menor: La distancia entre Do y Mi bemol en la escala de Do mayor.</li>
                                <li>Quinta justa: La distancia entre Do y Sol en la escala de Do mayor.</li>
                                <li>Octava perfecta: La distancia entre Do y Do una octava más arriba o más abajo.</li></ol>
                                <p>Estos son solo algunos ejemplos, pero hay muchos más intervalos que se pueden explorar. Los intervalos son importantes porque forman la base de la armonía y la melodía en la música, y entender cómo funcionan nos ayuda a componer, interpretar y entender la música de una manera más profunda.</p>',
  '¿Qué son las tonalidades?' => '<p>Vamos a hablar sobre tonalidades en esta clase de música. Las tonalidades son como los colores en una paleta musical, ¿han escuchado hablar de eso? Bueno, déjenme explicarles un poco más.<p/>
                                  <p>En la música, utilizamos una serie de notas musicales para crear melodías y armonías. Esta serie de notas se llama escala. Una de las escalas más comunes es la escala mayor. Por ejemplo, la escala de Do mayor está formada por las notas Do, Re, Mi, Fa, Sol, La, Si, y luego vuelve a Do.</p>
                                  <p>Ahora, una tonalidad se construye utilizando una escala mayor como base. La nota principal de esa escala se convierte en lo que llamamos la "tónica" de la tonalidad. Por ejemplo, si utilizamos la escala de Do mayor como base, Do se convierte en la tónica. Entonces, si una pieza musical está en la tonalidad de Do mayor, significa que la mayoría de las notas y acordes en esa pieza se centrarán alrededor de la nota Do.</p>
                                  <p>Pero, ¿qué pasa si queremos expresar diferentes emociones o sensaciones en la música? Bueno, aquí es donde entran las diferentes tonalidades. Podemos usar las mismas notas, pero cambiar la tónica, lo que cambia la relación entre esas notas y, por lo tanto, el carácter emocional de la música.</p>
                                  <p>Por ejemplo, si cambiamos la tónica de Do a La, ahora estamos en la tonalidad de La mayor. Las mismas notas, pero ahora nuestra "casa musical" es La en lugar de Do. Esto puede dar una sensación diferente a la música, ya que los acordes y las progresiones estarán centrados en La en lugar de Do.</p>
                                  <p>Las tonalidades nos permiten explorar una amplia gama de emociones y sensaciones en la música, desde lo brillante y alegre hasta lo oscuro y melancólico. Así que la próxima vez que escuchen una canción, ¡presten atención a la tonalidad y cómo afecta el estado de ánimo de la música!</p>',
  'Piano Básico' => '<p>Si siempre has querido tocar el piano y nunca has sabido por dónde empezar, este es tu curso.</p><p>Voy a llevarte de no saberte ni los nombres de las notas, a saber tocar los acompañamientos de tus canciones preferidas.</p> <p>Para que puedas disfrutar de hacer música y te des cuenta de que el piano sí es para ti. </p><p>Este curso es el comienzo del Método Musihacks, empezarás a ver el teclado como un sistema, tocando canciones desde la primera lección, y te desbloqueará las habilidades esenciales para el resto de cursos.</p>',
  'Piano Melodías' => '<p>En este curso te voy a enseñar a tocar algunas de las melodías más famosas de la historia. Haremos un viaje por la música y tocaremos Pop, Rock, Música Clásica, Jazz y hasta Bandas Sonoras. Tus manos van a despertar.</p><p>Tocaremos canciones de Queen, The Beatles, La Oreja de Van Gogh, Ed Sheeran, Olivia Rodrigo, El Viaje de Chihiro, El Padrino... y un montón de temazos más. Desde el principio estarás aprendiendo a través de las canciones que más te motivan. </p> <p>La clave de todo será ver cómo la melodía que toca la mano derecha se construye sobre notas de los acordes que toca la mano izquierda. Eso te permitirá tocar a dos manos sin frustrarte, porque entenderás cómo se relacionan y no memorizarás nota a nota sin entender.</p><p>Y te voy a enseñar a leer tus primeras partituras sencillas en clave de sol, con un método que te ayudará a entender el pentagrama claramente desde la primera lección.</p>',
  'Piano Partituras' => '<p>En esta lectura vamos a preparar 2 conciertos para explorar todo el teclado. En el Concierto de Cristal te enseñaré a tocar cristalino en los agudos y a emocionar con el piano. Y en el Concierto de Mercurio aprenderemos a trabajar los graves y sonar con fuerza.</p><p>Aprenderás 8 técnicas clave para lucirte con el piano, que te desbloquearán versiones avanzadas de miles de canciones. +100 de ellas te las daré en el Pack Avanzado de Partituras de Musihacks.</p><p> Vamos a aprender a tocar partituras completas, a dos manos, en clave de sol y clave de fa. Empezaremos escribiendo el nombre dentro de las notas y poco a poco lo quitaremos para que puedas leer cualquier partitura que te encuentres ahí fuera.</p> <p>Trabajaremos los compases más habituales (2/4, 3/4, 4/4, 6/8, 9/8, 12/8). Tocaremos con dinámicas e indicaciones de tempo con una buena dosis de italiano (pianissimo, piano, forte, fortissimo, crescendo, diminuendo, accelerando, ritardando...) y profundizaremos en el uso del pedal.</p>',
  'Piano Acompañamientos' => '<p>En este curso vamos a llevar tu entendimiento de la música al siguiente nivel. Vas a pasar de Charmeleon a Charizard. </p> <p> Tocaremos arpegios, acordes quebrados, bajos con notas de paso, séptimas y adornos como sus2, sus4, add2 y add4. Conceptos que a lo mejor ahora mismo no te dicen nada, pero son ese toque especial que hacen que algunas canciones suenen mágicas. Y los vamos a entender todos.</p><p>Y profundizaremos mucho en tu relación con los acordes, visualizando su estado fundamental y sus inversiones. Eso te abrirá la mente y te permitirá entender mucho mejor la estructura de la melodía y los acompañamientos de canciones avanzadas, viéndolos como los vemos los pianistas.</p>',
  'Lección 1' => '<p>¿A quién no le gustaría cantar bien y tener ese recurso tan magnífico para lucir su voz cuando quiera y donde quiera? Lo cierto es que aprender a cantar es un viaje que será diferente para cada quién, dado que tu voz es un instrumento único y tu fisionomía tiene capacidades que otros quizás no tengan. Además, dependiendo de tus metas individuales y estilo de aprendizaje verás que cantar es proceso que se puede ir mejorando con la práctica y el tiempo.<p>
                  <h3>Comienza por comprender los conceptos básicos del Canto</h3>
                  <ul><li>Entender Tu Voz: Tu voz es única y puede tener un rango específico. El rango vocal se refiere a todas las notas que puedes cantar, desde la más baja hasta la más alta. Los rangos vocales suelen clasificarse en categorías como soprano, mezzosoprano, contralto, tenor, barítono y bajo</li><li>Respiración y Apoyo: Cantar es un acto físico y requiere que aprendas a controlar tu respiración. Deberías aprender a respirar desde el diafragma, cosa que hacías perfecto cuando eras un bebe. Además esto te dará más control y te permitirá sostener notas durante más tiempo y uniformemente. El «apoyo» es la idea de usar la potencia de tu respiración para cantar de manera más eficaz.</li><li>Afinación: La afinación se refiere a la capacidad de cantar en tono, es decir, acertar las notas exactas en la música. Cantar desafinado es cantar demasiado alto (agudo) o demasiado bajo (grave) en comparación con la melodía deseada. Una buena afinación es fundamental para un canto efectivo. la mayoría de personas tienen la capacidad de distinguir los tonos, por lo que no será difícil para tí encontrar la diferencia entre dos notas en cuanto sepas identificar qué es agudo y qué es grave.</li><li>Control del Volumen: La dinámica en la música se refiere a lo fuerte o suave que es el sonido. En el canto, necesitas aprender a controlar tu volumen para que puedas cantar suave o fuerte cuando sea necesario en la canción, eso sí sin que se escuche forzado o haciéndole daño a tu voz.</li><li>Tono: El tono se refiere al color o la calidad de tu voz. Puede ser cálido, oscuro, brillante, ligero, pesado, etc. Cada cantante tiene un tono único que puede ser trabajado y mejorado con la práctica y la técnica.</li><li>Articulación: La articulación es la claridad de la pronunciación y la enunciación. Es importante que el público entienda las palabras que estás cantando. La articulación también puede afectar el ritmo de la canción.</li><li>Resonancia: La resonancia es el proceso de amplificación y enriquecimiento del sonido de tu voz. Cuando cantas, el sonido de tu voz resuena (o vibra) en diferentes partes de tu cuerpo como la garganta, la boca y la nariz. Un buen canto utiliza eficazmente estas áreas de resonancia para producir un sonido completo y rico.</li><li>Registro Vocal: El registro vocal se refiere a las diferentes «áreas» de la voz que se utilizan para producir sonido, que suelen clasificarse en pecho, cabeza y falsete. El registro de pecho es la voz más baja y más rica, el registro de cabeza es más alto y más brillante, y el falsete es un registro aún más alto.</li></ul>',
  'Lección 2' => '<p>El compromiso y la actitud hacia tu voz, es lo primordial para avanzar en este camino.</p><p>¿Por qué es importante practicar regularmente?: En esta sección, explica cómo la práctica regular ayuda a los cantantes a mejorar la técnica, expandir el rango vocal, y ganar confianza. Puedes hablar sobre cómo la práctica constante ayuda a fortalecer los músculos vocales, mejora la memoria muscular, y permite a los cantantes explorar diferentes estilos y técnicas.</p><p> ¿Cuánto deberías practicar?: ¿Con cuánto tiempo dispones para practicar? Yo te empezaría preguntando, a qué te dedicas y cuánto tiempo tienes para regalarle a tu voz. Aunque la respuesta variará dependiendo de cada individuo, puedes dar algunas recomendaciones generales. Por ejemplo, podrías sugerir practicar al menos 30-45 minutos al día para los principiantes, y aumentar gradualmente la duración a medida que se desarrolla la resistencia vocal. </p><p>Cómo organizar tu práctica: Puedes recomendar empezar con un calentamiento vocal, luego trabajar en ejercicios de técnica vocal, seguido de la práctica de canciones, y finalmente un enfriamiento vocal. Una buena idea podría ser organizar tu día para que tengas tiempo suficiente para ensayar 30 minutos por la mañana y 30 minutos por la tarde. Pero, esta sugerencia debería venir directamente de tu coach personal y de tu disponibilidad de tiempo.</p><p> Consejos para practicar eficazmente: Establecer metas para cada sesión, practicar con un piano o una pista de acompañamiento para mejorar la afinación, grabarse a uno mismo para recibir retroalimentación, y mantener un diario de práctica para rastrear el progreso.</p><p> Mantener la motivación para practicar: La práctica regular puede ser un desafío si se pierde la motivación. Quisiera llenarte de motivación en pocas palabras, pero lo que a mi me ha funcionado es enfocarme en metas cortas, hacer propósitos mensuales que me permitan abordar una estrategia a mediano o largo plazo. Ideas como seleccionar canciones que se disfruten para la práctica, recompensarse a uno mismo por alcanzar metas de práctica, y recordar que todos los cantantes, incluso los profesionales, están en un viaje de aprendizaje y mejora continua.</p>',
  'Lección 3' => '<p>Ampliar el rango vocal es un proceso que requiere tiempo, paciencia y práctica constante. Aquí tienes algunos consejos para ayudarte a mejorar tu rango vocal:<p>
                  <ul><li>Calentamiento vocal: Antes de comenzar cualquier ejercicio de ampliación de rango, es crucial calentar la voz adecuadamente. Los ejercicios de respiración y vocalización pueden ayudar a preparar tus cuerdas vocales para el trabajo más intenso.</li>
                      <li>Ejercicios de respiración: La respiración adecuada es fundamental para ampliar el rango vocal. Practica ejercicios de respiración profunda y controlada para fortalecer tus músculos respiratorios y mejorar la capacidad pulmonar.</li>
                      <li>Ejercicios de vocalización: Realiza ejercicios de vocalización que te ayuden a explorar todo tu rango vocal, desde las notas más bajas hasta las más altas. Comienza con escalas simples y luego avanza a ejercicios más desafiantes que involucren intervalos más amplios.</li>
                      <li>Entrenamiento auditivo:Desarrolla tu capacidad auditiva para reconocer diferentes notas y tonos. Esto te ayudará a afinar tu voz y a cantar con mayor precisión en todo tu rango vocal.</li>
                      <li>Técnica vocal adecuada:Asegúrate de utilizar una técnica vocal adecuada en todo momento. Esto incluye mantener una postura correcta, relajar los músculos de la garganta y proyectar la voz desde el diafragma en lugar de forzarla desde la garganta.</li>
                      <li>Practica regular: La consistencia es clave. Dedica tiempo regularmente a practicar ejercicios de ampliación de rango vocal. Puede ser útil establecer un horario de práctica y seguirlo de manera disciplinada.</li>
                      <li>Descanso y cuidado de la voz: No sobrecargues tus cuerdas vocales. Descansa lo suficiente entre sesiones de práctica y evita cantar en exceso. Además, asegúrate de mantener una hidratación adecuada y evitar situaciones que puedan dañar tu voz, como el humo del tabaco o ambientes con mucho polvo.</li>
                      <li>Técnica vocal adecuada:Asegúrate de utilizar una técnica vocal adecuada en todo momento. Esto incluye mantener una postura correcta, relajar los músculos de la garganta y proyectar la voz desde el diafragma en lugar de forzarla desde la garganta.</li>
                  </ul>',
  'Lección 4' => '<p>Cantar una canción desde cero puede ser un proceso gratificante y divertido. Aquí tienes una guía paso a paso para ayudarte a aprender y cantar una canción desde el principio:</p>
                  <ol>
                    <li><strong>Escoge una canción adecuada:</strong> Elige una canción que se ajuste a tu estilo vocal y nivel de habilidad. Puedes comenzar con una canción que te guste y que tenga un rango vocal accesible para ti.</li>
                    <li><strong>Escucha la canción:</strong> Escucha la canción varias veces para familiarizarte con la melodía, la letra y el ritmo. Presta atención a los detalles como la entonación, la dinámica y el estilo vocal del cantante original.</li>
                    <li><strong>Estudia la letra:</strong> Toma tiempo para leer y comprender la letra de la canción. Asegúrate de entender el significado de las palabras y frases para poder expresarlas con emoción cuando cantes.</li>
                    <li><strong>Identifica el tono de la canción:</strong> Determina la tonalidad de la canción para poder encontrar la nota de partida. Puedes utilizar un teclado, una guitarra u otra herramienta para ayudarte a encontrar la tonalidad correcta.</li>
                    <li><strong>Practica la melodía:</strong> Comienza a cantar la melodía de la canción, nota por nota, asegurándote de mantener la entonación correcta. Puedes utilizar solfeo o simplemente cantar junto con la pista grabada.</li>
                    <li><strong>Trabaja en la técnica vocal:</strong> Presta atención a tu técnica vocal mientras practicas la canción. Enfócate en la respiración adecuada, la proyección de la voz, la articulación clara y el control del tono.</li>
                    <li><strong>Memoriza la letra y la melodía:</strong> Una vez que te sientas cómodo con la melodía y la letra, comienza a memorizar la canción. Esto te ayudará a concentrarte en la interpretación y la expresión cuando cantes.</li>
                    <li><strong>Interpreta la canción:</strong> Cuando te sientas seguro con la melodía y la letra, comienza a agregar tu propia interpretación y estilo a la canción. Experimenta con diferentes dinámicas, matices vocales y expresiones emocionales para hacer la canción tuya.</li>
                    <li><strong>Practica regularmente:</strong> Dedica tiempo regularmente a practicar la canción. Cuanto más practiques, más cómodo te sentirás cantando la canción y más podrás perfeccionar tu interpretación.</li>
                    <li><strong>Graba y evalúa tu rendimiento:</strong> Graba tu interpretación de la canción y escúchala para identificar áreas de mejora. Presta atención a la entonación, la pronunciación y la expresión, y trabaja en aquellos aspectos que necesiten ajustes.</li>
                  </ol>
  <p>Recuerda que cantar una canción desde cero requiere tiempo, paciencia y práctica constante. ¡Disfruta del proceso y diviértete expresándote a través de la música!</p>',
  'Lección 5' => '<p>Aprender sobre los tipos de voz es fundamental para entender cómo funcionan las voces humanas y cómo utilizarlas de manera efectiva. Aquí tienes un resumen de lo que necesitas saber sobre los tipos de voz:</p>
                  <ol>
                    <li><strong>Soprano:</strong> Las sopranos son las voces más agudas en la clasificación vocal femenina. Tienen la capacidad de cantar notas altas con claridad y fuerza. Las sopranos pueden subdividirse en soprano ligera, soprano coloratura, soprano lírica y soprano dramática, dependiendo de su timbre y características vocales específicas.</li>
                    <li><strong>Mezzosoprano:</strong> Las mezzosopranos tienen una voz más cálida y oscura que las sopranos, y su rango vocal se sitúa entre el de las sopranos y el de las contraltos. Son capaces de cantar tanto notas altas como bajas con facilidad y suelen interpretar roles de personajes más maduros en óperas y musicales.</li>
                    <li><strong>Contralto:</strong> Las contraltos son las voces femeninas más graves y tienen un timbre rico y oscuro. Tienen la capacidad de cantar en un registro más bajo que las sopranos y las mezzosopranos, y suelen interpretar roles de personajes masculinos o ancianos en la música clásica.</li>
                    <li><strong>Tenor:</strong> Los tenores son las voces masculinas más agudas en la clasificación vocal. Tienen la capacidad de cantar notas altas con potencia y claridad. Los tenores pueden subdividirse en tenor ligero, tenor lírico, tenor spinto y tenor dramático, dependiendo de su timbre y características vocales específicas.</li>
                    <li><strong>Barítono:</strong> Los barítonos tienen una voz media en la clasificación vocal masculina. Su rango vocal se sitúa entre el de los tenores y el de los bajos, y tienen la capacidad de cantar tanto notas altas como bajas con facilidad. Los barítonos suelen interpretar roles de protagonistas masculinos en óperas y musicales.</li>
                    <li><strong>Bajo:</strong> Los bajos son las voces masculinas más graves en la clasificación vocal. Tienen un timbre profundo y resonante y su rango vocal se sitúa en el extremo inferior del espectro vocal masculino. Los bajos suelen interpretar roles de personajes autoritarios o villanos en la música clásica.</li>
                  </ol>
                  <p>Es importante recordar que cada voz es única y puede tener características individuales que no se ajusten perfectamente a estas clasificaciones. Sin embargo, entender los tipos de voz puede ayudarte a identificar tu propio rango vocal y a elegir repertorio adecuado para tu voz.</p>',
  'Lección 1: Posición' => '<p>En esta primera lección de nuestro Curso de guitarra para principiantes vamos a trabajar tres aspectos importantes, veremos las partes de la guitarra, la posición correcta que debemos tomar en el instrumento y por último hablaremos acerca de cómo acondicionarnos físicamente para iniciar nuestra formación musical.</p>
                            <ul><li>Partes de la guitarra: En esta sección de la lección hablaremos acerca de las partes del instrumento, el clavijero, los puentes, los trastes y las tapas, hablaremos acerca de las partes delicadas de la guitarra, esas que debemos cuidar y de las cosas que podemos esperar si tenemos una guitarra en casa desde hace muchos años sin ser tocada.</li>
                            <li>Posición de la guitarra: En esta parte de la lección hablaremos acerca de la regla de las tres "P", esa que nos indica la posición de la guitarra sobre la pierna izquierda, la posición del pulgar en la mano derecha y la posición del pulgar en la mano izquierda, como veremos gran parte de la posición viene determinada por como coloquemos nuestros pulgares en el instrumento. </li>
                            <li>Acondicionamiento: Tocar guitarra es algo que requiere un esfuerzo físico, una posición que no es natural para el cuerpo, por esa razón es necesario acondicionarnos, en esta lección de nuestro curso de guitarra para principiantes veremos dos ejercicios para mano izquierda y dos para mano derecha, no solo nos van a acostumbrar a las cuerdas, nos ayudarán también a desarrollar una buena postura frente a la guitarra.</li></ul>',
  'Lección 2: Cambio de cuerdas y afinación' => '<p>En esta Clase de guitarra de nuestro Curso de guitarra para principiantes veremos tres conceptos muy importantes, como hacer un cambio de cuerdas a nuestra guitarra, como afinarla con la ayuda de un afinador electrónico o una aplicación y terminaremos la lección aprendiendo nuestros primeros acordes, tres elementos vitales si quieres aprender a tocar guitarra.</p>
                                                <h3>Cómo hacer un cambio de cuerdas</h3><p>En esta Clase de guitarra iniciamos aprendiendo a cambiar las cuerdas de nuestro instrumento, esto es importante, ya que las cuerdas influyen mucho en el sonido de la guitarra, la vida útil de unas cuerdas es de tres a seis meses dependiendo del uso que se le dé al instrumento, por esta razón debemos revisar que tanto trabajo le hemos dado y su estado para saber si es necesario cambiarlas. Cuando se hace un cambio de cuerdas es necesario cambiarlas una a una, de esta forma el instrumento sufre poco por el cambio de tensión, nos ayuda a conservar mejor la madera, la idea es cambiar una cuerda, afinarla y pasar a la siguiente.</p>
                                                <h3>Cómo afinar la guitarra</h3><p>Cuando se está comenzando no es muy útil intentar afinar la guitarra a oído, no se sabe la sonoridad de las cuerdas y el oído no se encuentra entrenado, es preferible adquirir un afinador electrónico o descargar una aplicación. Cuando se afina la guitarra lo primero es lograr que el afinador identifique la cuerda que estamos afinando, luego subir o bajar la afinación según se requiera, para esto la cuerda deberá tensarse o soltarse, nuevamente este procedimiento debe realizarse cuerda por cuerda. Por último veremos en esta Clase de nuestro curso de guitarra para principiantes nuestros primeros acordes, veremos tres acordes mayores, el objetivo será hacer cambios entre ellos, no importa el orden, solo buscamos familiarizarnos con ellos y poder llevar a cabo cambios, esto es vital, ya que al aprender a tocar guitarra con ellos podrás llegar a tocar tus primeras canciones. Los cambios entre acordes constituyen el primer gran reto que vamos a encontrar, requiere paciencia y constancia, pero es algo que se va dominando con el tiempo y la practica.</p>',
  'Clase para Principiantes #1' => '<p>Te enseñaré lo básico de la batería para después enseñarte tus primeros 3 ritmos de batería fácil! Esta lección es perfecta para los principiantes que quieren aprender a tocar la batería! Aprenderás las partes de la batería, como agarrar tus baquetas, como sentarte en al batería, los pedales de la batería y mucho más! Muchas gracias por ver baterista!</p>
                                    <ul><li>Partes de la Batería</li>
                                    <li>Posición al Sentarse</li>
                                    <li>Pedales</li>
                                    <li>Baquetas</li>
                                    <li>Agarre y Movimiento</li>
                                    <li>Ritmo de Batería #1</li>
                                    <li>Ritmo de Batería #2</li>
                                    <li>Ritmo de Batería #3</li>
                                    <li>Ritmos con Música!</li></ul>',
  'Remates - Clase para Principiantes #2' => '<p> Ahora que ya conoces lo básico de la batería y tus primeros ritmos, es tiempo de que toques tus primeros remates, fills ó breaks! En esta nueva clase de batería para principiantes te enseñare lo básico de los remates y cómo puedes comenzar a crear tus propios remates fáciles! Va a estar de locos! Muchas gracias por ver!</p>
                                                <ul><li>¿Qué son los fills / remates?</li>
                                                <li>Explicación de fills / remates</li>
                                                <li>Remates de Barra Completa y Remates de Media Barra</li>
                                                <li>Clase de Fills / Remates</li>
                                                <li>Fill / Remate #1 (Clase)</li>
                                                <li>Fill / Remate #2 (Clase)</li>
                                                <li>Fills / Remates con Música</li></ul>',
  'Como Usar La Púa' => '<p>Existen muchas técnicas y formas de tocar la púa con la guitarra. Es importante que cuando vayamos a aprender una nueva canción identifiquemos la técnica de púa que ejecuta el autor para que podamos tocarla a la velocidad original, con limpieza y bien. Ya sabes que esta explicación va acompañada del vídeo del principio, así que si quieres entender bien cómo se ejecutan estas técnicas y los ejercicios que propongo, ¡no dudes en verlo! Si quieres indagar un poco más y saber cómo incrementar tu velocidad tocando la guitarra eléctrica, mira estos 3 Consejos para Tocar más Rápido la Guitarra Eléctrica.</p>
                        <ul><li>Alternative picking. Es la técnica más sencilla de todas que consiste en alternar el movimiento de la púa, haciendo el famoso púa-contrapúa. ¿Y cómo hacemos esta técnica? Mucha gente te dirá que tienes que girar la púa, otros que tienes que mantenerla recta al momento de tocar la cuerda… Pero la realidad es que todo eso depende tanto del estilo de música que estés tocando como de la técnica con la que vayas a tocar después, así que debes acostumbrarte a tocar de esas dos maneras para que tu mano se pueda adaptar bien. Esta técnica la podemos combinar con el Palm Mute para hacer riffs muy chulos y metaleros.</li>
                        <li>Armónicos Artificiales. Es una de las técnicas que más me preguntan en clase, y por algo es una de las más usadas en guitarra. Básicamente es un armónico que nosotros generamos forzosamente en la guitarra donde nos interesa por medio de la púa girada y metiéndole un poco el dedo pulgar conseguimos ese sonido tan característico de los armónicos. Lo interesante de esta técnica es que según dónde des el golpe con la púa, el armónico va a sonar diferente, y si ya le añadimos un vibrato como toque final, suena muchísimo mejor.</li>
                        <li>Hybrid Picking. Esta técnica se ejecuta tocando con la púa y con los dedos a la vez, lo cual ayuda a no abusar tanto del alternative picking. Se usa muchísimo en el country por ejemplo. Para empezar, piensa en la púa solo como el golpe hacia abajo y en el dedo 2 como la contrapúa. Por supuesto que se puede llegar a usar el resto de dedos pero es una técnica más compleja.</li>
                        <li>Economy Picking. Es una técnica que se usa muchísimo para acompañar estilos como el Metal Core e incluso para improvisar. Como su nombre indica, es usado para economizar el movimiento de la púa de tal forma que aprovechamos el movimiento de la mano tocando, ya sea hacia arriba como hacia abajo, para tocar varias cuerdas seguidas, ahorrándonos el cambio de dirección que requeriría tocar en alternative picking. Al ahorrarnos movimientos con la mano de la púa, podemos llegar a tocar más rápido usando el Economy Picking.</li>
                        <li>Tapping de Púa. Es una de las técnicas que más me gustan con la que puedes conseguir una velocidad increíble. Es tan simple como golpear con el lado de la púa a la cuerda, tal y como lo haríamos si estuviésemos haciendo un tapping normal con dedos.</li></ul>',
  'Ejercicios de digitación' => '<p>Tocar la guitarra requiere coordinación entre la mano derecha y la izquierda: como la mano derecha rasguea, la mano izquierda debe estar lo suficientemente coordinada para cuidar la digitación de la guitarra. En otras palabras, la mano derecha es responsable de tocar las cuerdas para hacerlas vibrar, y la mano izquierda es responsable de presionar las cuerdas contra los trastes de la guitarra para crear diferentes tonos o notas. La acción de la mano izquierda se llama digitación de guitarra y requiere mucha práctica para lograrla de manera efectiva.</p>
                                <p> La digitación de guitarra puede ser difícil por varias razones. Las cuerdas de guitarra de latón o níquel pueden ser algo dolorosas contra las yemas de los dedos hasta que el jugador desarrolle callos, lo que puede dificultar un movimiento rápido y sólido entre las cuerdas. Los guitarristas experimentados mantienen las callosidades en la punta de los dedos para ayudar en la digitación de la guitarra y los principiantes a menudo buscan desarrollarlos rápidamente para ayudar a sus capacidades de digitación. Los guitarristas experimentados también mantienen las uñas lo más cortas posible para que las uñas no interfieran con los dedos de la guitarra.</p>
                                <p>Otra razón por la que la digitación de guitarra puede ser bastante difícil para un principiante tiene que ver con entrenar los músculos de la mano para que se estiren lo suficiente como para alcanzar las posiciones correctas en el diapasón. Mientras que un guitarrista puede simplemente colocar un solo dedo en cualquier parte del diapasón para crear una nota musical, un guitarrista debe entrenar sus manos para alcanzar la posición correcta para acordes o combinaciones de múltiples notas que crean un tono. En este caso, la digitación de guitarra puede resultar especialmente difícil para personas con dedos cortos o manos generalmente más pequeñas.</p>
                                <p>Para los principiantes que buscan mejorar su digitación de guitarra, una guitarra eléctrica podría ser una mejor opción que una guitarra acústica. Las guitarras eléctricas generalmente usan cuerdas de níquel de calibre más ligero que son más fáciles de presionar y que ceden a la presión de los dedos más fácilmente que las cuerdas de bronce de la guitarra acústica. Una vez que el jugador ha desarrollado suficiente comodidad en la guitarra eléctrica, puede pasar a la guitarra acústica, lo que puede ser algo más difícil con respecto a la digitación de la guitarra.</p>',
}
descriptions = {
  'Teoría Musical. Conceptos Básicos. Tutoriales' => 'Aprender teoría musical es necesario para una experiencia de aprendizaje musical que te permite crecer y entender en su totalidad el lenguaje musical, también te ayudará a que puedas ser más independiente en tu estudio.
                                                      No importa que género de música quieras o estés tocando, la teoría musical es una base para tu expresión y entendimiento de la disciplina de estudio de la música.
                                                      En este curso aprenderás los términos básicos indispensables para comenzar el estudio musical o para reforzar los existentes, en especial para aquellos que han desarrollado un oído musical y tocan de manera lírica.',

  'Aprende a tocar el piano con mi curso de Piano Básico'=> 'Si estas interesado en aprender a tocar el piano y no sabes donde comenzar, este curso es para ti. Este curso de piano está dirigido a músicos, pianistas, compositores, o a cualquier persona interesada en comprender cómo utilizar este instrumento para desarrollar la composición de armonías musicales. Al finalizar este curso de piano podrás:<ul><li> Interpretar los principios y los fundamentos básicos de la música y el instrumento.</li><li> Entender qué es y para qué se utilizan las escalas musicales</li><li> Comprender qué son las octavas y las teclas en el piano.</li><li> Utilizar las herramientas del piano para tocar apropiadamente las notas del teclado.</li><li> Usar los acordes para poder tocar melodías en el piano teniendo en cuenta la posición correcta de los dedos para tocar.</li><li> Utilizar las habilidades musicales para poder interpretar canciones y tocarlas</li></ul>',
  'Cantar desde Cero para Principiantes'=> 'En este curso aprenderás a cantar paso a paso para que puedas escalar poco a poco y compartir tu talento. De esta manera podrás cantar sin lastimar tu garganta por muchos años. En este curso he recopilado las técnicas que he aprendido con vocal coaches de todas partes del mundo (Hungría, Inglaterra, Estados Unidos, Cuba, Puerto Rico y Guatemala). Me han servido a lo largo de mi camino como cantante y las he puesto a tu disposición para que empiezas a entender tu instrumento: la voz. Este curso incluye ejercicios de vocalización y audios mp3 que te ayudarán a practicar lo aprendido en cualquier lugar en que te encuentres sin necesidad de un teclado, piano u instructor. Al final del curso podrás tener una mejor afinación, rango, capacidad respiratoria, proyección y entonación.
                                                En este curso abordaremos los siguientes temas<ul><li>  Cuidado de la voz : Cómo cuidar de tu voz y por qué es importante la técnica vocal.</li><li> Respiración Correcta: Cómo enviar el aire al lugar correcto y las funciones que la respiración nos brinda para cantar mejor.</li><li>  Appoggio/ Soporte: Cómo encontrar el appoggio y las funciones que este brinda para cantar mejor</li><li> Tesitura: Encuentra tu tesitura y escoge canciones en base a ella..</li><li> Resonancia/ Cantar en la máscara: Desarrolla tu potencia</li><li> Apertura: Cómo encontrar la apertura correcta al cantar.</li><li> Afinación: Desarrolla tu oído y tu entrenamiento musical<li>Tonos y Semitonos: entrenamiento auditivo</li><li>Escalas: Ejercicios con escala mayor y escala cromática</li></li><li>Interpretación: Método para interpretar canciones.</li></ul>',
  'Guitarra para principiantes'=> '¡Despierta el Guitarrista que llevas dentro! <h3>Lo que aprenderás</h3>Tocar todos los Acordes en la Guitarra por Todo el Mástil. Analizar y entender qué intervalos componen a los Acordes y Escalas. Progresiones de Acordes que podrás utilizar en tus propias composiciones. 6 Ritmos sencillos que podrás usar en casi todos los contextos. Usar el CAPO para cambiar de Tonalidad las canciones. Técnicas de Expresividad para adornar tus Solos de Guitarra. Improvisar de manera sencilla en cualquier contexto. Componer tus propios Solos o melodías en la Guitarra. 5 Frases de Guitarra que podrás estudiar, analizar y modificar a tu gusto. Realizar la Técnica de Púa y Contrapúa correctamente. ¡Desenvolverte en cualquier contexto por ti mismo!',
  'Batería desde 0: Primeros Pasos, Curso Intensivo'=> 'Aprende a tocar batería en pocas semanas con este curso especialmente compuesto para desarrollar las habilidades más importantes para el principiante.
                                                          Los nombres y timbres de la batería y su relación con el pentagrama musical.
                                                          Manos: grip y técnica y golpes básicos
                                                          Técnica de pies
                                                          Coordinación: manos y pies
                                                          Figuras y lectura básica para batería.
                                                          Disociación: separando y liberando tus extremidades.
                                                          Ritmos y estilos más famosos
                                                          Fills de 1, 2 y 4 tiempos de duración',
  'Como tocar guitarra eléctrica'=> 'Adéntrate en el mundo de la guitarra eléctrica con este curso inicial en el que aprenderás todo lo que siempre quisiste saber de ella: tipos, modelos, funcionamiento, sonidos básicos… Además, trabajaremos la técnica y la iremos perfeccionando mediante canciones creadas especialmente para cada bloque, todas ellas con partitura interactiva, tablatura y pistas de acompañamiento para que les saques el máximo partido. ¿A qué esperas para entrar?',
}

# Crear cursos
courses.each do |course|
  course_new = Course.create!(
    title: course[:title],
    description: descriptions[course[:title]],
    published: course[:published],
    user_id: User.pluck(:id).sample,
    theme_id: course[:theme_id]
  )
  # Adjuntar imagen al curso
  image_path = Rails.root.join('app', 'assets', 'images', 'courses', course[:image])
  image_blob = ActiveStorage::Blob.create_and_upload!(
    io: File.open(image_path),
    filename: course[:image],
    content_type: 'image/jpeg'
  )
  course_new.photo.attach(image_blob)
  course_new.save
end

lectures = [
  { title: 'El Círculo de Quintas', image: 'circulo_quintas.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710171371/development/29u64912r3z7wn4qbmnxxftsf0w6.mp4', video: 'acordes_escalas.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: 'Cómo leer partituras: El Endecagrama Primigenio', image: 'leer_partituras.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710183419/leer_partituras_ppuvoz.mp4' , video: 'leer_partituras.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: '¿Por qué medimos el ritmo así?', image: 'ritmo.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710171396/development/3crb9zx1tlsd3spe5aby6n0cj3ru.mp4' , video: 'ritmo.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: '¿Qué es un acorde?. Tipos de Acordes', image: 'acordes.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710171430/development/z12fdntsj6oajrkro1s6yg83z83w.mp4' , video: 'acordes.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: '¿Qué es una escala musical?', image: 'escala.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710184848/escala_iqa8iq.mp4' , video: 'escala.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: '¿Qué es un intervalo musical?', image: 'intervalo.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710250484/intervalo_qdhrde.mp4' , video: 'intervalo.mp4',  published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: '¿Qué son las tonalidades?', image: 'tonalidades.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710171414/development/cwgeabf69mzrs2kmy8gw4pdl1m7k.mp4' , video: 'tonalidades.mp4', published: true, course_id: Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id },
  { title: 'Piano Básico', image: 'piano_basico.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710190354/piano_basico_chjxog.mp4' , video: 'piano_partituras.mp4', published: true, course_id: Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id },
  { title: 'Piano Melodías', image: 'piano_melodias.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185496/piano_melodias_ay9crs.mp4' , video: 'piano_melodias.mp4', published: true, course_id: Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id },
  { title: 'Piano Partituras', image: 'piano_partituras.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185537/piano_partituras_byyyc3.mp4' , video: 'piano_partituras.mp4', published: true, course_id: Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id },
  { title: 'Piano Acompañamientos', image: 'piano_acompañamientos.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710190438/piano_acompa%C3%B1amientos_ifxh25.mp4' , video: 'piano_partituras.mp4', published: true, course_id: Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id },
  { title: 'Lección 1', image: 'canto_1.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185471/canto_1_zsfuoo.mp4', video: 'canto_1.mp4', published: true, course_id: Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id },
  { title: 'Lección 2', image: 'canto_2.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185506/canto_2_qjhvqr.mp4' , video: 'canto_2.mp4', published: true, course_id: Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id },
  { title: 'Lección 3', image: 'canto_3.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710247767/canto_3_nq46rj.mp4' , video: 'canto_3.mp4', published: true, course_id: Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id },
  { title: 'Lección 4', image: 'canto_4.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710247783/canto_4_x4ypri.mp4' , video: 'canto_4.mp4', published: true, course_id: Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id },
  { title: 'Lección 5', image: 'canto_5.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710247752/canto_5_bkgmk5.mp4' , video: 'canto_5.mp4', published: true, course_id: Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id },
  { title: 'Lección 1: Posición', image: 'guitarra_1.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185461/guitarra_1_qmx0l7.mp4' , video: 'guitarra_1.mp4', published: true, course_id: Course.where('title = ?', "Guitarra para principiantes").first.id },
  { title: 'Lección 2: Cambio de cuerdas y afinación', image: 'guitarra_2.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185487/guitarra_2_zyeqyt.mp4' , video: 'guitarra_2.mp4', published: true, course_id: Course.where('title = ?', "Guitarra para principiantes").first.id },
  { title: 'Clase para Principiantes #1', image: 'bateria_1.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185507/bateria_1_j5bxnk.mp4' , video: 'bateria_1.mp4', published: true, course_id: Course.where('title = ?', "Batería desde 0: Primeros Pasos, Curso Intensivo").first.id },
  { title: 'Remates - Clase para Principiantes #2', image: 'bateria_2.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185517/bateria_2_o1gm8q.mp4' , video: 'bateria_2.mp4', published: true, course_id: Course.where('title = ?', "Batería desde 0: Primeros Pasos, Curso Intensivo").first.id },
  { title: 'Como Usar La Púa', image: 'electrica_1.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185517/bateria_2_o1gm8q.mp4' , video: 'electrica_1.mp4', published: true, course_id: Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id },
  { title: 'Ejercicios de digitación', image: 'electrica_2.jpg', video_url: 'https://res.cloudinary.com/dgz3yly6v/video/upload/v1710185480/electrica_2_uwunwa.mp4' , video: 'electrica_2.mp4', published: true, course_id: Course.where('title = ?', "Como tocar guitarra eléctrica").first.id },
]

require "open-uri"

# Crear lectures
counter_course_1 = 1
counter_course_2 = 1
counter_course_3 = 1
counter_course_4 = 1
counter_course_5 = 1
counter_course_6 = 1
course_1 = Course.where('title = ?', "Teoría Musical. Conceptos Básicos. Tutoriales").first.id
course_2 = Course.where('title = ?', "Aprende a tocar el piano con mi curso de Piano Básico").first.id
course_3 = Course.where('title = ?', "Cantar desde Cero para Principiantes").first.id
course_4 = Course.where('title = ?', "Como tocar guitarra eléctrica").first.id
course_5 = Course.where('title = ?', "Batería desde 0: Primeros Pasos, Curso Intensivo").first.id
course_6 = Course.where('title = ?', "Guitarra para principiantes").first.id

lectures.each do |lecture|

  case lecture[:course_id]
  when course_1
    counter = counter_course_1
    counter_course_1 += 1
  when course_2
    counter = counter_course_2
    counter_course_2 += 1
  when course_3
    counter = counter_course_3
    counter_course_3 += 1
  when course_4
    counter = counter_course_4
    counter_course_4 += 1
  when course_5
    counter = counter_course_5
    counter_course_5 += 1
  when course_6
    counter = counter_course_6
    counter_course_6 += 1
  else
    "Error: Curso: (#{lecture[:course_id]}) no existe en este loop"
  end


  lecture_new = Lecture.create!(
    title: lecture[:title],
    content: contents[lecture[:title]],
    published: lecture[:published],
    lecture: counter,
    course_id: lecture[:course_id]
  )
  # Adjuntar imagen al lecture
  image_path = Rails.root.join('app', 'assets', 'images', 'lectures', lecture[:image])
  image_blob = ActiveStorage::Blob.create_and_upload!(
    io: File.open(image_path),
    filename: lecture[:image],
    content_type: 'image/jpg'
  )

  puts "subiendo video"
  video_blob = ActiveStorage::Blob.create_and_upload!(
    io: URI.open(lecture[:video_url]),
    filename: lecture[:video],
    content_type: 'video/mp4'
  )
  puts "video subido"

  lecture_new.photos.attach(image_blob)
  lecture_new.video.attach(video_blob)
  lecture_new.save
end

puts "Seed finalizado!"
