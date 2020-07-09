


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
    recipe_id INTEGER NOT NULL,
    CONSTRAINT PK_Users_Favorites PRIMARY KEY (userName,recipe_id)
);
GO

CREATE TABLE dbo.Users_ThreeLastWatched
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL,
    seq INTEGER NOT NULL,
    CONSTRAINT PK_Users_ThreeLastWatched PRIMARY KEY (userName,recipe_id)
);
GO

CREATE TABLE dbo.Users_Watched
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL,
    CONSTRAINT PK_Users_Watched PRIMARY KEY (userName,recipe_id)
);
GO


CREATE TABLE dbo.Users_Recipes
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL,
    CONSTRAINT PK_Users_Recipes PRIMARY KEY (userName,recipe_id)
);
GO

CREATE TABLE dbo.Users_FamilyRecipes
(
    userName [NVARCHAR](50) NOT NULL FOREIGN KEY REFERENCES Users(userName), 
    recipe_id INTEGER NOT NULL PRIMARY KEY,
    recipe_name [NVARCHAR](50) NOT NULL,
    recipes_owner [NVARCHAR](50) NOT NULL,
    whenMade [NVARCHAR](50) NOT NULL,
    ingredients [NVARCHAR](3000) NOT NULL,
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
    (N'alongolo', N'Alon',N'Golombek',N'$2b$10$6ocuirRNgNBNsIaWxwEGkOlSoavKMhcFPwAWq72Bi.tmM8ymj8wpW', N'alongolo@post.bgu.ac.il',N'https://i.imgur.com/j0CMQnv.jpg',N'Israel'),
    (N'galtad', N'Gal',N'Tadir',N'$2b$10$6ocuirRNgNBNsIaWxwEGkOlSoavKMhcFPwAWq72Bi.tmM8ymj8wpW', N'galtad@post.bgu.ac.il',N'https://i.imgur.com/sAydL8a.jpg',N'Israel')
GO


INSERT INTO Users_Favorites
 ([userName],[recipe_id])
VALUES
    (N'test', 123),
    (N'test', 345),
    (N'alongolo', 222),
    (N'alongolo', 223),
    (N'alongolo', 224),
    (N'galtad', 222)
GO

INSERT INTO Users_ThreeLastWatched
 ([userName],[recipe_id],[seq])
VALUES
    (N'test', 123, 1),
    (N'test', 345, 2),
    (N'test', 567, 3),
    (N'alongolo', 222,1),
    (N'alongolo', 223,2),
    (N'galtad', 222,1),
    (N'galtad', 223,2)
GO

INSERT INTO Users_Watched
 ([userName],[recipe_id])
VALUES
    (N'test', 123),
    (N'test', 345),
    (N'test', 567),
    (N'alongolo', 222),
    (N'alongolo', 223),
    (N'galtad', 222),
    (N'galtad', 223)
GO

INSERT INTO Users_MyRecipes
 ([userName],[id],[image],[title],[readyInMinutes],[vegetarian],[vegan],[glutenFree],[aggregateLikes],[Ingredients],[instructions],[servings])
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
    (N'alongolo', 2, N'https://imagesvc.meredithcorp.io/v3/mm/image?q=85&c=sc&poi=face&url=https%3A%2F%2Fcdn-image.foodandwine.com%2Fsites%2Fdefault%2Ffiles%2Fstyles%2F4_3_horizontal_-_1200x900%2Fpublic%2F201105-xl-quick-shrimp-pad-thai.jpg%3Fitok%3DA-yFs34H', N'Easy Pad Thai', 45 , 0, 0, 1, 50,
    N'<li> Kosher salt </li> 
    <li> 8 oz. wide rice noodles </li> 
    <li> 2 tbsp. lime juice </li> 
    <li> 2 tbsp. brown sugar </li> 
    <li> 1 tbsp. fish sauce </li> 
    <li> 1 tbsp. low-sodium soy sauce (optional) </li>
    <li> 1/4 tsp. cayenne pepper </li>
    <li> 2 tbsp. vegetable oil </li>
    <li> 1 bell pepper, thinly sliced </li>
    <li> 2 cloves garlic, minced </li>
    <li> 2 eggs, lightly whisked </li>
    <li> 1 lb. shrimp, peeled and deveined </li>
    <li> Freshly ground black pepper </li>
    <li> 2 green onions, thinly sliced </li>
    <li> 1/4 c. roasted peanuts, chopped </li>'
    ,
    N'<li> In a large pot of salted boiling water, cook noodles until al dente. Drain. </li> 
    <li> In a small bowl, whisk together lime juice, brown sugar, fish sauce, soy sauce, and cayenne pepper. Set aside. </li> 
    <li> In a large nonstick pan over medium-high heat, heat oil. Add bell pepper and cook until tender, about 4 minutes. Stir in garlic and cook until fragrant, about 1 minute more. Add the shrimp and season with salt and pepper. Cook until pink, about 2 minutes per side. </li> 
    <li> Push the shrimp and vegetables to one side of the pan and pour in the egg. Scramble until just set then mix with the shrimp mixture. Add the cooked noodles and toss until combined. Pour in the lime juice mixture and toss until the noodles are coated. </li> 
    <li> Garnish with green onions and roasted peanuts before serving. </li>',
    4
    ),
    (N'alongolo', 3, N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/200218-tyson-delish-shot06-069-3x2-1582865481.jpg?resize=980:*', N'Shredded Chicken Parm Sliders', 45 , 0, 0, 1, 230,
    N'<li> 2 tbsp. extra-virgin olive oil </li> 
    <li> 6 Tyson® Individually Frozen Boneless Skinless Chicken Breasts </li> 
    <li> 2 c. marinara sauce </li> 
    <li> 2 tbsp. chopped fresh basil leaves </li> 
    <li> 6 slider-size potato rolls </li> 
    <li> 8 oz. mozzarella, thinly sliced </li>
    <li> 1 tbsp. melted butter </li>
    <li> 1/8 tsp. garlic powder </li>
    <li> 1 tsp. freshly chopped parsley </li>
    <li> 1/4 c. freshly grated Parmesan </li>'
    ,
    N'<li> Preheat the oven to 425˚. In a large skillet, heat the oil over medium. Season the frozen chicken with salt and pepper. Add the seasoned frozen chicken to the skillet, cover and cook for 5 minutes. </li> 
    <li> Add the marinara sauce, reduce heat to medium-low, and flip chicken. Cover and cook for an additional 8 minutes.  </li> 
    <li> Remove the skillet from the heat and shred chicken using two forks. Return skillet to medium-high heat. Bring to a simmer and cook until marinara is thickened, about 2 minutes more. Remove from heat and stir in basil. </li> 
    <li> Arrange the bottom halves of slider buns on a baking sheet. Toast the buns in the oven until light golden, about 5 minutes.  </li> 
    <li> Top toasted bottom buns with the cooked chicken mixture and the mozzarella cheese. Close the sandwich with the top halves of the slider buns. </li>
    <li> In a small bowl, stir together melted butter, garlic powder, and parsley. Brush bun tops with butter mixture and sprinkle with Parmesan. Bake until cheese is melted and top buns are toasted, about 7 minutes. </li>
    ',
    4
    ),
    (N'galtad', 4, N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-tortilla-omelette-still002-1593699664.jpg?crop=0.928xw:0.826xh;0.0369xw,0.0855xh&resize=640:*', N'Tortilla Omelet', 15 , 1, 0, 1, 200,
    N'<li> 4 large eggs </li> 
    <li> Kosher salt </li> 
    <li> Freshly ground black pepper </li> 
    <li> 1 tbsp. butter </li> 
    <li> 1 (8-inch) flour tortilla </li> 
    <li> 3/4 c. shredded Mexican cheese blend </li>
    <li> 1/2 c. cooked black beans  </li>
    <li> 1/2 avocado, thinly sliced </li>
    <li> 1/2 c. pice de gallo </li>
    <li> Sour cream, for drizzling </li>
    <li> Freshly chopped cilantro, for serving </li>
    '
    ,
    N'<li> In a medium bowl, season eggs with salt and pepper and beat until well combined. </li> 
    <li> Heat butter in a medium nonstick skillet over medium heat. Add eggs and let bottom set, about 45 seconds. Dip tortilla in eggs then flip tortilla and place on top of eggs, so the dipped side is up. Let set, 30 seconds more, then flip the omelet. </li> 
    <li> Sprinkle cheese all over the omelet and scatter beans on one half of the omelet. Top beans with avocado and pico de gallo. Fold omelet in half and transfer to a plate. </li> 
    <li> If necessary, thin sour cream with a few drops of water until it can be drizzled. Serve omelet drizzled with sour cream and sprinkled with chopped cilantro. </li>
    ',
    4
    ),
      (N'galtad', 5, N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/200218-tyson-delish-shot01-047-nopackaging-3x2-1582861611.jpg?crop=1.00xw:0.753xh;0,0.108xh&resize=640:*', N'Grilled Chicken Bruschetta Pasta Salad', 30 , 0, 0, 1, 500,
    N'<li> 3 c. Tyson® Grilled & Ready® Oven Roasted Diced Chicken Breast </li> 
    <li> 1/2 c. balsamic vinegar </li> 
    <li> Kosher salt </li> 
    <li> 12 oz. fusilli pasta, or other short pasta such as rotini </li> 
    <li> 1/4 c. extra-virgin olive oil </li> 
    <li> 1/4 c. chopped fresh basil leaves, plus 1 c. packed leaves, torn if large </li>
    <li> 3 tbsp. red wine vinegar </li>
    <li> 2 tsp. Dijon mustard </li>
    <li> 1/2 tsp. garlic powder </li>
    <li> Freshly ground black pepper </li>
    <li> 10 oz. fresh mozzarella, cubed </li>
    <li> 3 c. cherry tomatoes, halved </li>
    <li> 1/2 small red onion, thinly sliced </li>
    '
    ,
    N'<li> Heat a medium-size nonstick skillet over medium heat. Add the frozen chicken and cook, stirring occasionally, until chicken is warm, about 5 minutes. Remove from heat and let cool slightly. </li> 
    <li> Meanwhile, in a small saucepan, bring the balsamic vinegar to a boil over medium-high heat; cook until thick and reduced to about 1 tablespoon, around 5 minutes. Remove from heat and let cool to room temperature. </li> 
    <li> Bring a large pot of salted water to a boil, then add and cook pasta according to package directions until al dente. Drain hot water and rinse pasta under cold water. Drain pasta well. </li> 
    <li> In a large bowl, whisk together the oil, chopped basil, red wine vinegar, Dijon, and garlic. Season with salt and pepper. </li>
    <li> Add the chicken, pasta, mozzarella, cherry tomatoes, and red onion into the bowl with the vinaigrette. Toss to coat and season with salt and pepper to taste. </li>
    <li> Fold in basil leaves and drizzle with the balsamic vinegar reduction. </li>
    ',
    4
    ),
     (N'galtad', 6, N'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-homemade-soft-pretzels-still001-1593616505.jpg?crop=0.825xw:0.735xh;0.0609xw,0.145xh&resize=640:*', N'Homemade Soft Pretzels', 105 , 1, 0, 1, 500,
    N'<li> 3/4 c. warm water (between 110° and 115°) </li> 
    <li> 1 tsp. granulated sugar </li> 
    <li> 1/2 package active dry yeast </li> 
    <li> 2 1/4 c. all-purpose flour </li> 
    <li> 3/4 tsp. kosher salt </li> 
    <li> Cooking spray </li>
    <li> 1/2 c. baking soda </li>
    <li> 1 large egg, beaten </li>
    <li> Pretzel salt </li>
    '
    ,
    N'<li> In a medium bowl or measuring cup, whisk the water and sugar until the sugar is dissolved. Sprinkle the yeast over top and let sit until the yeast begins to foam and bubble, about 5 minutes. </li> 
    <li> Add the flour and salt to a food processor and pulse to combine. Scrape yeast mixture into flour mixture and process for 30 seconds. </li> 
    <li> Spray a large bowl with cooking spray and scrape the dough from the food processor into prepared bowl. Cover with plastic and let sit until doubled in size, about 30 minutes. </li> 
    <li> Preheat the oven to 450°. Line a rimmed baking sheet with parchment paper and spray with cooking spray. </li>
    <li> On a lightly floured surface, divide risen dough into 6 equal pieces. Working with one piece at a time, keeping the other pieces covered with plastic, roll the dough into a 14-inch rope. Fold dough into a horseshoe shape. Twist ends twice and fold over top, pressing each end into the top, creating a traditional pretzel shape. Place on prepared baking sheet. Repeat with remaining pieces of dough. </li>
    <li> Bring a large pot of water to a boil. Add baking soda and return to a boil. Add one pretzel to boiling water and cook, flipping halfway through, 30 seconds. Using a slotted spoon or kitchen spider, scoop the pretzel back onto the baking sheet. Repeat with remaining pretzels. </li>
    <li> Brush tops of each pretzel with egg and sprinkle with pretzel salt. Bake until deep golden, about 12 minutes. Let cool slightly, serve warm or at room temperature. </li>
    ',
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
    (N'galtad', 222),
    (N'galtad', 223)

GO

INSERT INTO Users_FamilyRecipes
 ([userName],[recipe_id],[recipe_name],[recipes_owner],[whenMade],[ingredients],[instructions],[photoUrl])
VALUES
    (N'alongolo', 456, N'Kibbeh', N'Grandma',N'Family Reunions',
    N'<li> 2 1/2 cupsfine bulgur wheat </li>
<li> Water </li>
<li> 1 large onion, quartered </li>
<li> 1 1/2 lb lean ground beef (or lamb) </li>
<li> 2 tsp ground allspice </li>
<li> 1 tsp ground coriander </li>
<li> 1/2 tsp ground cinnamon </li>
<li> 1 tsp black pepper </li>
<li> Pinch salt </li>
<li> Oil for frying </li>
<li> Olive oil </li>
<li> 1 medium yellow onion, finely chopped or grated </li>
<li> 1 lb ground lamb or beef (I used beef here), cold </li>
<li> 1/3 cup toasted pine nuts </li>
<li> 1 tsp ground allspice </li>
<li> 1/2 tsp ground cinnamon </li>
<li> Pinch salt and pepper </li>' 
,
    N'<li> Cover a fine mesh strainer with a light cloth (a cheesecloth, if you have one). </li>
    <li> Add the bulgur wheat in, then place the strainer into a bowl filled with water. Let the fine bulgur wheat soak in the water for 15 minutes, then pull the cloth, holding the bulgur, and squeeze all the water out. You may do this a couple of times until you are sure the bulgur is rid of water. Set aside for now. </li>
<li> Now make the kibbeh (the actual dough that you will later use to form the kibbeh shells). Put the onion, ground beef, spices and pinch of salt into the bowl of a large food processor. Process until the meat is very finely ground almost into a paste. Transfer the meat mixture into a large bowl and add the bulgur wheat. Use damp hands to combine the bulgur with the meat mixture to make a dough. Cover and refrigerate until later. </li>
<li> Now make the filling. Heat about 1 tbsp olive oil in a skillet or frying pan. Saute the onion until just golden, then add the ground beef. Cook over medium heat, stirring occasionally until the meat is fully browned. Add the toasted pine nuts, the spices, and the salt and pepper. Stir to combine. Remove from the heat and set aside to cool. </li>
<li> Remove the kibbeh dough from the fridge. </li>
<li> To stuff the kibbeh, you need to have damp hands. Place a small bowl of water next to you. Prepare a baking sheet and line it with parchment paper. </li>
<li> With both the bowl of kibbeh dough and the filling near, you can begin stuffing the kibbeh. Dampen your hands with some water, take a handful of the kibbeh dough (about 2 tbsp or so) and form into somewhat of an oval-shaped disc in the palm of one hand. Use your finger to make a well in the middle of the disc, and gradually hallow the disc out to make a larger well or hole for the filling. Using a spoon, add about 1 tablespoon of the filling. Seal the dough on top and, using both hands, carefully shape it into an oval (football-type shape). Place the stuffed kibbeh on the baking sheet lined with parchment paper. Repeat the stuffing steps until you run out, be sure to have damp hands throughout. </li>
<li> Chill the stuffed kibbeh for 1 hour. </li>
<li> Heat the oil in a deep frying pan to 350 degrees F (you’ll want the oil hot enough that you can see some gentle bubbling, but not too hot where it will burn the kibbeh shells). Deep-fry the kibbeh in the hot oil, in batches being carefully not to crowd them, until the kibbeh shells are brown (about 5 minutes or so). With a slotted spoon or tongs, carefully remove the kibbeh and place them on a pan lined with paper towel to drain. Repeat until you have fried all the stuffed kibbeh. </li>
<li> Serve hot or at room temprature with tahini sauce, tzatziki sauce or plain Greek yogurt. </li>
<li> Enjoy! </li>
    ',N'https://www.themediterraneandish.com/wp-content/uploads/2016/09/Kibbeh-Recipe-16.jpg'),
    (N'alongolo', 457, N'Gefilte Fish', N'Grandma',N'Pesach',
    N'<li> 7 to 7 1/2 pounds whole carp, whitefish, and pike, filleted and ground </li>
<li> 4 quarts cold water or to just cover </li>
<li> 3 teaspoons salt or to taste </li>
<li> 3 onions, peeled </li>
<li> 4 medium carrots, peeled </li>
<li> 2 tablespoons sugar or to taste </li>
<li> 1 small parsnip, chopped (optional) </li>
<li> 3 to 4 large eggs </li>
<li> Freshly ground pepper to taste 1/2 cup cold water (approximately) </li>
<li> 1/3 cup matzah meal (approximately) </li>', 
    N'<li> Place the reserved bones, skin, and fish heads in a wide, very large saucepan with a cover. Add the water and 2 teaspoons of the salt and bring to a boil. Remove the foam that accumulates. </li>
<li> Slice 1 onion in rounds and add along with 3 of the carrots. Add the sugar and bring to a boil. Cover and simmer for about 20 minutes while the fish mixture is being prepared. </li>
<li> Place the ground fish in a bowl. In a food processor finely chop the remaining onions, the remaining carrot, and the parsnip; or mince them by hand. Add the chopped vegetables to the ground fish. </li>
<li> Add the eggs, one at a time, the remaining teaspoon of salt, pepper, and the cold water, and mix thoroughly. Stir in enough matzah meal to make a light, soft mixture into oval shapes, about 3 inches long. Take the last fish head and stuff the cavity with the ground fish mixture. </li>
<li> Remove from the saucepan the onions, skins, head, and bones and return the stock to a simmer. Gently place the fish patties in the simmering fish stock. Cover loosely and simmer for 20 to 30 minutes. Taste the liquid while the fish is cooking and add seasoning to taste. Shake the pot periodically so the fish patties wont stick. When gefilte fish is cooked, remove from the water and allow to cool for at least 15 minutes. </li>
<li> Using a slotted spoon carefully remove the gefilte fish and arrange on a platter. Strain some of the stock over the fish, saving the rest in a bowl. </li>
<li> Slice the cooked carrots into rounds cut on a diagonal about 1/4 inch thick. Place a carrot round on top of each gefilte fish patty. Put the fish head in the center and decorate the eyes with carrots. Chill until ready to serve. Serve with a sprig of parsley and horseradish. </li>',
    N'https://assets.epicurious.com/photos/57bb35a1df05218810c52150/6:4/w_620%2Ch_413/classic-gefilte-fish.jpg'),
(N'alongolo', 458, N'Honey-Garlic-Salmon', N'Father',N'Weekends',
N'<li> 4 wild caught salmon fillets about 1/2 pound or 250 grams each, skin off or on
<li> Salt and pepper, to season </li>
<li> 1/2 teaspoon paprika (mild, sweet or smokey) </li>
<li> 2 tablespoons butter </li>
<li> 4 cloves garlic, finely chopped or minced </li>
<li> 4 tablespoons honey </li>
<li> 1 tablespoon water </li>
<li> 2 teaspoons soy sauce </li>
<li> 1 tablespoon fresh squeezed lemon juice, (plus extra to serve) </li>
<li> Lemon wedges to serve </li>',
N'<li> Arrange oven shelf to the middle of your oven. Preheat oven to broil/grill settings on medium heat. </li>
<li> Season salmon with salt, pepper and paprika. Set aside. </li>
<li> Heat the butter in a skillet or pan over medium-high heat until melted. Add the garlic and sauté for about a minute, until fragrant. Pour in the honey, water and soy sauce; allow the flavours to heat through and combine. Add in the lemon juice; stir well to combine all of the flavours together. </li>
<li> Add the salmon steaks to the sauce in the pan; cook each fillet (skin-side down if theres any skin) for 3-4 minutes or until golden, while basting the tops with the pan juices. Season with salt and pepper, to taste (if desired). </li>
<li> Optional -- Add the lemon wedges around the salmon (adds a stronger lemon taste). </li>
<li> Baste salmon one more time then transfer the pan to your oven to broil / grill for a further 5-6 minutes, or until the tops of the salmon are nicely charred, and the salmon is cooked to your liking. </li>
<li> To serve, drizzle with the sauce and a squeeze of lemon juice. Serve with steamed vegetables; over rice or with a salad. </li>',
N'https://hips.hearstapps.com/del.h-cdn.co/assets/17/39/1600x2399/gallery-1506456214-delish-honey-garlic-glazed-salmon.jpg?resize=768:*'),
(N'galtad', 459, N'Salmon', N'Mother',N'Friday Meal',
N'<li> 12 ounce salmon fillet, cut into 4 pieces </li>
<li> Coarse-grained salt </li>
<li> Freshly ground black pepper </li>
<li> Toasted Almond Parsley Salsa, for serving </li>
<li> Baked squash, for serving, optional </li>', 
N'<li> Preheat the oven to 450 degrees F.
<li> Season salmon with salt and pepper. Place salmon, skin side down, on a non-stick baking sheet or in a non-stick pan with an oven-proof handle. Bake until salmon is cooked through, about 12 to 15 minutes. Serve with the Toasted Almond Parsley Salad and squash, if desired. </li>
<li> Mince the shallot and add to a small bowl. Pour the vinegar over the shallots and add a pinch of salt. Let sit for 30 minutes. </li>
<li> Roughly chop the capers, parsley and almonds and add to the shallots. Add the olive oil, tasting as you go. Mix again and adjust the seasonings. </li>
',
N'https://369t7u43n93dgc5pt43uc681-wpengine.netdna-ssl.com/wp-content/uploads/2019/03/orange-salmon-power-bowl-7.jpg'),
(N'galtad', 460, N'Brownies', N'Father',N'Friday Dessert',
N'<li> ½ cup butter </li>
<li> 1 cup white sugar </li>
<li> 2 eggs </li>
<li> 1 teaspoon vanilla extract </li>
<li> ⅓ cup unsweetened cocoa powder </li>
<li> ½ cup all-purpose flour </li>
<li> ¼ teaspoon salt </li>
<li> ¼ teaspoon baking powder </li>
<li> 3 tablespoons butter, softened </li>
<li> 3 tablespoons unsweetened cocoa powder </li>
<li> 1 tablespoon honey </li>
<li> 1 teaspoon vanilla extract </li>
<li> 1 cup confectioners sugar </li>',
N'<li> Preheat oven to 350 degrees F (175 degrees C). Grease and flour an 8-inch square pan. </li>
<li> In a large saucepan, melt 1/2 cup butter. Remove from heat, and stir in sugar, eggs, and 1 teaspoon vanilla. Beat in 1/3 cup cocoa, 1/2 cup flour, salt, and baking powder. Spread batter into prepared pan.</li>
<li> Bake in preheated oven for 25 to 30 minutes. Do not overcook. </li>
<li> To Make Frosting: Combine 3 tablespoons softened butter, 3 tablespoons cocoa, honey, 1 teaspoon vanilla extract, and 1 cup confectioners sugar. Stir until smooth. Frost brownies while they are still warm. </li>
',
N'https://www.cookingclassy.com/wp-content/uploads/2019/05/brownies-22-768x1152.jpg'),
(N'galtad', 461, N'Soup', N'Grandmother',N'Holidays',
N'<li> 3 to 3 1/2 pounds butternut squash, approximately 2, seeded and quartered </li>
<li> Unsalted butter, melted, for brushing </li>
<li> 1 tablespoon kosher salt, plus 1 teaspoon </li>
<li> 1 teaspoon freshly ground white pepper, plus 1/2 teaspoon </li>
<li> 3 cups chicken or vegetable broth </li>
<li> 1/4 cup honey </li>
<li> 1 teaspoon minced fresh ginger </li>
<li> 1/2 cup heavy cream </li>
<li> 1/4 teaspoon freshly grated nutmeg </li>
',
N'<li> Heat the oven to 400 degrees F. </li>
<li> Place the quartered squash onto a half sheet pan, brush the flesh of the squash with a little butter and season with 1 tablespoon of the salt and 1 teaspoon of the white pepper. Place in the oven and roast for 30 to 35 minutes or until the flesh is soft and tender. </li>
<li> Scoop the flesh from the skin into a 6-quart pot. Add the broth, honey and ginger. Place over medium heat and bring to a simmer, approximately 7 to 8 minutes. Using a stick blender, puree the mixture until smooth*. Stir in the heavy cream and return to a low simmer. Season with the remaining salt, pepper, and nutmeg. </li>
<li> When blending hot liquids: Remove liquid from the heat and allow to cool for at least 5 minutes. Transfer liquid to a blender or food processor and fill it no more than halfway. If using a blender, release one corner of the lid. This prevents the vacuum effect that creates heat explosions. Place a towel over the top of the machine, pulse a few times then process on high speed until smooth. </li>
',
N'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Hungarian_goulash_soup.jpg/1200px-Hungarian_goulash_soup.jpg')
GO

