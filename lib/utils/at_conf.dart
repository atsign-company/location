library my_prj.at_config;
String root = 'root.atsign.org';
int rootPort = 64;
bool debug = true;
bool verbose = true;

String kevinKey = 'e0d06915c3f81561fb5f8929caae64a7231db34fdeaff939aacac3cb736be8328c2843b518a2fc7a58fcec8c0aa98c735c0ce5f8ce880e97cd61cf1f2751efc5';
String bobKey = '33c2df30b79743ff880fc1c832a5c69170974dd736231b84ee360df89a0faff1f6efe0e83064144a7b4e5029334ad1daedc49bf82c0be1f763f590c28e33ba0a';
String aliceKey = 'b26455a907582760ebf35bc4847de549bc41c24b25c8b1c58d5964f7b4f8a43bc55b0e9a601c9a9657d9a8b8bbc32f88b4e38ffaca03c8710ebae1b14ca9f364';
String colinKey = '540f1b5fa05b40a58ea7ef82d3cfcde9bb72db8baf4bc863f552f82695837b9fee631f773ab3e34dde05b51e900220e6ae6f7240ec9fc1d967252e1aea4064ba';
String barbaraKey = 'b43edaa255f738c763c2c79df4d49a4173b02c132e164b77650383fffe16f045ef8065c2ec05df8f4ae3475e04e83c7c99e96f52de9c4d1a915b67d24f590c99';
String nameDropKey = 'NC6gYrJMRM5R4N-FUQs7KTv1jrOlj8x8ai1JFFBBrflcUxihJHtJCArMx5eENuvHn4imKnlbrbyYuJUlsYoVTkid9gAwXco4-3rd0thxzwo9bYHNW4hYkAqISElyxbzO9s20NFbbWSEkhoGN4IY9yJ';
String settingsKey = 'VkBTIoOH8LdgQ3ZZTgwQcCue8r7AkYZIa4iXtkPWQzP2XxZbaok51FkenmTi7VAycS4NhtorLjHyiipenAO6kjaLJ-qyqc-C07rO0QcWIPi5b0jIMo-zyTTFnPQP1nmmSI306ltdKkWu8W6gsmCTqq';
String companyKey = 'ikpnBQu2SAQsgxNb6mLoGQrVGK4GrUB2wjWLGzHisojHUtm27-tv4knY8KgPeoUZGxXQVofFoLoltqkQbYnzJeLI6864jMxJyjEKc82DYtvQextapZUZVjliZRTaNsbS6Vd8bYqE7iEEDEHcj60hV5';
String foundationKey = 'LsAi8y2qXh6SJwl2C3LIuuZUo3SiZ8fNAH6b7FvUmimShvOu-nSMhYrFEZGeoIf2rNu148AD7QNCD5GJjHWe7FuLW4Q0xvhmw8uvONlipE3VxCVDj8AyQiS6lyn6SPTi-GnNlDTO10d-4aEMKyHXin';
String emojiKey = '1fcb2d6d665d3a79e2eafaec38947a4f4ca3db79430a47fb43b510f46ef9a03991a0ba4ec217ff2173b5cf1324737787263c1dd28b2c0979ea06ed79f0b40118';
String colintestKey = '91890877b8054eb456e6dbd0a739d5433c200529cbe885754b7d9947b8eaa317459785bec8afb904eec947ddb36e8a22eafe12a54a39373d381f08c468ccea3f';
String gkcKey = 'c292e64ebe852ac39ef39ac5e83392672d66bdfe0e1d496bf777347019271b05012756b7d19d18beefb5f21027ef6e66b5f1637280982ca7bb295c94adf85f23';
String ashishKey = 'feacb0894de2d9476e903be2164b01194dcce1490acf6d588400ef469cdd6eb1027e2baae02acd820c3a4727905f3e4866572714fe554aa2284ec8bdced0d767';
String sameerajaKey = '67f75d44efbbd30547b9d090cf67134bc591b65ea7e1c4dec42d08e50ec4b89fc7ba5431ab1ae0b1fb4c99878955ca1f90798422526a070ef1bf2ad428c6353a';

List<String> allAtsigns = [
  'anonymous',
  '@bob',
  '@alice',
  '@colin',
  '@barbara',
  '@kevin',
  '@at_name_drop',
  '@atsign_settings',
  '@company',
  '@foundation',
  '@emoji🦄',
  '@colintest',
  '@gkc',
  '@ashish',
  '@sameeraja'
];
var secretMap = {
  'anonymous':'',
  '@kevin':kevinKey,
  '@bob':bobKey,
  '@alice':aliceKey,
  '@barbara':barbaraKey,
  '@colin':colinKey,
  '@at_name_drop':nameDropKey,
  '@atsign_settings':settingsKey,
  '@company':companyKey,
  '@foundation':foundationKey,
  '@emoji🦄':emojiKey,
  '@colintest':colintestKey,
  '@gkc' : gkcKey,
  '@ashish' : ashishKey,
  '@sameeraja' : sameerajaKey
};

List<String> profile =
['Kevin Nickels', 'atsign://phone@kevin', 'https://media-exp1.licdn.com/dms/image/C4E03AQGvxfFYc2cOmg/profile-displayphoto-shrink_200_200/0?e=1590624000&v=beta&t=msGOX1mb7Gi5bLlEd5n5J-X9sXInORdWGbXfqX5unIc'];

List<String> battestation =
['Barbara Tallent', 'https://images.com/image/C4E03AQGvxfFYc2cOmg', 'atsign://phone@barbara', 'atsign://location@barbara', 'atsign://ishuman@barbara', 'atsign://isminor@barbara'];

List<String> aprofile =
['atsign://friends.profile@alice'];

List<String> bprofile =
['atsign://bob.legalguardian@foundation'];

List<String> aIsHuman =
['atsign://alice.ishuman@snst', 'atsign://alice.ishuman@trunomi', 'atsign://alice.ishuman@foundation'];

List<String> aFriendsProfile =
['Alice', 'tel:+1-555-555-1212', 'mailto:alice@alice.com', 'Favorite class = Philosophy 101', 'https://linkedin.com/@alice123', 'https://facebook.com/@aliceboo', 'https://instagram.com/@iamalice', 'https://twitter.com/@realalice', 'atsign://phone@alice', 'atsign://whatsapp@alice', 'https://images.com/image/C4E03AQGvxfFYc2cOmg', 'atsign://ishuman@alice', 'atsign://isminor@alice'];

var ashishProfile =
{"atsign":"ashish","first_name":"Ashish","phone":"+918218636645","address":"New Jersey, USA","email":"ashishkhanna.dev@gmail.com","twitter":"ashishkhannadev","linkedin":"ashishkhannadev","facebook":"ashishkhannadev","tag_line":"Now for some internet optimism","my_status":"Do more, speak less","instagram":"https://www.instagram.com/instagram/?hl=en","profile_pic":"https://media-exp1.licdn.com/dms/image/C4D03AQFxGN_tQZv8-w/profile-displayphoto-shrink_200_200/0?e=1593648000&v=beta&t=HxDRUMei9Yl0ON5r-hx4ONuMw5HwZFmokjayUp1rEqs"};