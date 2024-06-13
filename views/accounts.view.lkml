# The name of this view in Looker is "Accounts"
view: accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `CRM_SALES.accounts` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: string
    primary_key: yes
    sql: ${TABLE}.account ;;
  }

  dimension: employees {
    type: number
    sql: ${TABLE}.employees ;;
  }

  dimension: office_location {
    type: string
    sql: ${TABLE}.office_location ;;
    map_layer_name: countries
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}.revenue ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_revenue {
    type: sum
    sql: ${revenue} ;;  }
  measure: average_revenue {
    type: average
    sql: ${revenue} ;;  }

  dimension: sector {
    type: string
    sql: ${TABLE}.sector ;;
  }

  dimension: subsidiary_of {
    type: string
    sql: ${TABLE}.subsidiary_of ;;
  }

  dimension: year_established {
    datatype: date
    sql: COALESCE(extract( year from cast(concat(cast(accounts.year_established as string),'-01-01') as date)));;
  }
  measure: count {
    type: count
  }

  dimension: country_flag_image {
    type: string
    sql: ${TABLE}.office_location ;;
    html:<html>
      <head>
      <title>Country Flags</title>
      </head>
      <body>
      <h1>{{value}}</h1>
          {% if office_location %}
            {% if office_location._value == "Belgium" %}
      <img src="
      https://learnlab.com/wp-content/uploads/2018/03/Belgium-Flag-1.gif"
      height="170" width="255">
            {% elsif office_location._value == "Brazil" %}
      <img src="
      https://globalsherpa.org/wp-content/uploads/2012/02/brazil-flag.jpg"
      height="170" width="255">
            {% elsif office_location._value == "China" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/2/2e/Flag_of_China.png"
      height="170" width="255">
            {% elsif office_location._value == "Germany" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/b/ba/Flag_of_Germany.svg"
      height="170" width="255">
            {% elsif office_location._value == "Italy" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/en/thumb/0/03/Flag_of_Italy.svg/1920px-Flag_of_Italy.svg.png"
      height="170" width="255">
            {% elsif office_location._value == "Japan" %}
      <img src="
      https://i.pinimg.com/originals/27/a3/60/27a360982be3d75d2d1dd1455bfb204f.png"
      height="170" width="255">
            {% elsif office_location._value == "Jordan" %}
      <img src="
      https://www.worldatlas.com/img/flag/jo-flag.jpg"
      height="170" width="255">
            {% elsif office_location._value == "Kenya" %}
      <img src="
      https://wallpaperaccess.com/full/1410567.jpg"
      height="170" width="255">
            {% elsif office_location._value == "Korea" %}
      <img src="
      https://static.vecteezy.com/system/resources/previews/000/414/016/original/vector-flag-of-south-korea.jpg"
      height="170" width="255">
            {% elsif office_location._value == "Norway" %}
      <img src="
      https://cdn.pixabay.com/photo/2016/06/16/04/03/norway-1460580_960_720.jpg"
      height="170" width="255">
            {% elsif office_location._value == "Panama" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/thumb/a/ab/Flag_of_Panama.svg/1200px-Flag_of_Panama.svg.png"
      height="170" width="255">
            {% elsif office_location._value == "Philipines" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/9/99/Flag_of_the_Philippines.svg"
      height="170" width="255">
            {% elsif office_location._value == "Poland" %}
      <img src="
      https://besthqwallpapers.com/Uploads/29-7-2017/17316/flag-of-poland-polish-flag-poland-europe-silk.jpg"
      height="170" width="255">
            {% elsif office_location._value == "Romania" %}
      <img src="
      https://www.nouahsark.com/data/images/infocenter/worldwide/europe/flags_big/romania.png"
      height="170" width="255">
            {% elsif office_location._value == "United States" %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/a/a4/Flag_of_the_United_States.svg"
      height="170" width="255">
            {% else %}
      <img src="
      https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/1024px-No_image_available.svg.png"
      height="170" width="170">
            {% endif %}
          {% else %}
      <p>country information unavailable.</p>
          {% endif %}
      </body>
      </html>;;
  }
}
