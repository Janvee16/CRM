view: country_image {
  derived_table: {
    sql:SELECT 'https://deih43ym53wif.cloudfront.net/rozenhoedkaai-canal-belfry-bruges-belgium-shutterstock_1214277007_ddf11df5e3.jpeg' AS country_images, "Belgium" as office_location
             UNION ALL
             SELECT 'https://wallpaperaccess.com/full/46564.jpg' AS country_images,  "Brazil" as office_location
             UNION ALL
             SELECT 'https://wallpapercave.com/wp/wp2324982.jpg' AS country_images,  "China" as office_location
             UNION ALL
             SELECT 'https://lp-cms-production.imgix.net/2019-06/iStock_000027981718XXLarge.jpg?auto=format&fit=crop&vib=20&sharp=10&ixlib=react-8.6.4' AS country_images,  "Germany" as office_location
             UNION ALL
             SELECT 'https://wallpaperaccess.com/full/99024.jpg' AS country_images,  "Italy" as office_location
             UNION ALL
             SELECT 'https://fthmb.tqn.com/4rtDk2_LovOvqQa99FNZ3Gg_Ys8%3d/1500x1000/filters:fill(auto%2c1)/Japan-winter-59445a8c3df78c537b12379f.jpg' AS country_images,  "Japan" as office_location
             UNION ALL
            SELECT 'https://wallpapercave.com/wp/wp2208171.jpg' AS country_images,  "Jordan" as office_location
             UNION ALL
            SELECT 'https://cdn.audleytravel.com/4082/2913/79/8003731-nairobi.jpg' AS country_images,  "Kenya" as office_location
             UNION ALL
            SELECT 'https://www.roadaffair.com/wp-content/uploads/2021/04/autumn-gyeongbokgung-palace-seoul-south-korea-shutterstock_653918203.jpg' AS country_images,  "Korea" as office_location
             UNION ALL
            SELECT 'https://www.ferryto.eu/wp-content/uploads/DG-Norway.jpg' AS country_images,  "Norway" as office_location
             UNION ALL
            SELECT 'https://media.timeout.com/images/105240088/image.jpg' AS country_images,  "Panama" as office_location
             UNION ALL
            SELECT 'https://media.cntraveler.com/photos/5668630dc3c9e01555a4d421/master/pass/palawan-philippines-coron-cr-alamy.jpg' AS country_images,  "Philipines" as office_location
             UNION ALL
            SELECT 'https://i0.wp.com/www.mappingmegan.com/wp-content/uploads/2020/06/Warsaw-Poland-RF.jpg?resize=1200%2C840&ssl=1' AS country_images,  "Poland" as office_location
             UNION ALL
            SELECT 'https://worldstrides.com/wp-content/uploads/2017/10/iStock-636342182.jpg' AS country_images,  "Romania" as office_location
             UNION ALL
            SELECT 'https://www.themigrationfirm.com/wp-content/uploads/2020/03/shutterstock_1470372077.jpg' AS country_images,  "United States" as office_location
             ;;
  }

  dimension: images {
    type: string
    sql: ${TABLE}.country_images;;
  }

  # dimension: images {
  #   type: string
  #   sql:
  #       CASE
  #       WHEN ${TABLE}.country_images IS NOT NULL THEN
  #         CONCAT(${TABLE}.country_images, '" style="width:200px; height:150px;"/>')
  #       ELSE NULL
  #     END ;;
  #   html: yes ;;
  # }

  dimension: office_location {
    type: string
    sql: ${TABLE}.office_location ;;
    map_layer_name: countries
  }
}
