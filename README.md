# Projecte Millora Pokédex

Projecte final desenvolupat a partir de l'aplicació Pokédex creada durant el curs de Flutter.

L'objectiu principal del projecte ha estat ampliar les funcionalitats existents aplicant els conceptes treballats durant la formació, com ara el consum d'APIs, la navegació entre pantalles, la persistència local de dades i la gestió de l'estat.

---

## Tecnologies utilitzades

- Flutter
- Dart
- Dio
- Freezed
- SharedPreferences
- PokeAPI

---

## Millores implementades

### 1. Pantalla de detall dels Pokémon

S'ha afegit una pantalla de detall accessible des de cada targeta de Pokémon.

Funcionalitats:

- Navegació des del llistat principal.
- Visualització ampliada de la informació del Pokémon.
- Mostra de:
  - Nom
  - Imatge
  - Identificador
  - Tipus

Conceptes aplicats:

- Navigator
- Pas de dades entre pantalles
- Reutilització de models

---

### 2. Llistat de Pokémon des de la PokeAPI

S'ha ampliat el projecte perquè carregui múltiples Pokémon des de la PokéAPI.

Funcionalitats:

- Recuperació dels primers Pokémon de la PokéAPI.
- Visualització mitjançant una llista dinàmica.
- Reutilització de les targetes existents.

Conceptes aplicats:

- Dio
- FutureBuilder
- ListView.builder
- Models Freezed

---

### 3. Sistema de favorits

S'ha implementat un sistema que permet marcar i desmarcar Pokémon com a favorits.

Funcionalitats:

- Afegir Pokémon a favorits.
- Eliminar Pokémon de favorits.
- Persistència de dades entre diferents execucions de l'aplicació.

Conceptes aplicats:

- SharedPreferences
- StatefulWidget
- Gestió d'estat

---

### 4. Pantalla de favorits

S'ha afegit una nova pestanya dins de la navegació principal.

Funcionalitats:

- Visualització exclusiva dels Pokémon marcats com a favorits.
- Sincronització automàtica amb els canvis realitzats des de la pantalla de detall.
- Reutilització de les targetes de Pokémon.

Conceptes aplicats:

- BottomNavigationBar
- SharedPreferences
- FutureBuilder
- Reutilització de components

---

### 5. Cerca de Pokémon

S'ha incorporat un cercador a la pantalla principal de la Pokédex.

Funcionalitats:

- Cerca per nom.
- Filtrat en temps real.
- Actualització automàtica dels resultats.

Conceptes aplicats:

- TextField
- StatefulWidget
- Filtrat de col·leccions

---

## Altres millores

- Pantalla de càrrega animada.
- Perfil amb persistència de dades.
- Adaptació visual mitjançant SafeArea per evitar problemes amb dispositius que incorporen càmera integrada a la pantalla.
- Millores d'usabilitat i navegació.

---

## Autor

Oscar Capilla

Projecte final de pràctica i consolidació dels coneixements adquirits durant el curs de Flutter.