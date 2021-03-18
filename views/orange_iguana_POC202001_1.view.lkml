  view: ib_hybrid_phu_test1 {
    sql_table_name: `orange-iguana.prod.ib_hybrid_POC202001_4`;;
    # BEGIN EDITED PIECE



    parameter: target_select {
      type: string
      default_value: "2"
      allowed_value: {
        label: "Macy's Apparel Segment 1"
        value: "1"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 2"
        value: "2"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 3"
        value: "3"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 4"
        value: "4"
      }
    }

    parameter: refrence_select {
      type: string
      default_value: "0"
      allowed_value: {
        label: "Standard Reference Population"
        value: "0"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 1"
        value: "1"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 2"
        value: "2"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 3"
        value: "3"
      }
      allowed_value: {
        label: "Macy's Apparel Segment 4"
        value: "4"
      }
    }


    # Randomly generating a 1 or 0 here
    dimension: target_flg {
      type: string
      # ${TABLE}.cib8609_marital_status
      # sql: CASE WHEN LOWER(${cib8609_marital_status}) LIKE '%single%' THEN 1 ELSE 0 END ;;
      sql:  ${TABLE}.target_flg;;
      # sql: CASE WHEN (floor(rand()*100)+1) > 25 THEN 1 ELSE 0 END ;;
    }



###############################################################################################
### STANDARD CALCS
###############################################################################################

    # If parameter set to target A, then use target A flag here
    # If parameters set to b, then put target B flag here
    measure: target_count {
      type: number
      #sql: sum(${target_flg})
      sql: SUM(CASE WHEN {{target_select._parameter_value}} = ${target_flg} THEN 1 ELSE 0 END)
        ;;
    }

    measure: reference_count {
      type: number
      sql: sum(CASE WHEN ${target_flg} = {{refrence_select._parameter_value}} THEN 1 ELSE 0 END) ;;
    }

# This percent_of_total calculation is doing something weird
    # measure: percent_of_total_target {
    #   type: percent_of_total
    #   sql: ${target_count};;
    # }

    # measure: percent_of_total_reference {
    #   type: percent_of_total
    #   sql: ${reference_count};;
    # }

    measure: percent_of_total_target {
      type: number
      value_format_name: percent_1
      sql:  ${target_count} / SUM(${target_count}) OVER() ;;
    }

    measure: percent_of_total_reference {
      type: number
      value_format_name: percent_1
      sql:  ${reference_count_for_percentage} / SUM(${reference_count_for_percentage}) OVER() ;;
    }

    measure: index_value_calc {
      type: percent_of_total
      value_format_name: decimal_0
      sql: (${percent_of_total_target}/NULLIF(${percent_of_total_reference},0)) * 100 ;;
    }

    measure: index_value {
      type: percent_of_total
      value_format_name: decimal_0
      sql: (${percent_of_total_target}/NULLIF(${percent_of_total_reference},0)) * 100 ;;
    }

    measure: index {
      type: percent_of_total
      value_format_name: decimal_0
      sql: (${percent_of_total_target}/NULLIF(${percent_of_total_reference},0)) * 100 ;;
      html:
          {% if value <= 20 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-3.png" height:20 width=20></p>
          {% elsif value > 20 and value <= 50 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-2.png" height:20 width=20></p>
          {% elsif value > 50 and value <= 80 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-1.png" height:20 width=20></p>
          {% elsif value > 80 and value <= 120 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-none.png" height:20 width=20></p>
          {% elsif value > 120 and value <= 180 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-1.png" height:20 width=20></p>
          {% elsif value > 180 and value <= 250 %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-2.png" height:20 width=20></p>
          {% else %}
          <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-3.png" height:20 width=20></p>
          {% endif %}
          ;;
    }


##############################################################################################
##  INTEREST CALCS
##############################################################################################

    # measure: target_sum_i {
    #   type: number
    #   sql:SUM(CASE WHEN ${target_flg} = {{target_select._parameter_value}} THEN cast(${ibe_interests.value} as int64 ) ELSE 0 END);;
    # }

    # measure: target_count_i {
    #   # sql_distinct_key:${ibe_interests} ;;
    #   type: number
    #   sql:SUM(CASE WHEN ${target_flg} = {{target_select._parameter_value}} THEN 1 ELSE 0 END);;
    # }

    # measure: reference_sum_i {
    #   type: number
    #   sql:SUM(CASE WHEN ${target_flg} = {{refrence_select._parameter_value}} THEN cast(${ibe_interests.value} as int64 ) ELSE 0 END);;
    # }

    measure: reference_count_for_percentage {
      type: number
      sql:SUM(CASE WHEN ${target_flg} = {{refrence_select._parameter_value}} THEN 1 ELSE 0 END);;
    }

    # measure: percent_of_total_target_i {
    #   type: number
    #   value_format_name: percent_1
    #   sql: (${target_sum_i}/NULLIF(${target_count_i},0));;
    # }

    # measure: percent_of_total_reference_i {
    #   # sql_distinct_key:${ibe_interests} ;;
    #   type: number
    #   value_format_name: percent_1
    #   sql: (${reference_sum_i}/NULLIF(${reference_count_i},0));;
    # }

    # measure: index_i {
    #   # sql_distinct_key:${ibe_interests} ;;
    #   type: percent_of_total
    #   value_format_name: decimal_1
    #   sql: (${percent_of_total_target_i}/NULLIF(${percent_of_total_reference_i},0)) * 100;;
    # }

    # measure: index_i_html {
    #   type: percent_of_total
    #   value_format_name: decimal_0
    #   sql: (${percent_of_total_target_i}/NULLIF(${percent_of_total_reference_i},0)) * 100;;
    #   html:
    #       {% if value <= 20 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-3.png" height:20 width=20></p>
    #       {% elsif value > 20 and value <= 50 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-2.png" height:20 width=20></p>
    #       {% elsif value > 50 and value <= 80 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-down-1.png" height:20 width=20></p>
    #       {% elsif value > 80 and value <= 120 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-none.png" height:20 width=20></p>
    #       {% elsif value > 120 and value <= 180 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-1.png" height:20 width=20></p>
    #       {% elsif value > 180 and value <= 250 %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-2.png" height:20 width=20></p>
    #       {% else %}
    #       <p><font style="color:#cccccc">{{rendered_value}}</font><img src="https://storage.googleapis.com/orange-iguana-image-host/oi-viz-icons/icon-index-chevron-up-3.png" height:20 width=20></p>
    #       {% endif %}
    #       ;;
    # }






    # TESTING

    measure: target_pct_bar {
      description: "Same as target percentage but renders as a bar"
      sql: ${percent_of_total_target} ;;
      view_label: "Visual Fields"
      type: number
      value_format_name: percent_1
      html: <div class="container-fluid" style="height:{{circle_size._parameter_value}}px;"><div class="progress" style="line-height:{{circle_size._parameter_value}}px; height:{{circle_size._parameter_value}}px;">
          <div class="progress-bar" role="progressbar" aria-valuenow="{{ value | times: 100 }}" aria-valuemin="0" aria-valuemax="100" style="background-color:#8EA6BB !important; width:{{ value | times: 100 }}%">
          <span style="float:left;text-align:center;font-size:{{font_size._parameter_value}}px !important;color:{{font_color._parameter_value}};line-height:{{circle_size._parameter_value}}px; height:{{circle_size._parameter_value}}px;">{{rendered_value}}</span>
          </div>
          </div></div> ;;
    }



###############################################################################################
### KPIS
###############################################################################################


    measure: gender_kpi {
      type: number
      sql: CASE
              WHEN (${target_count} - LAG(${target_count}) OVER (ORDER BY ${target_count} ASC)) / ${target_count} IS NULL THEN 'null'
              WHEN (${target_count} - LAG(${target_count}) OVER (ORDER BY ${target_count} ASC)) / ${target_count} <= .1
                THEN CONCAT(${cib8688_gender}
                  ,'/',LAG(${cib8688_gender}) OVER(ORDER BY ${target_count} ASC))
              ELSE ${cib8688_gender}
              END ;;
      html: <font size="5">{{value}}</font> ;;
    }

    measure: household_kpi {
      type: string
      sql: ${cib8629_household_size} ;;
      html: <font size="5">{{value}}</font> ;;
    }

    dimension: age_kpi {
      type: string
      sql: ${cib8616_age_range} ;;
      html: <font size="5">{{value}}</font> ;;
    }

    dimension: income_kpi {
      type: string
      sql: ${cib8641_income_hh} ;;
      html: <font size="5">{{value}}</font> ;;
    }

    dimension: education_kpi {
      type: string
      sql: ${cib9509_education} ;;
      html: <font size="5">{{value}}</font> ;;
    }

    dimension: marital_kpi {
      type: string
      sql: ${cib8609_marital_status} ;;
      html: <font size="5">{{value}}</font> ;;
    }
    dimension: children_kpi {
      type: string
      sql: ${cib8602_num_child_in_hh} ;;
      html: <font size="5">{{value}}</font> ;;
    }

    dimension: vehicle_number_kpi {
      type: string
      sql: ${cib8647_num_vehicles} ;;
      html: <font size="5">{{value}}</font> ;;
    }



###############################################################################################
### DIMENSIONS
###############################################################################################




    dimension: address_link_sha256 {
      type: string
      sql: ${TABLE}.address_link_sha256 ;;
    }


    dimension: household_link_sha256 {
      type: string
      sql: ${TABLE}.household_link_sha256 ;;
    }


    dimension: consumer_link_sha256 {
      primary_key: yes
      type: string
      sql: TO_BASE64(${TABLE}.consumer_link_sha256) ;;
    }


    dimension: ibe_aps {
      hidden: yes
      sql: ${TABLE}.ibe_aps ;;
    }

    dimension: ibe_elements {
      hidden: yes
      sql: ${TABLE}.ibe_elements ;;
    }

    dimension: ibe_interests {
      hidden: yes
      sql: ${TABLE}.ibe_interests ;;
    }

    dimension: ibe_spending {
      hidden: yes
      sql: ${TABLE}.ibe_spending ;;
    }

    dimension: ibe_media {
      hidden: yes
      sql: ${TABLE}.ibe_media ;;
    }

    dimension: ibe_household {
      hidden: yes
      sql: ${TABLE}.ibe_household ;;
    }

    dimension: ibe_financial {
      hidden: yes
      sql: ${TABLE}.ibe_financial ;;
    }

    dimension: ibe_vehicle {
      hidden: yes
      sql: ${TABLE}.ibe_vehicle ;;
    }

    measure: count {
      type: count
      drill_fields: []
    }




###############################################################################################
### FILTERS
###############################################################################################


    dimension: cib8609_marital_status_filter {
      type: string
      label: "Marital Status Filter"
      description: "Indicates whether anyone in the household is married. This element includes 1) 9609 Marital Status in the Household and 2) business rule inferences that create Inferred Married and Inferred Single to increase marital status coverage."
      sql:
        CASE WHEN LOWER(${cib8609_marital_status}) LIKE '%single%' THEN "Single"
          WHEN LOWER(${cib8609_marital_status}) LIKE '%married%' THEN "Married"
        ELSE ${cib8609_marital_status} END
      ;;
    }

    dimension: cib8688_gender_filter {
      type: string
      label: "Gender Filter"
      description: "Indicates the gender of the person."
      sql: ${TABLE}.cib8688_gender ;;
    }
    dimension: cib8616_age_range_filter {
      type: string
      label: "Age Range Filter"
      description: "Indicates the age of the person ranked 1st in the household, based on a series of InfoBase ranking rules."
      sql: ${TABLE}.cib8616_age_range ;;
    }

    dimension: cib8604_occupation_filter {
      type: string
      label: "Occupation Filter"
      description: "Indicates the occupation of the 1st individual in the household."
      sql: ${TABLE}.cib8604_occupation ;;
    }

###############################################################################################
### GEOGRAPHY
###############################################################################################


    dimension: DMA_CODE_3010_geo_dma {
      label: "Designated Marketing Area (DMA)"
      map_layer_name: dma
      description: "The geographic areas in the United States in which local television viewing is measured by The Nielsen Company. A DMA region is a group of counties that form an exclusive geographic area in which the home market television stations hold a dominance of total hours viewed. There are 210 DMA regions, covering the entire continental United States, Hawaii, and parts of Alaska. The DMA boundaries and DMA data are owned solely and exclusively by The Nielsen Company. Any use and or reproduction of these materials without the express written consent of The Nielsen Company is strictly prohibited."
      sql: ${TABLE}.DMA_CODE_3010_geo_dma ;;
      # sql: CAST( TRIM( ( CASE WHEN LENGTH(${TABLE}.DMA_CODE_3010_geo_dma) > 2 THEN ${TABLE}.DMA_CODE_3010_geo_dma END ) ) AS INT64);;
    }

    dimension: FIPS_STATE_CODE_3016_geo_state {
      type: string
      map_layer_name: us_states
      label: "State"
      description: "A unique identifier for Federal Information Processing Standards (FIPS) used to identify the 50 states, the District of Columbia, and the outlying areas of the United States."
      sql: ${TABLE}.FIPS_STATE_CODE_3016_geo_state ;;
    }


###############################################################################################
### PROGRAMMATICALLY GENERATED DIMENSIONS
###############################################################################################



    dimension: cib1270_px_lifestage_segment {
      type: string
      label: "Personicx Lifestage Segment Code"
      description: "Indicates the precision used in the append of the Personicx Lifestage Cluster Code (household, ZIP4, ZIP). Personicx Lifestage Cluster Code is a powerful household-level segmentation system that places each US household in one of 70 segments based on similiar demographic, socio-economic, and consumer behavior."
      sql: ${TABLE}.cib1270_px_lifestage_segment ;;
    }

    dimension: cib1271_px_lifestage_group {
      type: string
      label: "Personicx Lifestage Group Code"
      description: "These 21 groups provide a higher level aggregate of the 70 Personicx Lifestage Clusters, a household-level segmentation system, grouping the consumer segments by similar life stage characteristics."
      sql: ${TABLE}.cib1271_px_lifestage_group ;;
    }

    dimension: cib1274_px_lifestage_insurance_group {
      type: string
      label: "Personicx Lifestage Insurance Group Code"
      description: "The 13 Personicx Lifestage Insurance Groups segment U.S. consumers by similar demographic and insurance tendencies. This segmentation system is based on the 70 Personicx Lifestage Clusters, providing a manageable number of segments for insights into insurance-related consumer behavior."
      sql: ${TABLE}.cib1274_px_lifestage_insurance_group ;;
    }


    dimension: nib8642_home_market_value {
      type: string
      label: "Home Market Value (Numeric)"
      description: "Indicates the estimated market value of the home. This home market value element is built with multiple sources of household level source data (91%) and with multiple sources of geographical data (9%)."
      sql: ${TABLE}.nib8642_home_market_value ;;
    }

    dimension: nib8663_home_equity_available {
      type: string
      label: "Home Equity Available (Numeric)"
      description: "Indicates the estimated available equity for a mortgage"
      sql: ${TABLE}.nib8663_home_equity_available ;;
    }

    dimension: cib8642_home_market_value {
      type: string
      label: "Home Market Value"
      description: "Indicates the estimated market value of the home, in ranges. This home market value element is built with multiple sources of household level source data (91%) and with multiple sources of geographical data (9%)."
      sql: ${TABLE}.cib8642_home_market_value ;;
    }

    dimension: nib8607_years_at_residence {
      type: number
      value_format: "0"
      html: <p style=“text-align:left”>{{ rendered_value }}</p>;;
      label: "Years at Residence"
      description: "Indicates the years a household has lived at their address. The Length of Residence can apply to renters as well as homeowners.  This element is fed by Purchase Date of Home, Move Date, other information where a person has indicated their household's length of residence, or the source has inferred a length of residence from a first-seen date, the date a landline phone was connected, etc. "
      sql: ${TABLE}.nib8607_years_at_residence ;;
    }

    dimension: cib8436_home_length_of_residence_real {
      type: string
      label: "Home Length of Residence - Broad Ranges (Real Property data only)"
      description: "nan"
      sql: ${TABLE}.cib8436_home_length_of_residence_real ;;
    }

    dimension: cib8606_home_ownership {
      type: string
      label: "Home Ownership"
      description: "Indicates whether a household is owner or renter occupied. This element is fed by property data, self-reported data and address data which indicates the home is owned by the household or rented by the household, i.e., home purchase date, loan information, some indications in the address field that would indicate the property is a rental."
      sql: ${TABLE}.cib8606_home_ownership ;;
    }

    dimension: cib8625_home_property_type {
      type: string
      label: "Home Property Type"
      description: "Indicates the type of property."
      sql: ${TABLE}.cib8625_home_property_type ;;
    }

    dimension: cib8608_home_dwelling_type {
      type: string
      label: "Dwelling Type"
      description: "Indicates if more than one family lives at a particular address. Single-family dwelling units are defined as residential buildings housing one family or household, such as a house. The building does not share an inside wall with any other house or dwelling. It does not touch any other dwelling. Multi-family dwelling units are defined as residential buildings housing more than one household. i.e., Multiple separate housing units for residential inhabitants are contained within one building or several buildings within one complex, such as an apartment building. Condos are coded as multi-family dwelling units."
      sql: ${TABLE}.cib8608_home_dwelling_type ;;
    }

    dimension: cib8609_marital_status {
      type: string
      label: "Marital Status"
      description: "Indicates whether anyone in the household is married. This element includes 1) 9609 Marital Status in the Household and 2) business rule inferences that create Inferred Married and Inferred Single to increase marital status coverage."
      sql: ${TABLE}.cib8609_marital_status ;;
    }

    dimension: cib8629_household_size {
      type: string
      label: "Household Size"
      description: "Indicates the known number of known people in the household, both adults and children. Household Size is a sum of Number of Adults and Number of Children."
      sql: ${TABLE}.cib8629_household_size ;;
    }

    dimension: cib8628_num_adults_in_hh {
      type: string
      label: "Number of Adults in Household"
      description: "Indicates the known number of adults (18+) living in the household. This element is created by tabling all of the adults in a household that are provided from all of the sources.  This data is directly related to the names that are in the 1st - 5th individual/household data and 2526 Inferred Household Rank."
      sql: ${TABLE}.cib8628_num_adults_in_hh ;;
    }

    dimension: cib8602_num_child_in_hh {
      type: string
      label: "Number of Children in Household"
      description: "Indicates the known number of children in the household."
      sql: ${TABLE}.cib8602_num_child_in_hh ;;
    }

    dimension: nib8601_01_composition_children_00_02_M {
      type: string
      label: "Composition of Children - 00 to 02 Male"
      description: "Indicates the presence of male children age 0 to 2 in the household."
      sql: ${TABLE}.nib8601_01_composition_children_00_02_M ;;
    }

    dimension: nib8601_02_composition_children_00_02_F {
      type: string
      label: "Composition of Children - 00 to 02 Female"
      description: "Indicates the presence of female children age 0 to 2 in the household."
      sql: ${TABLE}.nib8601_02_composition_children_00_02_F ;;
    }

    dimension: nib8601_03_composition_children_00_02_U {
      type: string
      label: "Composition of Children - 00 to 02 Unknown Gender"
      description: "Indicates the presence of children of unknown gender(s) age 0 to 2 in the household."
      sql: ${TABLE}.nib8601_03_composition_children_00_02_U ;;
    }

    dimension: nib8601_04_composition_children_03_05_M {
      type: string
      label: "Composition of Children - 03 to 05 Male"
      description: "Indicates the presence of male children age 3 to 5 in the household."
      sql: ${TABLE}.nib8601_04_composition_children_03_05_M ;;
    }

    dimension: nib8601_05_composition_children_03_05_F {
      type: string
      label: "Composition of Children - 03 to 05 Female"
      description: "Indicates the presence of female children age 3 to 5 in the household."
      sql: ${TABLE}.nib8601_05_composition_children_03_05_F ;;
    }

    dimension: nib8601_06_composition_children_03_05_U {
      type: string
      label: "Composition of Children - 03 to 05 Unknown Gender"
      description: "Indicates the presence of children of unknown gender(s) age 3 to 5 in the household."
      sql: ${TABLE}.nib8601_06_composition_children_03_05_U ;;
    }

    dimension: nib8601_07_composition_children_06_10_M {
      type: string
      label: "Composition of Children - 06 to 10 Male"
      description: "Indicates the presence of male children age 6 to 10 in the household."
      sql: ${TABLE}.nib8601_07_composition_children_06_10_M ;;
    }

    dimension: nib8601_08_composition_children_06_10_F {
      type: string
      label: "Composition of Children - 06 to 10 Female"
      description: "Indicates the presence of female children age 6 to 10 in the household."
      sql: ${TABLE}.nib8601_08_composition_children_06_10_F ;;
    }

    dimension: nib8601_09_composition_children_06_10_U {
      type: string
      label: "Composition of Children - 06 to 10 Unknown Gender"
      description: "Indicates the presence of children of unknown gender(s) age 6 to 10 in the household."
      sql: ${TABLE}.nib8601_09_composition_children_06_10_U ;;
    }

    dimension: nib8601_10_composition_children_11_15_M {
      type: string
      label: "Composition of Children - 11 to 15 Male"
      description: "Indicates the presence of male children age 11 to 15 in the household."
      sql: ${TABLE}.nib8601_10_composition_children_11_15_M ;;
    }

    dimension: nib8601_11_composition_children_111_15_F {
      type: string
      label: "Composition of Children - 11 to 15 Female"
      description: "Indicates the presence of female children age 11 to 15 in the household."
      sql: ${TABLE}.nib8601_11_composition_children_111_15_F ;;
    }

    dimension: nib8601_12_composition_children_111_15_U {
      type: string
      label: "Composition of Children - 11 to 15 Unknown Gender"
      description: "Indicates the presence of children of unknown gender(s) age 11 to 15 in the household."
      sql: ${TABLE}.nib8601_12_composition_children_111_15_U ;;
    }

    dimension: nib8601_13_composition_children_16_17_M {
      type: string
      label: "Composition of Children - 16 to 17 Male"
      description: "Indicates the presence of male children age 16 to 17 in the household."
      sql: ${TABLE}.nib8601_13_composition_children_16_17_M ;;
    }

    dimension: nib8601_14_composition_children_16_17_F {
      type: string
      label: "Composition of Children - 16 to 17 Female"
      description: "Indicates the presence of female children age 16 to 17 in the household."
      sql: ${TABLE}.nib8601_14_composition_children_16_17_F ;;
    }

    dimension: nib8601_15_composition_children_16_17_U {
      type: string
      label: "Composition of Children - 16 to 17 Unknown Gender"
      description: "Indicates the presence of children of unknown gender(s) age 16 to 17 in the household."
      sql: ${TABLE}.nib8601_15_composition_children_16_17_U ;;
    }

    dimension: nib8603_01_childs_age_00 {
      type: string
      label: "Children's Age - Less Than Age 01"
      description: "Indicates the presence of children less than age 1 in the household."
      sql: ${TABLE}.nib8603_01_childs_age_00 ;;
    }

    dimension: nib8603_02_childs_age_01 {
      type: string
      label: "Children's Age - 01"
      description: "Indicates the presence of children age 1 in the household."
      sql: ${TABLE}.nib8603_02_childs_age_01 ;;
    }

    dimension: nib8603_03_childs_age_02 {
      type: string
      label: "Children's Age - 02"
      description: "Indicates the presence of children age 2 in the household."
      sql: ${TABLE}.nib8603_03_childs_age_02 ;;
    }

    dimension: nib8603_04_childs_age_03 {
      type: string
      label: "Children's Age - 03"
      description: "Indicates the presence of children age 3 in the household."
      sql: ${TABLE}.nib8603_04_childs_age_03 ;;
    }

    dimension: nib8603_05_childs_age_04 {
      type: string
      label: "Children's Age - 04"
      description: "Indicates the presence of children age 4 in the household."
      sql: ${TABLE}.nib8603_05_childs_age_04 ;;
    }

    dimension: nib8603_06_childs_age_05 {
      type: string
      label: "Children's Age - 05"
      description: "Indicates the presence of children age 5 in the household."
      sql: ${TABLE}.nib8603_06_childs_age_05 ;;
    }

    dimension: nib8603_07_childs_age_06 {
      type: string
      label: "Children's Age - 06"
      description: "Indicates the presence of children age 6 in the household."
      sql: ${TABLE}.nib8603_07_childs_age_06 ;;
    }

    dimension: nib8603_08_childs_age_07 {
      type: string
      label: "Children's Age - 07"
      description: "Indicates the presence of children age 7 in the household."
      sql: ${TABLE}.nib8603_08_childs_age_07 ;;
    }

    dimension: nib8603_09_childs_age_08 {
      type: string
      label: "Children's Age - 08"
      description: "Indicates the presence of children age 8 in the household."
      sql: ${TABLE}.nib8603_09_childs_age_08 ;;
    }

    dimension: nib8603_10_childs_age_09 {
      type: string
      label: "Children's Age - 09"
      description: "Indicates the presence of children age 9 in the household."
      sql: ${TABLE}.nib8603_10_childs_age_09 ;;
    }

    dimension: nib8603_11_childs_age_10 {
      type: string
      label: "Children's Age - 10"
      description: "Indicates the presence of children age 10 in the household."
      sql: ${TABLE}.nib8603_11_childs_age_10 ;;
    }

    dimension: nib8603_12_childs_age_11 {
      type: string
      label: "Children's Age - 11"
      description: "Indicates the presence of children age 11 in the household."
      sql: ${TABLE}.nib8603_12_childs_age_11 ;;
    }

    dimension: nib8603_13_childs_age_12 {
      type: string
      label: "Children's Age - 12"
      description: "Indicates the presence of children age 12 in the household."
      sql: ${TABLE}.nib8603_13_childs_age_12 ;;
    }

    dimension: nib8603_14_childs_age_13 {
      type: string
      label: "Children's Age - 13"
      description: "Indicates the presence of children age 13 in the household."
      sql: ${TABLE}.nib8603_14_childs_age_13 ;;
    }

    dimension: nib8603_15_childs_age_14 {
      type: string
      label: "Children's Age - 14"
      description: "Indicates the presence of children age 14 in the household."
      sql: ${TABLE}.nib8603_15_childs_age_14 ;;
    }

    dimension: nib8603_16_childs_age_15 {
      type: string
      label: "Children's Age - 15"
      description: "Indicates the presence of children age 15 in the household."
      sql: ${TABLE}.nib8603_16_childs_age_15 ;;
    }

    dimension: nib8603_17_childs_age_16 {
      type: string
      label: "Children's Age - 16"
      description: "Indicates the presence of children age 16 in the household."
      sql: ${TABLE}.nib8603_17_childs_age_16 ;;
    }

    dimension: nib8603_18_childs_age_17 {
      type: string
      label: "Children's Age - 17"
      description: "Indicates the presence of children age 17 in the household."
      sql: ${TABLE}.nib8603_18_childs_age_17 ;;
    }

    dimension: nib8603_19_childs_age_18 {
      type: string
      label: "Children's Age - 18"
      description: "Always blank."
      sql: ${TABLE}.nib8603_19_childs_age_18 ;;
    }

    dimension: cib8622_presence_of_children {
      type: string
      label: "Presence of Children"
      description: "Indicates the presence of children in the household."
      sql: ${TABLE}.cib8622_presence_of_children ;;
    }

    dimension: nib8591_home_pool_present {
      type: string
      label: "Home Pool Present"
      description: "Indicates there is a pool present at this home."
      sql: ${TABLE}.nib8591_home_pool_present ;;
    }

    dimension: nib8439_home_lot_sq_footage {
      type: number
      value_format: "0"
      html: <p style=“text-align:left”>{{ rendered_value }}</p>;;
      label: "Home Lot Square Footage"
      description: "Indicates the size of the home lot in ranged square footage."
      sql: ${TABLE}.nib8439_home_lot_sq_footage ;;
    }

    dimension: cib8441_home_sq_footage {
      type: string
      label: "Home Square Footage"
      description: "Indicates the size of the home in ranged square footage."
      sql: ${TABLE}.cib8441_home_sq_footage ;;
    }

    dimension: cib8763_home_yr_built {
      type: string
      label: "Home Year Built"
      description: "Indicates the year the home was built in ranges."
      sql: ${TABLE}.cib8763_home_yr_built ;;
    }

    dimension: nib8597_home_bedroom_cnt_real {
      type: string
      label: "Home Bedroom Count (Real Property data only)"
      description: "Indicates the number of bedrooms in the residence."
      sql: ${TABLE}.nib8597_home_bedroom_cnt_real ;;
    }

    dimension: nib8592_home_yr_built_real {
      type: string
      label: "Home Year Built - Actual (Real Property data only)"
      description: "Indicates the year that home was constructed."
      sql: ${TABLE}.nib8592_home_yr_built_real ;;
    }

    dimension: cib8616_age_1st_in_hh {
      type: string
      label: "Age - 1st Person in Household"
      description: "Indicates the age of the person ranked 1st in the household, based on a series of InfoBase ranking rules.
      NOTE: Age data is calculated from date of birth. The age calculated may be based on complete date of birth (year, month and day) or incomplete date of birth (year and month or year-only). If date of birth is not populated, age elements will not be populated. The exception to this is modeled/inferred age data, which is only in the PLUS and 100% elements, and is indicated as modeled or inferred."
      sql: ${TABLE}.cib8616_age_1st_in_hh ;;
    }

    dimension: cib3103_hispanic_language_pref {
      type: string
      label: "Hispanic Language Preference"
      description: "Likely Country of Origin of the 1st person in the household, based on a surname/heritage of surname table."
      sql: ${TABLE}.cib3103_hispanic_language_pref ;;
    }

    dimension: nib8680_young_adult_in_hh {
      type: string
      label: "Young Adult in Household"
      description: "Indicates that there is a young adult in the household where another adult is identified as the 1st individual. (Young adult is ages 18 to 25.)"
      sql: ${TABLE}.nib8680_young_adult_in_hh ;;
    }

    dimension: nib8692_senior_adult_in_hh {
      type: string
      label: "Senior Adult in Household"
      description: "If in the household there is a person over age 55 and a person over age 25, and there is at least 18 years difference between them, then turn on ‘Senior in Household’."
      sql: ${TABLE}.nib8692_senior_adult_in_hh ;;
    }

    dimension: cib8688_gender {
      type: string
      label: "Gender"
      description: "Indicates the gender of the person."
      sql: ${TABLE}.cib8688_gender ;;
    }

    dimension: nib8616_age {
      type: string
      label: "Age"
      description: "Indicates the age of the person ranked 1st in the household, based on a series of InfoBase ranking rules."
      sql: ${TABLE}.nib8616_age ;;
    }

    dimension: cib8616_age_range {
      type: string
      label: "Age Ranges"
      description: "Indicates the age of the person ranked 1st in the household, based on a series of InfoBase ranking rules."
      sql: ${TABLE}.cib8616_age_range ;;
    }

    dimension: cib8604_occupation {
      type: string
      label: "Occupation - 1st Person in Household"
      description: "Indicates the occupation of the 1st individual in the household."
      sql: ${TABLE}.cib8604_occupation ;;
    }

    dimension: cib8605_occupation {
      type: string
      label: "Occupation - 2nd Person in Household"
      description: "nan"
      sql: ${TABLE}.cib8605_occupation ;;
    }

    dimension: cib9509_education {
      type: string
      label: "Education"
      description: "Indicates the highest known education of the 1st ranked person in the household. The ranking is based on a series of InfoBase ranking rules."
      sql: ${TABLE}.cib9509_education ;;
    }

    dimension: cib8641_income_hh {
      type: string
      label: "Household Income"
      description: "Indicates the estimated household income in broad ranges. This income is about 3-5% consumer self-reported via indicating their income on product registrations and website memberships, and about 95-98% modeled from the sources, based on a variety of demographic factors, including age, occupation, home ownership, and median income for the local area.  Acxiom blends all of the source income data (the self-reported and the modeled data from the sources) into the Acxiom household level income elements using several rules including recency, commonality, and hierarchy. This income element has different ranges/values than the other income elements."
      sql: ${TABLE}.cib8641_income_hh ;;
    }

    dimension: cib8487_political_affiliation {
      type: string
      label: "Political Affiliation"
      description: "Indicates the political party of the 1st individual for voting purposes."
      sql: ${TABLE}.cib8487_political_affiliation ;;
    }

    dimension: cib9533_ethnicity {
      type: string
      label: "Ethnicity"
      description: "Indicates the race of the person."
      sql: ${TABLE}.cib9533_ethnicity ;;
    }

    dimension: cib3101_race_cd_low_detail {
      type: string
      label: "Race Code (Low Detail)"
      description: "Likely Race/Ethnicity of the 1st person in the household, based on self-reported sources, public sources, and surname/Ethnicity tables."
      sql: ${TABLE}.cib3101_race_cd_low_detail ;;
    }

    dimension: cib8652_generations_in_hh {
      type: string
      label: "Generations in Household"
      description: "Indicates the number of family generations in a household."
      sql: ${TABLE}.cib8652_generations_in_hh ;;
    }

    dimension: cib9350_economic_stability_ind {
      type: string
      label: "Economic Stability Score"
      description: "ESI is an easy to apply model score that is able to predict likely ITA (Invitation to Apply) approvals. Marketers can use ESI as a relative measure of likelihood than an ITA responder will go on to meet their credit approval standards. ESI scores may be incorporated into custom models or used as a selection tool for an ITA marketing list. ESI is built using non-credit data."
      sql: ${TABLE}.cib9350_economic_stability_ind ;;
    }

    dimension: cib9358_heavy_transactors {
      type: string
      label: "Heavy Transactors"
      description: "A model score that indicates the likelihood of credit card usage 20+ times a month. It is built on a foundation of InfoBase and geographic data, including factors related to credit card and retail activity. This product offering is optimal for new and existing credit card holders on upsell/cross products, HELOC candidates, etc."
      sql: ${TABLE}.cib9358_heavy_transactors ;;
    }

    dimension: nib8816_lines_of_credit {
      type: number
      value_format: "0"
      html: <p style=“text-align:left”>{{ rendered_value }}</p>;;
      label: "Lines of Credit"
      description: "Indicates credit purchases made in multiple retail stores for the household."
      sql: ${TABLE}.nib8816_lines_of_credit ;;
    }

    dimension: cib8621_01_cc_ind_bank_card {
      type: string
      label: "Credit Card Indicator - Bank Card"
      description: "Indicates possession of VISA or Mastercard bankcard(s) in a household."
      sql: ${TABLE}.cib8621_01_cc_ind_bank_card ;;
    }

    dimension: cib8621_02_cc_ind_gas {
      type: string
      label: "Credit Card Indicator - Gas"
      description: "Indicates possession of gas, department store, or retail store credit card(s) in a household. A department store card is like JCPenney, Sears, or Montgomery Ward. A retail card is like Home Depot, Victoria Secret, or Best Buy."
      sql: ${TABLE}.cib8621_02_cc_ind_gas ;;
    }

    dimension: cib8621_03_cc_ind_travel_ent {
      type: string
      label: "Credit Card Indicator - T&E"
      description: "Indicates possession of travel and entertainment credit card(s) in a household. Travel and entertainment cards are generally used to pay for hotel, airline, and other business related expenses. Diners Club and American Express are the most well known T&E cards. Many banks have specific T&E cards in addition to their other cards (i.e., CapitalOne Venture, Citi AAdvantage World). A few of the airlines also offer T&E cards (i.e., Delta Airlines Skymiles, Southwest Rapid Rewards)."
      sql: ${TABLE}.cib8621_03_cc_ind_travel_ent ;;
    }

    dimension: cib8621_04_cc_ind_unknown {
      type: string
      label: "Credit Card Indicator - Unknown"
      description: "Indicates possession of credit card(s) of unknown type in a household."
      sql: ${TABLE}.cib8621_04_cc_ind_unknown ;;
    }

    dimension: cib8621_05_cc_ind_premium {
      type: string
      label: "Credit Card Indicator - Premium"
      description: "Indicates possession of premium credit card(s) in a household. Premium credit cards would be Gold or Platinum level."
      sql: ${TABLE}.cib8621_05_cc_ind_premium ;;
    }

    dimension: cib8621_06_cc_ind_upscale_dept {
      type: string
      label: "Credit Card Indicator - Upscale Department"
      description: "Indicates possession of upscale department store credit card(s) in a household. Upscale department store credit cards would be high-end stores like Nordstrom or Neiman Marcus."
      sql: ${TABLE}.cib8621_06_cc_ind_upscale_dept ;;
    }

    dimension: cib8201_income {
      type: string
      label: "Income"
      description: "Indicates the estimated household income in higher ranges and narrower ranges. This income is about 3-5% consumer self-reported via indicating their income on product registrations and website memberships, and about 95-98% modeled from the sources, based on a variety of demographic factors, including age, occupation, home ownership, and median income for the local area.  Acxiom blends all of the source income data (the self-reported and the modeled data from the sources) into the Acxiom household level income elements using several rules including recency, commonality, and hierarchy. This income element has different ranges/values than the other income elements. The match rate and distribution for this element will not match the other income elements, because the sources that feed 8201 are slightly different. The agreement between them will be about 85-90%. "
      sql: ${TABLE}.cib8201_income ;;
    }

    dimension: cib9356_net_worth_gold {
      type: string
      label: "Net Worth"
      description: "NetWorth Gold is a modeled propensity element, assigning households to the most likely range of net worth, as determined by assets minus liabilities. Updated in October of 2013, self-reported data is used as the dependent variable for this model, with the independent demographic and area-level variables sourced from InfoBase."
      sql: ${TABLE}.cib9356_net_worth_gold ;;
    }

    dimension: cib2058_01_cc_use_amex_prem {
      type: string
      label: "Credit Card Use - American Express - Premium"
      description: "Indicates the household's use of a Gold/Premium American Express credit card."
      sql: ${TABLE}.cib2058_01_cc_use_amex_prem ;;
    }

    dimension: cib2058_02_cc_use_amex_reg {
      type: string
      label: "Credit Card Use - American Express - Regular"
      description: "Indicates the household's use of a regular American Express credit card."
      sql: ${TABLE}.cib2058_02_cc_use_amex_reg ;;
    }

    dimension: cib2059_01_cc_use_discover_prem {
      type: string
      label: "Credit Card Use - Discover - Premium"
      description: "Indicates the household's use of a Gold/Premium Discover credit card."
      sql: ${TABLE}.cib2059_01_cc_use_discover_prem ;;
    }

    dimension: cib2059_02_cc_use_discover_reg {
      type: string
      label: "Credit Card Use - Discover - Regular"
      description: "Indicates the household's use of a regular Discover credit card."
      sql: ${TABLE}.cib2059_02_cc_use_discover_reg ;;
    }

    dimension: cib2060_01_cc_use_gas_retail_premium {
      type: string
      label: "Credit Card Use - Gasoline or Retail Card - Premium"
      description: "Indicates the household's use of a Gold/Premium gasoline or retail credit card."
      sql: ${TABLE}.cib2060_01_cc_use_gas_retail_premium ;;
    }

    dimension: cib2060_02_cc_use_gas_retail_reg {
      type: string
      label: "Credit Card Use - Gasoline or Retail Card - Regular"
      description: "Indicates the household's use of a regular gasoline or retail credit card."
      sql: ${TABLE}.cib2060_02_cc_use_gas_retail_reg ;;
    }

    dimension: cib2061_01_cc_use_mastercard_premium {
      type: string
      label: "Credit Card Use - Mastercard - Premium"
      description: "Indicates the household's use of a Gold/Premium MasterCard credit card."
      sql: ${TABLE}.cib2061_01_cc_use_mastercard_premium ;;
    }

    dimension: cib2061_02_cc_use_mastercard_reg {
      type: string
      label: "Credit Card Use - Mastercard - Regular"
      description: "Indicates the household's use of a regular MasterCard credit card."
      sql: ${TABLE}.cib2061_02_cc_use_mastercard_reg ;;
    }

    dimension: cib2062_01_cc_use_visa_prem {
      type: string
      label: "Credit Card Use - Visa - Premium"
      description: "Indicates the household's use of a Gold/Premium VISA credit card."
      sql: ${TABLE}.cib2062_01_cc_use_visa_prem ;;
    }

    dimension: cib2062_02_cc_use_visa_reg {
      type: string
      label: "Credit Card Use - Visa - Regular"
      description: "Indicates the household's use of a regular VISA credit card."
      sql: ${TABLE}.cib2062_02_cc_use_visa_reg ;;
    }

    dimension: cib8339_investor_propensity {
      type: string
      label: "Investor Propensity"
      description: "Likely Investors, like Highly Likely Investors, uses element 2800 Stocks Bonds - PLUS (which its value 1 is 7795 Stocks Bonds). If Highly Likely Investors is blank and if 2800 Stocks Bonds - PLUS value 1 is populated and the probability score that creates the 2800 model (values 2-9) equals a particular cut-off point, then 8339 Likely Investors is populated."
      sql: ${TABLE}.cib8339_investor_propensity ;;
    }

    dimension: cib8836_range_of_new_credit {
      type: string
      label: "Range of New Credit"
      description: "Indicates the range of new credit granted for an individual within the household."
      sql: ${TABLE}.cib8836_range_of_new_credit ;;
    }

    dimension: cib9040_vehicle_make_owned_1st {
      type: string
      label: "Vehicle Make Owned - 1st"
      description: "Indicates the code of the make of the 1st vehicle in the household. Vehicles are householded using Last Name and Address Link. Vehicle purchase date is not available in the source data provided, therefore the most recent vehicle data received is the 1st vehicle and the next recent is the 2nd vehicle."
      sql: ${TABLE}.cib9040_vehicle_make_owned_1st ;;
      html: {{rendered_value | slice: 5,300 }} ;;
    }

    dimension: cib9050_vehicle_make_owned_2nd {
      type: string
      label: "Vehicle Make Owned - 2nd"
      description: "Indicates the code of the make of the 2nd vehicle in the household. Vehicles are householded using Last Name and Address Link. Vehicle purchase date is not available in the source data provided, therefore the most recent vehicle data received is the 1st vehicle and the next recent is the 2nd vehicle."
      sql: ${TABLE}.cib9050_vehicle_make_owned_2nd ;;
      html: {{rendered_value | slice: 5,300 }} ;;
    }

    dimension: cib8647_num_vehicles {
      type: string
      label: "Number of Vehicles"
      description: "Indicates the total number of vehicles owned in the household."
      sql: ${TABLE}.cib8647_num_vehicles ;;
    }

    dimension: cib8646_vehicle_new_buyer {
      type: string
      label: "New Car Buyer"
      description: "Indicates a history of new car buying in the household. This data cannot personally identify an individuals vehicle."
      sql: ${TABLE}.cib8646_vehicle_new_buyer ;;
    }

    dimension: cib9180_vehicle_type_owned_1st {
      type: string
      label: "Vehicle Type Owned - 1st"
      description: "This element indicates the type of vehicle that exists in Vehicle 1 (elements 9040-9044). It can be used to determine the household's vehicle 'lifestyle'."
      sql: ${TABLE}.cib9180_vehicle_type_owned_1st ;;
    }

    dimension: cib9181_vehicle_type_owned_2nd {
      type: string
      label: "Vehicle Type Owned - 2nd"
      description: "This element indicates the type of vehicle that exists in Vehicle 2 (elements 9050-9054). It can be used to determine the household's vehicle 'lifestyle'."
      sql: ${TABLE}.cib9181_vehicle_type_owned_2nd ;;
    }

    dimension: cib8165_02_vehicle_motorycle_owner {
      type: string
      label: "Motorcycle Owner"
      description: "Someone in the household has indicated that they own a motorcycle."
      sql: ${TABLE}.cib8165_02_vehicle_motorycle_owner ;;
    }

    dimension: cib8165_01_vehicle_truck_owner {
      type: string
      label: "Truck Owner"
      description: "Someone in the household has indicated that they own a truck. This does not include SUVs"
      sql: ${TABLE}.cib8165_01_vehicle_truck_owner ;;
    }

    dimension: cib8165_03_vehicle_recreational_owner {
      type: string
      label: "Recreational Vehicle Owner"
      description: "Someone in the household has indicated that they own a recreational vehicle (RV)."
      sql: ${TABLE}.cib8165_03_vehicle_recreational_owner ;;
    }

    dimension: nib9042_vehicle_model_year_1st {
      type: number
      value_format: "0"
      label: "Vehicle Model Year - 1st"
      description: "Indicates the make year of the 1st vehicle in the household. Ranges from 1986 through the current year and potentially the next year. Vehicles are householded using Last Name and Address Link."
      sql: ${TABLE}.nib9042_vehicle_model_year_1st ;;
      html: <p style=“text-align:left”>{{ rendered_value }}</p>;;

    }

    dimension: nib9052_vehicle_model_year_2nd {
      type: number
      value_format: "0"
      label: "Vehicle Model Year - 2nd"
      description: "Indicates the make year of the 2nd vehicle in the household. Ranges from 1986 through the current year and potentially the next year. Vehicles are householded using Last Name and Address Link."
      sql: ${TABLE}.nib9052_vehicle_model_year_2nd ;;
      html: <p style=“text-align:left”>{{ rendered_value }}</p>;;
    }

    dimension: nIB7752_exercise_aerobic {
      type: string
      label: "Exercise - Aerobic"
      description: "Someone in the household has an interest in aerobic exercise."
      sql: ${TABLE}.nIB7752_exercise_aerobic ;;
    }

    dimension: nIB7723_celebrities {
      type: string
      label: "Celebrities"
      description: "Someone in the household has an interest in Celebrities and their lives."
      sql: ${TABLE}.nIB7723_celebrities ;;
    }

    dimension: nIB7725_theater_performing_arts {
      type: string
      label: "Theater/Performing Arts"
      description: "Someone in the household has an interest in the theater / performing arts."
      sql: ${TABLE}.nIB7725_theater_performing_arts ;;
    }

    dimension: nIB7734_reading_best_sellers {
      type: string
      label: "Reading - Best Sellers"
      description: "Someone in the household has an interest in reading best sellers."
      sql: ${TABLE}.nIB7734_reading_best_sellers ;;
    }

    dimension: nIB7848_reading_financial_newsletter_subscribers {
      type: string
      label: "Reading - Financial Newsletter Subscribers"
      description: "Household indicated they subscribe to a financial newsletter. Our sources contribute both online and offline newsletter subscribers."
      sql: ${TABLE}.nIB7848_reading_financial_newsletter_subscribers ;;
    }

    dimension: nIB7735_reading_religious_inspirational {
      type: string
      label: "Reading - Religious/Inspirational"
      description: "Someone in the household has an interest in reading religious / inspirational items."
      sql: ${TABLE}.nIB7735_reading_religious_inspirational ;;
    }

    dimension: nIB7736_reading_science_fiction {
      type: string
      label: "Reading - Science Fiction"
      description: "Someone in the household has an interest in reading science fiction."
      sql: ${TABLE}.nIB7736_reading_science_fiction ;;
    }

    dimension: nIB7780_grandchildren {
      type: string
      label: "Grandchildren"
      description: "Someone in the household has an interest in grandchildren."
      sql: ${TABLE}.nIB7780_grandchildren ;;
    }

    dimension: nIB7843_collectibles_sports_memorabilia {
      type: string
      label: "Collectibles - Sports Memorabilia"
      description: "Sports Memorabilia Collectors - file represents consumers who have chosen to receive specific information on their sports memorabilia collecting interests."
      sql: ${TABLE}.nIB7843_collectibles_sports_memorabilia ;;
    }

    dimension: nIB7739_cooking_general {
      type: string
      label: "Cooking - General"
      description: "Someone in the household has a general interest in cooking."
      sql: ${TABLE}.nIB7739_cooking_general ;;
    }

    dimension: nIB7740_cooking_gourmet {
      type: string
      label: "Cooking - Gourmet"
      description: "Someone in the household has an interest in gourmet cooking."
      sql: ${TABLE}.nIB7740_cooking_gourmet ;;
    }

    dimension: nIB7741_cooking_low_fat {
      type: string
      label: "Cooking - Low Fat"
      description: "Someone in the household has an interest in low fat cooking."
      sql: ${TABLE}.nIB7741_cooking_low_fat ;;
    }

    dimension: nIB7743_foods_natural {
      type: string
      label: "Foods - Natural"
      description: "Someone in the household has an interest in natural or organic foods."
      sql: ${TABLE}.nIB7743_foods_natural ;;
    }

    dimension: nIB7742_foods_vegetarian {
      type: string
      label: "Foods - Vegetarian"
      description: "Someone in the household has an interest in vegetarian food."
      sql: ${TABLE}.nIB7742_foods_vegetarian ;;
    }

    dimension: nIB7841_career {
      type: string
      label: "Career"
      description: "These are Career Minded people who focus on career and look for opportunities to move higher in their company with a goal to have executive status."
      sql: ${TABLE}.nIB7841_career ;;
    }

    dimension: nIB7730_career_improvement {
      type: string
      label: "Career Improvement"
      description: "Someone in the household has an interest in Career Improvement."
      sql: ${TABLE}.nIB7730_career_improvement ;;
    }

    dimension: nIB7724_current_affairspolitics {
      type: string
      label: "Current Affairs/Politics"
      description: "Someone in the household has an interest in current affairs / politics."
      sql: ${TABLE}.nIB7724_current_affairspolitics ;;
    }

    dimension: nIB7844_education_online {
      type: string
      label: "Education Online"
      description: "Someone in the household has an interest in online education/distance learning."
      sql: ${TABLE}.nIB7844_education_online ;;
    }

    dimension: nIB7809_environmental_issues {
      type: string
      label: "Environmental Issues"
      description: "Someone in the household has an interest in environmental or wildlife issues. The household either contributes to Environmental causes or has expressed interest in them through magazine subscriptions and/or mail response."
      sql: ${TABLE}.nIB7809_environmental_issues ;;
    }

    dimension: nIB7721_history_military {
      type: string
      label: "History/Military"
      description: "Someone in the household has an interest in history / military."
      sql: ${TABLE}.nIB7721_history_military ;;
    }

    dimension: nIB7728_science_space {
      type: string
      label: "Science/Space"
      description: "Someone in the household has an interest in science / space."
      sql: ${TABLE}.nIB7728_science_space ;;
    }

    dimension: nIB8082_soho_indicator {
      type: string
      label: "SOHO Indicator"
      description: "Indicates there is a small office located in the household."
      sql: ${TABLE}.nIB8082_soho_indicator ;;
    }

    dimension: nIB7729_strange_and_unusual {
      type: string
      label: "Strange and Unusual"
      description: "Someone in the household has an interest in the strange and unusual. This element refers to interest in the odd, abnormal, weird, supernatural, paranormal, etc."
      sql: ${TABLE}.nIB7729_strange_and_unusual ;;
    }

    dimension: nIB7821_sweepstakes_contests {
      type: string
      label: "Sweepstakes/Contests"
      description: "Someone in the household has an interest in entering sweepstakes / contests."
      sql: ${TABLE}.nIB7821_sweepstakes_contests ;;
    }

    dimension: nIB7726_communitycharities {
      type: string
      label: "Community/Charities"
      description: "Someone in the household has an interest in their community and/or charitable organizations."
      sql: ${TABLE}.nIB7726_communitycharities ;;
    }

    dimension: nIB7771_dieting_weight_loss {
      type: string
      label: "Dieting/Weight Loss"
      description: "Someone in the household has an interest in dieting / weight loss."
      sql: ${TABLE}.nIB7771_dieting_weight_loss ;;
    }

    dimension: nIB7770_health_medical {
      type: string
      label: "Health/Medical"
      description: "Someone in the household has an interest in health or the medical field."
      sql: ${TABLE}.nIB7770_health_medical ;;
    }

    dimension: nIB7851_home_improvement_diy {
      type: string
      label: "Home Improvement - Do-It-Yourselfers"
      description: "These people show a high interest in doing-it-themselves for home improvements. Rather than hire someone to do the job, they will do it."
      sql: ${TABLE}.nIB7851_home_improvement_diy ;;
    }

    dimension: nIB7757_sewing_knitting_needlework {
      type: string
      label: "Sewing/Knitting/Needlework"
      description: "Someone in the household has an interest in sewing / knitting / needlework."
      sql: ${TABLE}.nIB7757_sewing_knitting_needlework ;;
    }

    dimension: nIB7764_movie_collector {
      type: string
      label: "Movie Collector"
      description: "Someone in the household has indicated they are interested in collecting movies."
      sql: ${TABLE}.nIB7764_movie_collector ;;
    }

    dimension: nIB7762_music_collector {
      type: string
      label: "Music Collector"
      description: "Someone in the household has indicated they have an interest in collecting music."
      sql: ${TABLE}.nIB7762_music_collector ;;
    }

    dimension: nIB7761_music_player {
      type: string
      label: "Music Player"
      description: "Someone in the household has indicated they have an interest in music players. (i.e. iPod, MP3, etc.)"
      sql: ${TABLE}.nIB7761_music_player ;;
    }

    dimension: nIB7750_exercise_running_jogging {
      type: string
      label: "Exercise - Running/Jogging"
      description: "Someone in the household has an interest in running/jogging for exercise."
      sql: ${TABLE}.nIB7750_exercise_running_jogging ;;
    }

    dimension: nIB7751_exercise_walking {
      type: string
      label: "Exercise - Walking"
      description: "Someone in the household has an interest in walking for exercise."
      sql: ${TABLE}.nIB7751_exercise_walking ;;
    }

    dimension: nIB7759_games_board_puzzles {
      type: string
      label: "Games - Board Games/Puzzles"
      description: "Someone in the household has an interest in board games / puzzles."
      sql: ${TABLE}.nIB7759_games_board_puzzles ;;
    }

    dimension: nIB7773_cat_owner {
      type: string
      label: "Cat Owner"
      description: "Someone in the household has an interest in owning a cat or actually owns a cat."
      sql: ${TABLE}.nIB7773_cat_owner ;;
    }

    dimension: nIB7774_dog_owner {
      type: string
      label: "Dog Owner"
      description: "Someone in the household has an interest in owning a dog or actually owns a dog."
      sql: ${TABLE}.nIB7774_dog_owner ;;
    }

    dimension: nIB7758_woodworking {
      type: string
      label: "Woodworking"
      description: "Someone in the household has an interest in woodworking."
      sql: ${TABLE}.nIB7758_woodworking ;;
    }

    dimension: nIB7781_spectator_sports_racing {
      type: string
      label: "Spectator Sports - Auto/Motorcycle Racing"
      description: "Someone in the household has an interest in watching auto / motorcycle racing."
      sql: ${TABLE}.nIB7781_spectator_sports_racing ;;
    }

    dimension: nIB7783_spectator_sports_baseball {
      type: string
      label: "Spectator Sports - Baseball"
      description: "Someone in the household has an interest in watching baseball."
      sql: ${TABLE}.nIB7783_spectator_sports_baseball ;;
    }

    dimension: nIB7784_spectator_sports_basketball {
      type: string
      label: "Spectator Sports - Basketball"
      description: "Someone in the household has an interest in watching basketball."
      sql: ${TABLE}.nIB7784_spectator_sports_basketball ;;
    }

    dimension: nIB7782_spectator_sports_football {
      type: string
      label: "Spectator Sports - Football"
      description: "Someone in the household has an interest in watching football."
      sql: ${TABLE}.nIB7782_spectator_sports_football ;;
    }

    dimension: nIB7785_spectator_sports_hockey {
      type: string
      label: "Spectator Sports - Hockey"
      description: "Someone in the household has an interest in watching hockey."
      sql: ${TABLE}.nIB7785_spectator_sports_hockey ;;
    }

    dimension: nIB7786_spectator_sports_soccer {
      type: string
      label: "Spectator Sports - Soccer"
      description: "Someone in the household has an interest in watching soccer."
      sql: ${TABLE}.nIB7786_spectator_sports_soccer ;;
    }

    dimension: nIB7787_spectator_sports_tennis {
      type: string
      label: "Spectator Sports - Tennis"
      description: "Someone in the household has an interest in watching tennis."
      sql: ${TABLE}.nIB7787_spectator_sports_tennis ;;
    }

    dimension: nIB8257_spectator_sports_tv_sports {
      type: string
      label: "Spectator Sports - TV Sports"
      description: "Three of the following interests must be populated for this element to be populated. Internal 'sports' source data, along with a number of spectator sports interest elements must be populated for this element to be populated."
      sql: ${TABLE}.nIB8257_spectator_sports_tv_sports ;;
    }

    dimension: nIB7802_fishing {
      type: string
      label: "Fishing"
      description: "Someone in the household has an interest in fishing."
      sql: ${TABLE}.nIB7802_fishing ;;
    }

    dimension: nIB7811_golf {
      type: string
      label: "Golf"
      description: "Someone in the household has an interest in playing golf."
      sql: ${TABLE}.nIB7811_golf ;;
    }

    dimension: nIB7804_hunting_shooting {
      type: string
      label: "Hunting/Shooting"
      description: "Someone in the household has an interest in hunting / shooting."
      sql: ${TABLE}.nIB7804_hunting_shooting ;;
    }

    dimension: nIB7808_biking {
      type: string
      label: "Biking/Mountain Biking"
      description: "Someone in the household has an interest in biking / mountain biking."
      sql: ${TABLE}.nIB7808_biking ;;
    }

    dimension: nIB7812_snow_skiing {
      type: string
      label: "Snow Skiing"
      description: "Someone in the household has an interest in snow skiing."
      sql: ${TABLE}.nIB7812_snow_skiing ;;
    }

    dimension: nIB7810_tennis {
      type: string
      label: "Tennis"
      description: "Someone in the household has an interest in playing tennis."
      sql: ${TABLE}.nIB7810_tennis ;;
    }

    dimension: nIB7746_recreational_vehicle {
      type: string
      label: "Recreational Vehicle"
      description: "Someone in the household has an interest in recreational vehicles."
      sql: ${TABLE}.nIB7746_recreational_vehicle ;;
    }

    dimension: nIB7747_travel_family_vacations {
      type: string
      label: "Travel - Family Vacations"
      description: "Someone in the household has an interest in taking family vacations."
      sql: ${TABLE}.nIB7747_travel_family_vacations ;;
    }

    dimension: nIB2510_reading_while_traveling {
      type: string
      label: "Travel - Read Books or Magazines on Travel"
      description: "Indicates if someone in the household Reads Books or Magazines during Travel."
      sql: ${TABLE}.nIB2510_reading_while_traveling ;;
    }

    dimension: nIB8630_pc_owner {
      type: string
      label: "PC Owner"
      description: "Indicates if anyone in the household owns a personal computer."
      sql: ${TABLE}.nIB8630_pc_owner ;;
    }

    dimension: nIB8653_online_purchasing_indicator {
      type: string
      label: "Online Purchasing Indicator"
      description: "Indicates if anyone in a household has made a product purchase online. This element is from sources that indicate the household makes purchases online. Some of the source data is simply a flag indicating the household makes purchases online. Some of it is from a source that provides summarized online buying activity data."
      sql: ${TABLE}.nIB8653_online_purchasing_indicator ;;
    }

    dimension: nIB7732_arts {
      type: string
      label: "Arts"
      description: "Someone in the household has an interest in fine arts, such as painting, sculpting, filming, architecture, literature, or textiles."
      sql: ${TABLE}.nIB7732_arts ;;
    }

    dimension: nIB7738_reading_audio_books {
      type: string
      label: "Reading - Audio Books"
      description: "Someone in the household has an interest in listening to audio books."
      sql: ${TABLE}.nIB7738_reading_audio_books ;;
    }

    dimension: nIB7733_reading_general {
      type: string
      label: "Reading - General"
      description: "Someone in the household has a general interest in reading."
      sql: ${TABLE}.nIB7733_reading_general ;;
    }

    dimension: nIB7737_reading_magazines {
      type: string
      label: "Reading - Magazines"
      description: "Someone in the household has an interest in reading magazines."
      sql: ${TABLE}.nIB7737_reading_magazines ;;
    }

    dimension: nIB7779_childrens_interests {
      type: string
      label: "Children's Interests"
      description: "Denotes someone in household has purchased children's items (clothes, books, toys, etc.) showing they have an interest in children."
      sql: ${TABLE}.nIB7779_childrens_interests ;;
    }

    dimension: nIB7777_parenting {
      type: string
      label: "Parenting"
      description: "Someone in the household has an interest in parenting."
      sql: ${TABLE}.nIB7777_parenting ;;
    }

    dimension: nIB8263_collector_avid {
      type: string
      label: "Collector - Avid"
      description: "These people show a high interest in the world of collectibles. Their collections are more than just hobbies. Internal source data and 3 out of several collectible buying activity elements and interest elements must be populated for this element to be populated."
      sql: ${TABLE}.nIB8263_collector_avid ;;
    }

    dimension: nIB7792_collectibles_antiques {
      type: string
      label: "Collectibles - Antiques"
      description: "Someone in the household has an interest in collecting Antiques."
      sql: ${TABLE}.nIB7792_collectibles_antiques ;;
    }

    dimension: nIB7791_collectibles_arts {
      type: string
      label: "Collectibles - Arts"
      description: "Someone in the household has an interest in collecting Arts."
      sql: ${TABLE}.nIB7791_collectibles_arts ;;
    }

    dimension: nIB7790_collectibles_coins {
      type: string
      label: "Collectibles - Coins"
      description: "Someone in the household has an interest in collecting Coins."
      sql: ${TABLE}.nIB7790_collectibles_coins ;;
    }

    dimension: nIB7788_collectibles_general {
      type: string
      label: "Collectibles - General"
      description: "Someone in the household has a general interest in collecting."
      sql: ${TABLE}.nIB7788_collectibles_general ;;
    }

    dimension: nIB7789_collectibles_stamps {
      type: string
      label: "Collectibles - Stamps"
      description: "Someone in the household has an interest in collecting Stamps."
      sql: ${TABLE}.nIB7789_collectibles_stamps ;;
    }

    dimension: nIB7796_computers {
      type: string
      label: "Computers"
      description: "Someone in the household has an interest in computers."
      sql: ${TABLE}.nIB7796_computers ;;
    }

    dimension: nIB7801_consumer_electronics {
      type: string
      label: "Consumer Electronics"
      description: "Someone in the household has an interest in consumer electronics."
      sql: ${TABLE}.nIB7801_consumer_electronics ;;
    }

    dimension: nIB7719_wireless_product_buyer {
      type: string
      label: "Wireless Product Buyer"
      description: "Indicates if anyone in the household purchases wireless products."
      sql: ${TABLE}.nIB7719_wireless_product_buyer ;;
    }

    dimension: nIB8236_money_seekers {
      type: string
      label: "Money Seekers"
      description: "Internal 'money seeker' source data, along with some investment elements must be populated for this element to be populated."
      sql: ${TABLE}.nIB8236_money_seekers ;;
    }

    dimension: nIB7727_religious_inspirational {
      type: string
      label: "Religious/Inspirational"
      description: "Someone in the household has an interest in religion / inspirational."
      sql: ${TABLE}.nIB7727_religious_inspirational ;;
    }

    dimension: nIB7849_beauty_cosmetics {
      type: string
      label: "Beauty/Cosmetics"
      description: "Someone in the household has an interest in Beauty and Cosmetics. Some of the households have purchased at least $50 in beauty and cosmetic items."
      sql: ${TABLE}.nIB7849_beauty_cosmetics ;;
    }

    dimension: nIB7720_fashion {
      type: string
      label: "Fashion"
      description: "Someone in the household has an interest in fashion. They are interested in the latest styles and trends of the fashion world."
      sql: ${TABLE}.nIB7720_fashion ;;
    }

    dimension: nIB2205_health_homeopathic {
      type: string
      label: "Health - Homeopathic Interest in Household"
      description: "This household has a homeopathic interest because they have purchased homeopathic products or indicated someone in the household has homeopathic interests. The element does not fall under HIPAA regulations. The data is based on self-reported data and over-the-counter purchases, NOT from drug prescriptions or medical records. The data can be used for marketing and segmentation purposes."
      sql: ${TABLE}.nIB2205_health_homeopathic ;;
    }

    dimension: nIB2206_health_organic {
      type: string
      label: "Health - Organic Focus in Household"
      description: "This household has an Organic interest because they have purchased organic products or indicated someone in the household has an organic interest. The element does not fall under HIPAA regulations. The data is based on self-reported data and over-the-counter purchases, NOT from drug prescriptions or medical records. The data can be used for marketing and segmentation purposes."
      sql: ${TABLE}.nIB2206_health_organic ;;
    }

    dimension: nIB7772_self_improvement {
      type: string
      label: "Self Improvement"
      description: "Someone in the household has an interest in self improvement."
      sql: ${TABLE}.nIB7772_self_improvement ;;
    }

    dimension: nIB2208_health_senior_needs {
      type: string
      label: "Health - Senior Needs Interest in Household"
      description: "This household has a senior needs interest because they have purchased senior needs products or indicated someone in the household has an interest in senior needs. The element does not fall under HIPAA regulations. The data is based on self-reported data and over-the-counter purchases, NOT from drug prescriptions or medical records. The data can be used for marketing and segmentation purposes."
      sql: ${TABLE}.nIB2208_health_senior_needs ;;
    }

    dimension: nIB7753_crafts {
      type: string
      label: "Crafts"
      description: "Someone in the household has an interest in crafts."
      sql: ${TABLE}.nIB7753_crafts ;;
    }

    dimension: nIB7817_gardening {
      type: string
      label: "Gardening"
      description: "Someone in the household has purchased garden/landscape products (trees, shrubs, flowers, gardening equipment, books, etc.). Indicates an interest in gardening."
      sql: ${TABLE}.nIB7817_gardening ;;
    }

    dimension: nIB7815_home_furnishings_decorating {
      type: string
      label: "Home Furnishings/Decorating"
      description: "Someone in the household has an interest in home furnishings / decorating."
      sql: ${TABLE}.nIB7815_home_furnishings_decorating ;;
    }

    dimension: nIB7816_home_improvement {
      type: string
      label: "Home Improvement"
      description: "Someone in the household has an interest in home improvement. "
      sql: ${TABLE}.nIB7816_home_improvement ;;
    }

    dimension: nIB8326_broader_living {
      type: string
      label: "Broader Living"
      description: "Internal 'broader living' source data, and 3 out of a variety of interest elements must be populated for this element to be populated. (Elements such as International travel, current affairs, theater, community activities, inspirational activities, science fiction, etc.)"
      sql: ${TABLE}.nIB8326_broader_living ;;
    }

    dimension: nIB8321_common_living {
      type: string
      label: "Common Living"
      description: "Internal 'simple living' source data, and 3 out of traditional interest elements must be populated for this element to be populated. (Elements such as coin collecting, inspirational activities, natural foods, enters sweepstakes or contests, etc.)"
      sql: ${TABLE}.nIB8321_common_living ;;
    }

    dimension: nIB8277_culturalartistic_living {
      type: string
      label: "Cultural/Artistic Living"
      description: "Internal 'Cultural' source data, and 3 out of several cultural and artistic interest elements must be populated for this element to be populated. (Elements such as arts, antiques, etc.)"
      sql: ${TABLE}.nIB8277_culturalartistic_living ;;
    }

    dimension: nIB8272_diy_living {
      type: string
      label: "DIY Living"
      description: "These people show a high interest in doing-it-themselves. Rather than hire someone to do the job, they will do it; rather than take their vehicle to be fixed, they will do it; rather than buy a piece of furniture themselves, they will build it. Internal 'do-it-yourself' source data and 3 out of several DIY interest elements must be populated for this element to be populated. (Elements such as auto repair, home improvement, woodworking, etc.)"
      sql: ${TABLE}.nIB8272_diy_living ;;
    }

    dimension: nIB2776_green_living {
      type: string
      label: "Green Living"
      description: "Green Living represents households that are living environmentally friendly. They use environmentally healthy products and services such as, eco-friendly soaps, detergents, and household cleaning products. These households eat organic foods, and potentially grow the food themselves. They may also be socially active by donating funds to environmental causes. Some of them drive vehicles that are considered 'green' or hybrids."
      sql: ${TABLE}.nIB2776_green_living ;;
    }

    dimension: nIB8278_highbrow_living {
      type: string
      label: "Highbrow Living"
      description: "Internal 'investment' source data, along with a number of investment, charity and self-improvement interest elements must be populated for this element to be populated."
      sql: ${TABLE}.nIB8278_highbrow_living ;;
    }

    dimension: nIB8279_hightech_living {
      type: string
      label: "High-Tech Living"
      description: "Internal 'high tech' source data, and 3 out of several technology interest elements must be populated for this element to be populated. (Elements such as computers, pc games, online user, etc.)"
      sql: ${TABLE}.nIB8279_hightech_living ;;
    }

    dimension: nIB8271_home_living {
      type: string
      label: "Home Living"
      description: "These people show a high interest in their homes. They like to lounge at home or take care of items around their house. Internal 'home living' source data and 3 out of several 'items that are done at home' interest elements must be populated for this element to be populated. (Items like crafts, cooking, gardening, home improvement, etc.)"
      sql: ${TABLE}.nIB8271_home_living ;;
    }

    dimension: nIB8322_professional_living {
      type: string
      label: "Professional Living"
      description: "Internal 'professional living' source data, and 3 out of professional improvement interest elements must be populated for this element to be populated. (Elements such as career improvement, self improvement, online education, investing, etc.)"
      sql: ${TABLE}.nIB8322_professional_living ;;
    }

    dimension: nIB8274_sporty_living {
      type: string
      label: "Sporty Living"
      description: "Internal 'participant sports' source data and 3 out of several participant sports interest elements must be populated for this element to be populated. (Elements such as plays tennis, golf, running/jogging, etc.)"
      sql: ${TABLE}.nIB8274_sporty_living ;;
    }

    dimension: nIB8276_upscale_living {
      type: string
      label: "Upscale Living"
      description: "Internal 'Upscale' source data, and 3 out of several upscale interest elements must be populated for this element to be populated. (Elements such as arts, foreign travel, theater, wine, etc.)"
      sql: ${TABLE}.nIB8276_upscale_living ;;
    }

    dimension: nIB7799_games_computer_games {
      type: string
      label: "Games - Computer Games"
      description: "Someone in the household has an interest in computer games."
      sql: ${TABLE}.nIB7799_games_computer_games ;;
    }

    dimension: nIB7766_games_video_games {
      type: string
      label: "Games - Video Games"
      description: "Someone in the household has an interest in video games."
      sql: ${TABLE}.nIB7766_games_video_games ;;
    }

    dimension: nIB7768_movies_at_home {
      type: string
      label: "Movies at Home"
      description: "Someone in the household has indicated they are interested in watching movies at home. These households have a DVD player or a VCR and they also enjoy home video recording."
      sql: ${TABLE}.nIB7768_movies_at_home ;;
    }

    dimension: nIB7763_music_avid_listener {
      type: string
      label: "Music - Avid Listener"
      description: "Someone in the household has indicated they have an interest in music and they are an avid music listener."
      sql: ${TABLE}.nIB7763_music_avid_listener ;;
    }

    dimension: nIB7760_music_home_stereo {
      type: string
      label: "Music - Home Stereo"
      description: "Someone in the household has indicated they have an interest in home stereos."
      sql: ${TABLE}.nIB7760_music_home_stereo ;;
    }

    dimension: nIB7755_aviation {
      type: string
      label: "Aviation"
      description: "Someone in the household has an interest in Aviation."
      sql: ${TABLE}.nIB7755_aviation ;;
    }

    dimension: nIB7805_boatingsailing {
      type: string
      label: "Boating/Sailing"
      description: "Someone in the household has an interest in boating / sailing."
      sql: ${TABLE}.nIB7805_boatingsailing ;;
    }

    dimension: nIB7803_campinghiking {
      type: string
      label: "Camping/Hiking"
      description: "Someone in the household has an interest in camping / hiking."
      sql: ${TABLE}.nIB7803_campinghiking ;;
    }

    dimension: nIB7847_nascar {
      type: string
      label: "NASCAR"
      description: "Someone in the household indicated they are interested in NASCAR (racing or novelty items). This indication could mean they have been to a race, they watch it on television, they are a general fan, or they buy collectibles."
      sql: ${TABLE}.nIB7847_nascar ;;
    }

    dimension: nIB7775_other_pet_owner {
      type: string
      label: "Other Pet Owner"
      description: "Someone in the household has an interest in owning a pet other than a dog or cat, or they actually own an other pet. (i.e. hamster, rabbit, bird, fish, etc.)"
      sql: ${TABLE}.nIB7775_other_pet_owner ;;
    }

    dimension: nIB7754_photography {
      type: string
      label: "Photography"
      description: "Someone in the household has an interest in photography."
      sql: ${TABLE}.nIB7754_photography ;;
    }

    dimension: nIB7814_equestrian {
      type: string
      label: "Equestrian"
      description: "Someone in the household has an interest in riding horses."
      sql: ${TABLE}.nIB7814_equestrian ;;
    }

    dimension: nIB7807_scuba_diving {
      type: string
      label: "Scuba Diving"
      description: "Someone in the household has an interest in scuba diving."
      sql: ${TABLE}.nIB7807_scuba_diving ;;
    }

    dimension: nIB7744_travel_domestic {
      type: string
      label: "Travel - Domestic"
      description: "Someone in the household has an interest in domestic traveling."
      sql: ${TABLE}.nIB7744_travel_domestic ;;
    }

    dimension: nIB7748_travel_cruise_vacations {
      type: string
      label: "Travel - Cruise Vacations"
      description: "Someone in the household has an interest in taking cruise vacations."
      sql: ${TABLE}.nIB7748_travel_cruise_vacations ;;
    }

    dimension: nIB2527_vacation_travel_leisure {
      type: string
      label: "Vacation Travel - Leisure"
      description: "Indicates if someone in the household enjoys taking a Leisure Vacation. There is not any indication of when the scheduled trip occurred, just when the trip was purchased. There is not any indication of how the trip was booked (i.e. online or phone)."
      sql: ${TABLE}.nIB2527_vacation_travel_leisure ;;
    }

    dimension: nIB2529_vacation_travel_rv {
      type: string
      label: "Vacation Travel - RV"
      description: "Indicates if someone in the household has taken or would enjoy a Vacation in an RV. There is not any indication of when the scheduled trip occurred, just when the trip was purchased. There is not any indication of how the trip was booked (i.e. online or phone)."
      sql: ${TABLE}.nIB2529_vacation_travel_rv ;;
    }

    dimension: nIB7756_auto_work {
      type: string
      label: "Auto Work"
      description: "Someone in the household has an interest in working on vehicles and mechanics."
      sql: ${TABLE}.nIB7756_auto_work ;;
    }

    dimension: nIB7813_motorcycling {
      type: string
      label: "Motorcycling"
      description: "Someone in the household has an interest in riding motorcycles."
      sql: ${TABLE}.nIB7813_motorcycling ;;
    }


  }
