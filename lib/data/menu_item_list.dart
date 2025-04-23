
import '../model/menu_item.dart';

List<MenuItem> menuItems = [
  MenuItem(
      title: "Salade césar",
      description: "Laitue, poulet, parmesan, croûtons, sauce César" ,
      price: 10.00,
      image: "https://img.freepik.com/photos-gratuite/salade-poulet-caesar-fond-blanc_1147-401.jpg?t=st=1745394347~exp=1745397947~hmac=bceabefb5033227d75b9261ac70671ea60ff4c30b33fced78855c1883114ca43&w=1380",
      category: "Entrée"
  ),
  MenuItem(
    title: "Bœuf Bourguignon",
    description: "Bœuf mijoté au vin rouge et légumes",
    price: 16.0,
    image: "https://img.freepik.com/photos-gratuite/delicieux-goulache-pret-pour-diner_23-2149370874.jpg?t=st=1745394486~exp=1745398086~hmac=d4c1d766a047b9ccf5809bdbda27a3e711467097ad919bc52b9a3559274f293c&w=740",
    category: "Plats",
  ),
  MenuItem(
    title: "Tiramisu",
    description: "Dessert italien au café",
    price: 6.0,
    image: "https://img.freepik.com/photos-gratuite/gateau-tiramisu-au-chocolat-couches-creme-mascarpone-genere-par-ai_188544-18033.jpg?t=st=1745394463~exp=1745398063~hmac=a20799f002e5378c35f90c386b1ec181ab3d7733aa44c11c933e8a9b275c9cfc&w=1380",
    category: "Desserts",
  ),
  MenuItem(
    title: "Coca-Cola",
    description: "Boisson fraîche gazeuse",
    price: 3.0,
    image: "https://img.freepik.com/photos-gratuite/ice-tomber-dans-boisson-brune_1194-1074.jpg?t=st=1745394445~exp=1745398045~hmac=f4c48c9ad053d938b506c67b5f5e7b4518a4199be1555ce10f61a34e3d66013f&w=740",
    category: "Boissons",
  ),
  MenuItem(
    title: "Bar",
    description: "Poisson pêché hier",
    price: 3.0,
    image: "https://img.freepik.com/photos-gratuite/ice-tomber-dans-boisson-brune_1194-1074.jpg?t=st=1745394445~exp=1745398045~hmac=f4c48c9ad053d938b506c67b5f5e7b4518a4199be1555ce10f61a34e3d66013f&w=740",
    category: "Poissons",
  ),
  MenuItem(
    title: "Soupe à l'oignon",
    description: "Soupe traditionnelle française gratinée au fromage",
    price: 7.0,
    image: "https://img.freepik.com/photos-gratuite/bol-soupe-oignon-fond-blanc_1147-555.jpg?t=st=1745400000~exp=1745403600~hmac=67fd5e5d9f668b85ca215c7d9c02e1fbc5e57b6fbc5232b5d2cdd8f7c6f2a8e4&w=740",
    category: "Entrée",
  ),
  MenuItem(
    title: "Salade de chèvre chaud",
    description: "Salade verte, toasts de chèvre chaud, noix et miel",
    price: 9.5,
    image: "https://img.freepik.com/photos-gratuite/salade-chevre-chaud-noix-miel_1147-540.jpg?t=st=1745400000~exp=1745403600~hmac=ad0b1c2b7b38db5a4129b6a5e8b3544eabfa66060bb2069cfb7b6f27a09907e2&w=740",
    category: "Entrée",
  ),
  MenuItem(
    title: "Poulet Basquaise",
    description: "Poulet mijoté, poivrons, tomates et épices du Sud-Ouest",
    price: 14.0,
    image: "https://img.freepik.com/photos-gratuite/poulet-basquaise-traditionnel_1147-505.jpg?t=st=1745400000~exp=1745403600~hmac=88e52a0c9e272ba4ba17877d9c7c7c74c58fc2d6e54a2bdfbfebc6b35349f9b7&w=740",
    category: "Plats",
  ),
  MenuItem(
    title: "Saumon à l’oseille",
    description: "Filet de saumon, sauce à l’oseille, riz parfumé",
    price: 17.5,
    image: "https://img.freepik.com/photos-gratuite/filet-saumon-citron-herbes_1147-429.jpg?t=st=1745400000~exp=1745403600~hmac=a7e93b9f51546366d3fdac463e206e352c9e50230a91b4d17c454fdf011564de&w=740",
    category: "Plats",
  ),
  MenuItem(
    title: "Steak frites",
    description: "Entrecôte grillée, frites maison, sauce au choix",
    price: 18.0,
    image: "https://img.freepik.com/photos-gratuite/steak-grille-frites-maison_1147-612.jpg?t=st=1745400000~exp=1745403600~hmac=84c6eeb4dfdbd7e3982999493e383651b199f71faff0c5d2c7fdd66328cf87f2&w=740",
    category: "Plats",
  ),
  MenuItem(
    title: "Crème brûlée",
    description: "Crème vanille, caramel croustillant",
    price: 5.5,
    image: "https://img.freepik.com/photos-gratuite/creme-brulee-maison-caramelisee_1147-488.jpg?t=st=1745400000~exp=1745403600~hmac=243bebdb96bc4b6d938a36a63d1d18f6a82ceaf0177c335585da151fa765e08c&w=740",
    category: "Desserts",
  ),
  MenuItem(
    title: "Fondant au chocolat",
    description: "Cœur coulant chocolat noir, glace vanille",
    price: 6.5,
    image: "https://img.freepik.com/photos-gratuite/fondant-chocolat-glace-vanille_1147-376.jpg?t=st=1745400000~exp=1745403600~hmac=755bc7a9bba9e995d61cf890c5e9fcf2a0b1d203bc9d9b531ecb90c672cfaaae&w=740",
    category: "Desserts",
  ),
  MenuItem(
    title: "Mousse au citron",
    description: "Mousse légère et acidulée au citron",
    price: 5.0,
    image: "https://img.freepik.com/photos-gratuite/mousse-citron-verre_1147-391.jpg?t=st=1745400000~exp=1745403600~hmac=0e134b7be18d64a857e51f3ad2ab186d7c3644e9ab9baeb3780c7eea1d8329ae&w=740",
    category: "Desserts",
  ),
  MenuItem(
    title: "Limonade artisanale",
    description: "Boisson rafraîchissante, citron pressé",
    price: 3.5,
    image: "https://img.freepik.com/photos-gratuite/verre-limonade-avec-tranches-citron_1147-599.jpg?t=st=1745400000~exp=1745403600~hmac=4f69a02c6e5cf363d8e37729b6878a42d58e2b24a1210e7bb049e98c5150b166&w=740",
    category: "Boissons",
  ),
  MenuItem(
    title: "Verre de vin rouge",
    description: "Sélection du sommelier, au verre",
    price: 4.5,
    image: "https://img.freepik.com/photos-gratuite/verre-vin-rouge-table_1147-206.jpg?t=st=1745400000~exp=1745403600~hmac=4c41f8f4a8bba3b6cebc33dfc6e2cf1cb979c7a594d852c58f2d4d7e6b431b5f&w=740",
    category: "Boissons",
  ),

];