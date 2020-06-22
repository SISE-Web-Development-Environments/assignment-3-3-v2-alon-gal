


IF OBJECT_ID('dbo.Users_Favorites', 'U') IS NOT NULL
DROP TABLE dbo.Users_Favorites
GO

IF OBJECT_ID('dbo.Users_ThreeLastWatched', 'U') IS NOT NULL
DROP TABLE dbo.Users_ThreeLastWatched
GO

IF OBJECT_ID('dbo.Users_Watched', 'U') IS NOT NULL
DROP TABLE dbo.Users_Watched
GO

IF OBJECT_ID('dbo.Users_Recipes', 'U') IS NOT NULL
DROP TABLE dbo.Users_Recipes
GO

IF OBJECT_ID('dbo.Users_FamilyRecipes', 'U') IS NOT NULL
DROP TABLE dbo.Users_FamilyRecipes
GO

IF OBJECT_ID('dbo.Users_MyRecipes', 'U') IS NOT NULL
DROP TABLE dbo.Users_MyRecipes
GO

IF OBJECT_ID('dbo.Users', 'U') IS NOT NULL
DROP TABLE dbo.Users
GO

CREATE TABLE dbo.Users
(
    userName [NVARCHAR](50) NOT NULL PRIMARY KEY,
    firstname [NVARCHAR](50) NOT NULL,
    lastname [NVARCHAR](50) NOT NULL,
    password [NVARCHAR](max) NOT NULL,
    email [NVARCHAR](50) NOT NULL,
    photoUrl [NVARCHAR](500),
    country [NVARCHAR](50) NOT NULL
    
);
GO

CREATE TABLE dbo.Users_Favorites
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY
);
GO

CREATE TABLE dbo.Users_ThreeLastWatched
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY,
    seq INTEGER NOT NULL
);
GO

CREATE TABLE dbo.Users_Watched
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY
);
GO


CREATE TABLE dbo.Users_Recipes
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY
);
GO

CREATE TABLE dbo.Users_FamilyRecipes
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY,
    recipe_name [NVARCHAR](50) NOT NULL,
    recipes_owner [NVARCHAR](50) NOT NULL,
    whenMade [NVARCHAR](50) NOT NULL,
    ingredients [NVARCHAR](500) NOT NULL,
    instructions [NVARCHAR](3000) NOT NULL,
    photoUrl [NVARCHAR](500)
);
GO

CREATE TABLE dbo.Users_MyRecipes
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    id INTEGER NOT NULL PRIMARY KEY,
    image [NVARCHAR](500) NOT NULL,
    title [NVARCHAR](50) NOT NULL,
    readyInMinutes INTEGER NOT NULL,
    vegetarian BIT NOT NULL,
    vegan BIT NOT NULL,
    glutenFree BIT NOT NULL,
    aggregateLikes INTEGER NOT NULL,
    instructions [NVARCHAR](3000) NOT NULL,
    ingredients [NVARCHAR](3000) NOT NULL,
    servings INTEGER NOT NULL

);


INSERT INTO Users
 ([userName],[firstname],[lastname], [password],[email],[photoUrl],[country])
VALUES
    (N'test', N'TestF',N'TestL',N'$2b$10$6ocuirRNgNBNsIaWxwEGkOlSoavKMhcFPwAWq72Bi.tmM8ymj8wpW', N'test@test.com',N'testPhotoUrl',N'testCountry'),
    (N'alongolo', N'Alon',N'Golombek',N'$2b$10$6ocuirRNgNBNsIaWxwEGkOlSoavKMhcFPwAWq72Bi.tmM8ymj8wpW', N'alongolo@post.bgu.ac.il',N'https://image.shutterstock.com/image-vector/male-silhouette-avatar-profile-picture-260nw-199246382.jpg',N'Israel'),
    (N'galtad', N'Gal',N'Tadir',N'$2b$10$6ocuirRNgNBNsIaWxwEGkOlSoavKMhcFPwAWq72Bi.tmM8ymj8wpW', N'galtad@post.bgu.ac.il',N'https://image.shutterstock.com/image-vector/male-silhouette-avatar-profile-picture-260nw-199246382.jpg',N'Israel')
GO


INSERT INTO Users_Favorites
 ([userName],[recipe_id])
VALUES
    (N'test', 123),
    (N'test', 345),
    (N'alongolo', 222),
    (N'alongolo', 223),
    (N'alongolo', 224),
    (N'galtad', 300),
    (N'galtad', 111),
    (N'galtad', 302)
GO

INSERT INTO Users_ThreeLastWatched
 ([userName],[recipe_id],[seq])
VALUES
    (N'test', 123, 1),
    (N'test', 345, 2),
    (N'test', 567, 3),
    (N'alongolo', 222,1),
    (N'alongolo', 223,2),
    (N'galtad', 300,1),
    (N'galtad', 301,2),
    (N'galtad', 302,3)
GO

INSERT INTO Users_Watched
 ([userName],[recipe_id])
VALUES
    (N'test', 123),
    (N'test', 345),
    (N'test', 567),
    (N'alongolo', 222),
    (N'alongolo', 223),
    (N'galtad', 300),
    (N'galtad', 301),
    (N'galtad', 302)
GO

INSERT INTO Users_MyRecipes
 ([userName],[id],[image],[title],[readyInMinutes],[vegetarian],[vegan],[glutenFree],[aggregateLikes],[instructions],[Ingredients],[servings])
VALUES
    (N'alongolo', 1, N'https://toriavey.com/images/2011/02/TOA20_03-740x740.jpg', N'Chicken Schnitzel', 45 , 0, 0, 1, 100,
    N'<li> 1 lb boneless skinless chicken breasts (2 large breasts) </li> 
    <li> 1/2 cup flour </li> 
    <li> 2 large eggs </li> 
    <li> 1 cup breadcrumbs, matzo meal, or panko </li> 
    <li> 1 tbsp paprika </li> 
    <li> 1 tbsp sesame seeds (optional) </li>
    <li> 1/4 tsp salt, or more to taste </li>
    <li> Oil for frying, avocado oil or grapeseed oil both work well </li>
    <li> Fresh lemon wedges for garnish </li>',
    N'<li> 1 lb boneless skinless chicken breasts (2 large breasts) </li> 
    <li> 1/2 cup flour </li> 
    <li> 2 large eggs </li> 
    <li> 1 cup breadcrumbs, matzo meal, or panko </li> 
    <li> 1 tbsp paprika </li> 
    <li> 1 tbsp sesame seeds (optional) </li>
    <li> 1/4 tsp salt, or more to taste </li>
    <li> Oil for frying, avocado oil or grapeseed oil both work well </li>
    <li> Fresh lemon wedges for garnish </li>',
    4
    ),
    (N'alongolo', 1, N'https://toriavey.com/images/2011/02/TOA20_03-740x740.jpg', N'Chicken Schnitzel', 45 , 0, 0, 1, 100,
    N'<li> 1 lb boneless skinless chicken breasts (2 large breasts) </li> 
    <li> 1/2 cup flour </li> 
    <li> 2 large eggs </li> 
    <li> 1 cup breadcrumbs, matzo meal, or panko </li> 
    <li> 1 tbsp paprika </li> 
    <li> 1 tbsp sesame seeds (optional) </li>
    <li> 1/4 tsp salt, or more to taste </li>
    <li> Oil for frying, avocado oil or grapeseed oil both work well </li>
    <li> Fresh lemon wedges for garnish </li>',
    N'<li> 1 lb boneless skinless chicken breasts (2 large breasts) </li> 
    <li> 1/2 cup flour </li> 
    <li> 2 large eggs </li> 
    <li> 1 cup breadcrumbs, matzo meal, or panko </li> 
    <li> 1 tbsp paprika </li> 
    <li> 1 tbsp sesame seeds (optional) </li>
    <li> 1/4 tsp salt, or more to taste </li>
    <li> Oil for frying, avocado oil or grapeseed oil both work well </li>
    <li> Fresh lemon wedges for garnish </li>',
    4
    )

GO


INSERT INTO Users_Recipes
 ([userName],[recipe_id])
VALUES
    (N'test', 123),
    (N'test', 345),
    (N'alongolo', 222),
    (N'alongolo', 223),
    (N'galtad', 300),
    (N'galtad', 301),
    (N'galtad', 302)

GO

INSERT INTO Users_FamilyRecipes
 ([userName],[recipe_id],[recipe_name],[recipes_owner],[whenMade],[ingredients],[instructions],[photoUrl])
VALUES
    (N'alongolo', 456, N'Kibbeh', N'Grandma',N'Family Reunions',
    N'*2 1/2 cupsfine bulgur wheat
*Water
*1 large onion, quartered
*1 1/2 lb lean ground beef (or lamb)
*2 tsp ground allspice
*1 tsp ground coriander
*1/2 tsp ground cinnamon
*1 tsp black pepper
*Pinch salt
*Oil for frying
*Olive oil
*1 medium yellow onion, finely chopped or grated
*1 lb ground lamb or beef (I used beef here), cold
*1/3 cup toasted pine nuts
*1 tsp ground allspice
*1/2 tsp ground cinnamon
*Pinch salt and pepper'
,
    N'Cover a fine mesh strainer with a light cloth (a cheesecloth, if you have one). Add the bulgur wheat in, then place the strainer into a bowl filled with water. Let the fine bulgur wheat soak in the water for 15 minutes, then pull the cloth, holding the bulgur, and squeeze all the water out. You may do this a couple of times until you are sure the bulgur is rid of water. Set aside for now.
Now make the kibbeh (the actual dough that you will later use to form the kibbeh shells). Put the onion, ground beef, spices and pinch of salt into the bowl of a large food processor. Process until the meat is very finely ground almost into a paste. Transfer the meat mixture into a large bowl and add the bulgur wheat. Use damp hands to combine the bulgur with the meat mixture to make a dough. Cover and refrigerate until later.
Now make the filling. Heat about 1 tbsp olive oil in a skillet or frying pan. Saute the onion until just golden, then add the ground beef. Cook over medium heat, stirring occasionally until the meat is fully browned. Add the toasted pine nuts, the spices, and the salt and pepper. Stir to combine. Remove from the heat and set aside to cool.
Remove the kibbeh dough from the fridge.
To stuff the kibbeh, you need to have damp hands. Place a small bowl of water next to you. Prepare a baking sheet and line it with parchment paper.
With both the bowl of kibbeh dough and the filling near, you can begin stuffing the kibbeh. Dampen your hands with some water, take a handful of the kibbeh dough (about 2 tbsp or so) and form into somewhat of an oval-shaped disc in the palm of one hand. Use your finger to make a well in the middle of the disc, and gradually hallow the disc out to make a larger well or hole for the filling. Using a spoon, add about 1 tablespoon of the filling. Seal the dough on top and, using both hands, carefully shape it into an oval (football-type shape). Place the stuffed kibbeh on the baking sheet lined with parchment paper. Repeat the stuffing steps until you run out, be sure to have damp hands throughout.
Chill the stuffed kibbeh for 1 hour.
Heat the oil in a deep frying pan to 350 degrees F (you’ll want the oil hot enough that you can see some gentle bubbling, but not too hot where it will burn the kibbeh shells). Deep-fry the kibbeh in the hot oil, in batches being carefully not to crowd them, until the kibbeh shells are brown (about 5 minutes or so). With a slotted spoon or tongs, carefully remove the kibbeh and place them on a pan lined with paper towel to drain. Repeat until you have fried all the stuffed kibbeh.
Serve hot or at room temprature with tahini sauce, tzatziki sauce or plain Greek yogurt. Enjoy!
    ',N'https://www.themediterraneandish.com/wp-content/uploads/2016/09/Kibbeh-Recipe-16.jpg'),
    (N'alongolo', 457, N'Gefilte Fish', N'Grandma',N'Pesach',
    N'*7 to 7 1/2 pounds whole carp, whitefish, and pike, filleted and ground*
*4 quarts cold water or to just cover
*3 teaspoons salt or to taste
*3 onions, peeled
*4 medium carrots, peeled
*2 tablespoons sugar or to taste
*1 small parsnip, chopped (optional)
*3 to 4 large eggs
*Freshly ground pepper to taste 1/2 cup cold water (approximately)
*1/3 cup matzah meal (approximately)',
    N'1. Place the reserved bones, skin, and fish heads in a wide, very large saucepan with a cover. Add the water and 2 teaspoons of the salt and bring to a boil. Remove the foam that accumulates.
2. Slice 1 onion in rounds and add along with 3 of the carrots. Add the sugar and bring to a boil. Cover and simmer for about 20 minutes while the fish mixture is being prepared.
3. Place the ground fish in a bowl. In a food processor finely chop the remaining onions, the remaining carrot, and the parsnip; or mince them by hand. Add the chopped vegetables to the ground fish.
4. Add the eggs, one at a time, the remaining teaspoon of salt, pepper, and the cold water, and mix thoroughly. Stir in enough matzah meal to make a light, soft mixture into oval shapes, about 3 inches long. Take the last fish head and stuff the cavity with the ground fish mixture.
5. Remove from the saucepan the onions, skins, head, and bones and return the stock to a simmer. Gently place the fish patties in the simmering fish stock. Cover loosely and simmer for 20 to 30 minutes. Taste the liquid while the fish is cooking and add seasoning to taste. Shake the pot periodically so the fish patties wont stick. When gefilte fish is cooked, remove from the water and allow to cool for at least 15 minutes.
6. Using a slotted spoon carefully remove the gefilte fish and arrange on a platter. Strain some of the stock over the fish, saving the rest in a bowl.
7. Slice the cooked carrots into rounds cut on a diagonal about 1/4 inch thick. Place a carrot round on top of each gefilte fish patty. Put the fish head in the center and decorate the eyes with carrots. Chill until ready to serve. Serve with a sprig of parsley and horseradish.',
    N'https://assets.epicurious.com/photos/57bb35a1df05218810c52150/6:4/w_620%2Ch_413/classic-gefilte-fish.jpg'),
(N'alongolo', 458, N'Honey-Garlic-Salmon', N'Father',N'Weekends',
N'*4 wild caught salmon fillets about 1/2 pound or 250 grams each, skin off or on
*Salt and pepper, to season
*1/2 teaspoon paprika (mild, sweet or smokey)
*2 tablespoons butter
*4 cloves garlic, finely chopped or minced
*4 tablespoons honey
*1 tablespoon water
*2 teaspoons soy sauce
*1 tablespoon fresh squeezed lemon juice, (plus extra to serve)
*Lemon wedges to serve',
N'Arrange oven shelf to the middle of your oven. Preheat oven to broil/grill settings on medium heat. 
Season salmon with salt, pepper and paprika. Set aside.
Heat the butter in a skillet or pan over medium-high heat until melted. Add the garlic and sauté for about a minute, until fragrant. Pour in the honey, water and soy sauce; allow the flavours to heat through and combine. Add in the lemon juice; stir well to combine all of the flavours together.
Add the salmon steaks to the sauce in the pan; cook each fillet (skin-side down if theres any skin) for 3-4 minutes or until golden, while basting the tops with the pan juices. Season with salt and pepper, to taste (if desired).
Optional -- Add the lemon wedges around the salmon (adds a stronger lemon taste). 
Baste salmon one more time then transfer the pan to your oven to broil / grill for a further 5-6 minutes, or until the tops of the salmon are nicely charred, and the salmon is cooked to your liking.
To serve, drizzle with the sauce and a squeeze of lemon juice. Serve with steamed vegetables; over rice or with a salad.',
N'https://hips.hearstapps.com/del.h-cdn.co/assets/17/39/1600x2399/gallery-1506456214-delish-honey-garlic-glazed-salmon.jpg?resize=768:*'),
(N'galtad', 459, N'Salmon', N'Mother',N'Friday Meal',
N'*12 ounce salmon fillet, cut into 4 pieces
*Coarse-grained salt
*Freshly ground black pepper
*Toasted Almond Parsley Salsa, for serving
*Baked squash, for serving, optional',
N'Preheat the oven to 450 degrees F.
Season salmon with salt and pepper. Place salmon, skin side down, on a non-stick baking sheet or in a non-stick pan with an oven-proof handle. Bake until salmon is cooked through, about 12 to 15 minutes. Serve with the Toasted Almond Parsley Salad and squash, if desired.
Mince the shallot and add to a small bowl. Pour the vinegar over the shallots and add a pinch of salt. Let sit for 30 minutes.
Roughly chop the capers, parsley and almonds and add to the shallots. Add the olive oil, tasting as you go. Mix again and adjust the seasonings.
',
N'https://369t7u43n93dgc5pt43uc681-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/orange-salmon-power-bowl-7.jpg'),
(N'galtad', 460, N'Brownies', N'Father',N'Friday Dessert',
N'*½ cup butter
*1 cup white sugar
*2 eggs
*1 teaspoon vanilla extract
*⅓ cup unsweetened cocoa powder
*½ cup all-purpose flour
*¼ teaspoon salt
*¼ teaspoon baking powder
*3 tablespoons butter, softened
*3 tablespoons unsweetened cocoa powder
*1 tablespoon honey
*1 teaspoon vanilla extract
*1 cup confectioners sugar',
N'Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan.
In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.
Bake in preheated oven for 25 to 30 minutes. Do not overcook.
To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners sugar. Stir until smooth. Frost brownies while they are still warm.
',
N'https://www.cookingclassy.com/wp-content/uploads/2019/05/brownies-22-768x1152.jpg'),
(N'galtad', 461, N'Soup', N'Grandmother',N'Holidays',
N'*3 to 3 1/2 pounds butternut squash, approximately 2, seeded and quartered
*Unsalted butter, melted, for brushing
*1 tablespoon kosher salt, plus 1 teaspoon
*1 teaspoon freshly ground white pepper, plus 1/2 teaspoon
*3 cups chicken or vegetable broth
*1/4 cup honey
*1 teaspoon minced fresh ginger
*1/2 cup heavy cream
*1/4 teaspoon freshly grated nutmeg
',
N'Heat the oven to 400 degrees F.
Place the quartered squash onto a half sheet pan, brush the flesh of the squash with a little butter and season with 1 tablespoon of the salt and 1 teaspoon of the white pepper. Place in the oven and roast for 30 to 35 minutes or until the flesh is soft and tender.
Scoop the flesh from the skin into a 6-quart pot. Add the broth, honey and ginger. Place over medium heat and bring to a simmer, approximately 7 to 8 minutes. Using a stick blender, puree the mixture until smooth*. Stir in the heavy cream and return to a low simmer. Season with the remaining salt, pepper, and nutmeg.
When blending hot liquids: Remove liquid from the heat and allow to cool for at least 5 minutes. Transfer liquid to a blender or food processor and fill it no more than halfway. If using a blender, release one corner of the lid. This prevents the vacuum effect that creates heat explosions. Place a towel over the top of the machine, pulse a few times then process on high speed until smooth.
',
N'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Hungarian_goulash_soup.jpg/1200px-Hungarian_goulash_soup.jpg')
GO

