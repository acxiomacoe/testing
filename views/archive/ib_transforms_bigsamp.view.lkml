view: ib_transforms_bigsamp {
  sql_table_name: `orange-iguana.prod.ib_transforms_bigsamp`
    ;;



  parameter: measure_select {
    type: string
    default_value: "0"
    allowed_value: {
      label: "Consumer Link"
      value: "0"
    }
    allowed_value: {
      label: "Address Link"
      value: "1"
    }
    allowed_value: {
      label: "Household Link"
      value: "2"
    }
  }


  measure: count {
    type: count
    drill_fields: []
  }

  measure: target_distinct_count {
    type: count_distinct
    sql: ${key_target}  ;;
    drill_fields: []
  }

  measure: reference_distinct_count {
    type: count_distinct
    sql: ${key_reference}  ;;
    drill_fields: []
  }

  measure: target_count {
    type: sum
    sql: ${target_flg} ;;
  }

  measure: reference_count {
    type: sum
    sql: CASE WHEN ${target_flg} = 1 THEN 0 ELSE 1 END ;;
  }

  measure: percent_of_total_target {
    type: percent_of_total
    sql: ${target_count} ;;
  }

  measure: percent_of_total_reference {
    type: percent_of_total
    sql: ${reference_count} ;;
  }

  measure: index {
    type: number
    value_format: "0"
    sql: ${ib_transforms_bigsamp.percent_of_total_target} / ${ib_transforms_bigsamp.percent_of_total_reference} * 100 ;;
  }


  # Randomly generating a 1 or 0 here
  dimension: target_flg {
    type: number
    sql:  ${nib7805};;
    #sql: CASE WHEN (floor(rand()*100)+1) > 25 THEN 1 ELSE 0 END ;;
  }


  dimension: consumer_link_sha256 {
    type: string
    primary_key: yes
    sql: ${TABLE}.consumer_link_sha256 ;;
  }

  dimension: address_link_sha256 {
    type: string
    sql: ${TABLE}.address_link_sha256 ;;
  }

  dimension: household_link_sha256 {
    type: string
    sql: ${TABLE}.household_link_sha256 ;;
  }

  dimension: key_target {
    type: string
    hidden: yes
    sql: CASE WHEN ${target_flg} = 1 THEN
            CASE
              WHEN {{measure_select._parameter_value}} = "0" THEN ${consumer_link_sha256}
              WHEN {{measure_select._parameter_value}} = "1" THEN ${household_link_sha256}
              WHEN {{measure_select._parameter_value}} = "2" THEN ${address_link_sha256}
            ELSE NULL END
          ELSE NULL END ;;
  }

  dimension: key_reference {
    type: string
    hidden: yes
    sql: CASE WHEN ${target_flg} = 0 THEN
            CASE
              WHEN {{measure_select._parameter_value}} = "0" THEN ${consumer_link_sha256}
              WHEN {{measure_select._parameter_value}} = "1" THEN ${household_link_sha256}
              WHEN {{measure_select._parameter_value}} = "2" THEN ${address_link_sha256}
            ELSE NULL END
          ELSE NULL END ;;
  }

  dimension: area_lat {
    type: number
    sql: ${TABLE}.area_lat ;;
  }

  dimension: area_lon {
    type: number
    sql: ${TABLE}.area_lon ;;
  }

  dimension: cib127000 {
    type: string
    sql: ${TABLE}.cib127000 ;;
  }

  dimension: cib127100 {
    type: string
    sql: ${TABLE}.cib127100 ;;
  }

  dimension: cib1273 {
    type: string
    sql: ${TABLE}.cib1273 ;;
  }

  dimension: cib127400 {
    type: string
    sql: ${TABLE}.cib127400 ;;
  }

  dimension: cib2350 {
    type: string
    sql: ${TABLE}.cib2350 ;;
  }

  dimension: cib2360 {
    type: string
    sql: ${TABLE}.cib2360 ;;
  }

  dimension: cib2509 {
    type: string
    sql: ${TABLE}.cib2509 ;;
  }

  dimension: cib2807 {
    type: string
    sql: ${TABLE}.cib2807 ;;
  }

  dimension: cib2860 {
    type: string
    sql: ${TABLE}.cib2860 ;;
  }

  dimension: cib2861 {
    type: string
    sql: ${TABLE}.cib2861 ;;
  }

  dimension: cib2862 {
    type: string
    sql: ${TABLE}.cib2862 ;;
  }

  dimension: cib2863 {
    type: string
    sql: ${TABLE}.cib2863 ;;
  }

  dimension: cib2864 {
    type: string
    sql: ${TABLE}.cib2864 ;;
  }

  dimension: cib2865 {
    type: string
    sql: ${TABLE}.cib2865 ;;
  }

  dimension: cib2866 {
    type: string
    sql: ${TABLE}.cib2866 ;;
  }

  dimension: cib2867 {
    type: string
    sql: ${TABLE}.cib2867 ;;
  }

  dimension: cib2868 {
    type: string
    sql: ${TABLE}.cib2868 ;;
  }

  dimension: cib2869 {
    type: string
    sql: ${TABLE}.cib2869 ;;
  }

  dimension: cib2870 {
    type: string
    sql: ${TABLE}.cib2870 ;;
  }

  dimension: cib2871 {
    type: string
    sql: ${TABLE}.cib2871 ;;
  }

  dimension: cib2872 {
    type: string
    sql: ${TABLE}.cib2872 ;;
  }

  dimension: cib2873 {
    type: string
    sql: ${TABLE}.cib2873 ;;
  }

  dimension: cib2874 {
    type: string
    sql: ${TABLE}.cib2874 ;;
  }

  dimension: cib2875 {
    type: string
    sql: ${TABLE}.cib2875 ;;
  }

  dimension: cib2876 {
    type: string
    sql: ${TABLE}.cib2876 ;;
  }

  dimension: cib2877 {
    type: string
    sql: ${TABLE}.cib2877 ;;
  }

  dimension: cib2878 {
    type: string
    sql: ${TABLE}.cib2878 ;;
  }

  dimension: cib2879 {
    type: string
    sql: ${TABLE}.cib2879 ;;
  }

  dimension: cib2880 {
    type: string
    sql: ${TABLE}.cib2880 ;;
  }

  dimension: cib2881 {
    type: string
    sql: ${TABLE}.cib2881 ;;
  }

  dimension: cib2882 {
    type: string
    sql: ${TABLE}.cib2882 ;;
  }

  dimension: cib2883 {
    type: string
    sql: ${TABLE}.cib2883 ;;
  }

  dimension: cib2884 {
    type: string
    sql: ${TABLE}.cib2884 ;;
  }

  dimension: cib2885 {
    type: string
    sql: ${TABLE}.cib2885 ;;
  }

  dimension: cib2886 {
    type: string
    sql: ${TABLE}.cib2886 ;;
  }

  dimension: cib2887 {
    type: string
    sql: ${TABLE}.cib2887 ;;
  }

  dimension: cib2888 {
    type: string
    sql: ${TABLE}.cib2888 ;;
  }

  dimension: cib2889 {
    type: string
    sql: ${TABLE}.cib2889 ;;
  }

  dimension: cib2890 {
    type: string
    sql: ${TABLE}.cib2890 ;;
  }

  dimension: cib2891 {
    type: string
    sql: ${TABLE}.cib2891 ;;
  }

  dimension: cib2892 {
    type: string
    sql: ${TABLE}.cib2892 ;;
  }

  dimension: cib3101 {
    type: string
    sql: ${TABLE}.cib3101 ;;
  }

  dimension: cib3102 {
    type: string
    sql: ${TABLE}.cib3102 ;;
  }

  dimension: cib3103 {
    type: string
    sql: ${TABLE}.cib3103 ;;
  }

  dimension: cib748002 {
    type: string
    sql: ${TABLE}.cib748002 ;;
  }

  dimension: cib760200 {
    type: string
    sql: ${TABLE}.cib760200 ;;
  }

  dimension: cib7602a {
    type: string
    sql: ${TABLE}.cib7602a ;;
  }

  dimension: cib760600 {
    type: string
    sql: ${TABLE}.cib760600 ;;
  }

  dimension: cib760900 {
    type: string
    sql: ${TABLE}.cib760900 ;;
  }

  dimension: cib762800 {
    type: string
    sql: ${TABLE}.cib762800 ;;
  }

  dimension: cib7628a {
    type: string
    sql: ${TABLE}.cib7628a ;;
  }

  dimension: cib762900 {
    type: string
    sql: ${TABLE}.cib762900 ;;
  }

  dimension: cib7629a {
    type: string
    sql: ${TABLE}.cib7629a ;;
  }

  dimension: cib765000 {
    type: string
    sql: ${TABLE}.cib765000 ;;
  }

  dimension: cib8436 {
    type: string
    sql: ${TABLE}.cib8436 ;;
  }

  dimension: cib8438 {
    type: string
    sql: ${TABLE}.cib8438 ;;
  }

  dimension: cib8439 {
    type: string
    sql: ${TABLE}.cib8439 ;;
  }

  dimension: cib8440 {
    type: string
    sql: ${TABLE}.cib8440 ;;
  }

  dimension: cib8441 {
    type: string
    sql: ${TABLE}.cib8441 ;;
  }

  dimension: cib8443 {
    type: string
    sql: ${TABLE}.cib8443 ;;
  }

  dimension: cib8444 {
    type: string
    sql: ${TABLE}.cib8444 ;;
  }

  dimension: cib8445 {
    type: string
    sql: ${TABLE}.cib8445 ;;
  }

  dimension: cib8487 {
    type: string
    sql: ${TABLE}.cib8487 ;;
  }

  dimension: cib8496 {
    type: string
    sql: ${TABLE}.cib8496 ;;
  }

  dimension: cib8505 {
    type: string
    sql: ${TABLE}.cib8505 ;;
  }

  dimension: cib8514 {
    type: string
    sql: ${TABLE}.cib8514 ;;
  }

  dimension: cib8523 {
    type: string
    sql: ${TABLE}.cib8523 ;;
  }

  dimension: cib8531 {
    type: string
    sql: ${TABLE}.cib8531 ;;
  }

  dimension: cib8555 {
    type: string
    sql: ${TABLE}.cib8555 ;;
  }

  dimension: cib8560 {
    type: string
    sql: ${TABLE}.cib8560 ;;
  }

  dimension: cib8570 {
    type: string
    sql: ${TABLE}.cib8570 ;;
  }

  dimension: cib8571 {
    type: string
    sql: ${TABLE}.cib8571 ;;
  }

  dimension: cib8572 {
    type: string
    sql: ${TABLE}.cib8572 ;;
  }

  dimension: cib8573 {
    type: string
    sql: ${TABLE}.cib8573 ;;
  }

  dimension: cib8574 {
    type: string
    sql: ${TABLE}.cib8574 ;;
  }

  dimension: cib8575 {
    type: string
    sql: ${TABLE}.cib8575 ;;
  }

  dimension: cib8576 {
    type: string
    sql: ${TABLE}.cib8576 ;;
  }

  dimension: cib8581 {
    type: string
    sql: ${TABLE}.cib8581 ;;
  }

  dimension: cib859002 {
    type: string
    sql: ${TABLE}.cib859002 ;;
  }

  dimension: cib8590_01 {
    type: string
    sql: ${TABLE}.cib8590_01 ;;
  }

  dimension: cib8602 {
    type: string
    sql: ${TABLE}.cib8602 ;;
  }

  dimension: cib8602a {
    type: string
    sql: ${TABLE}.cib8602a ;;
  }

  dimension: cib8604 {
    type: string
    sql: ${TABLE}.cib8604 ;;
  }

  dimension: cib8605 {
    type: string
    sql: ${TABLE}.cib8605 ;;
  }

  dimension: cib8606 {
    type: string
    sql: ${TABLE}.cib8606 ;;
  }

  dimension: cib8608 {
    type: string
    sql: ${TABLE}.cib8608 ;;
  }

  dimension: cib8609 {
    type: string
    sql: ${TABLE}.cib8609 ;;
  }

  dimension: cib8622 {
    type: string
    sql: ${TABLE}.cib8622 ;;
  }

  dimension: cib8625 {
    type: string
    sql: ${TABLE}.cib8625 ;;
  }

  dimension: cib8628 {
    type: string
    sql: ${TABLE}.cib8628 ;;
  }

  dimension: cib8628a {
    type: string
    sql: ${TABLE}.cib8628a ;;
  }

  dimension: cib8629 {
    type: string
    sql: ${TABLE}.cib8629 ;;
  }

  dimension: cib8629a {
    type: string
    sql: ${TABLE}.cib8629a ;;
  }

  dimension: cib8637 {
    type: string
    sql: ${TABLE}.cib8637 ;;
  }

  dimension: cib8642 {
    type: string
    sql: ${TABLE}.cib8642 ;;
  }

  dimension: cib8645 {
    type: string
    sql: ${TABLE}.cib8645 ;;
  }

  dimension: cib8647 {
    type: string
    sql: ${TABLE}.cib8647 ;;
  }

  dimension: cib8652 {
    type: string
    sql: ${TABLE}.cib8652 ;;
  }

  dimension: cib8667 {
    type: string
    sql: ${TABLE}.cib8667 ;;
  }

  dimension: cib8668 {
    type: string
    sql: ${TABLE}.cib8668 ;;
  }

  dimension: cib8669 {
    type: string
    sql: ${TABLE}.cib8669 ;;
  }

  dimension: cib8688 {
    type: string
    sql: ${TABLE}.cib8688 ;;
  }

  dimension: cib8701 {
    type: string
    sql: ${TABLE}.cib8701 ;;
  }

  dimension: cib8703 {
    type: string
    sql: ${TABLE}.cib8703 ;;
  }

  dimension: cib8749 {
    type: string
    sql: ${TABLE}.cib8749 ;;
  }

  dimension: cib8763 {
    type: string
    sql: ${TABLE}.cib8763 ;;
  }

  dimension: cib8850 {
    type: string
    sql: ${TABLE}.cib8850 ;;
  }

  dimension: cib9040 {
    type: string
    sql: ${TABLE}.cib9040 ;;
  }

  dimension: cib9050 {
    type: string
    sql: ${TABLE}.cib9050 ;;
  }

  dimension: cib9154 {
    type: string
    sql: ${TABLE}.cib9154 ;;
  }

  dimension: cib915601 {
    type: string
    sql: ${TABLE}.cib915601 ;;
  }

  dimension: cib915701 {
    type: string
    sql: ${TABLE}.cib915701 ;;
  }

  dimension: cib915801 {
    type: string
    sql: ${TABLE}.cib915801 ;;
  }

  dimension: cib915901 {
    type: string
    sql: ${TABLE}.cib915901 ;;
  }

  dimension: cib916001 {
    type: string
    sql: ${TABLE}.cib916001 ;;
  }

  dimension: cib9180 {
    type: string
    sql: ${TABLE}.cib9180 ;;
  }

  dimension: cib9181 {
    type: string
    sql: ${TABLE}.cib9181 ;;
  }

  dimension: cib9509 {
    type: string
    sql: ${TABLE}.cib9509 ;;
  }

  dimension: cib9510 {
    type: string
    sql: ${TABLE}.cib9510 ;;
  }

  dimension: cib9511 {
    type: string
    sql: ${TABLE}.cib9511 ;;
  }

  dimension: cib9512 {
    type: string
    sql: ${TABLE}.cib9512 ;;
  }

  dimension: cib9513 {
    type: string
    sql: ${TABLE}.cib9513 ;;
  }

  dimension: cib9514 {
    type: string
    sql: ${TABLE}.cib9514 ;;
  }

  dimension: cib9515 {
    type: string
    sql: ${TABLE}.cib9515 ;;
  }

  dimension: cib9516 {
    type: string
    sql: ${TABLE}.cib9516 ;;
  }

  dimension: cib9517 {
    type: string
    sql: ${TABLE}.cib9517 ;;
  }

  dimension: cib9518 {
    type: string
    sql: ${TABLE}.cib9518 ;;
  }

  dimension: cib9519 {
    type: string
    sql: ${TABLE}.cib9519 ;;
  }

  dimension: cib9528 {
    type: string
    sql: ${TABLE}.cib9528 ;;
  }

  dimension: cib9529 {
    type: string
    sql: ${TABLE}.cib9529 ;;
  }

  dimension: cib9530 {
    type: string
    sql: ${TABLE}.cib9530 ;;
  }

  dimension: cib9531 {
    type: string
    sql: ${TABLE}.cib9531 ;;
  }

  dimension: cib9532 {
    type: string
    sql: ${TABLE}.cib9532 ;;
  }

  dimension: cib9533 {
    type: string
    sql: ${TABLE}.cib9533 ;;
  }

  dimension: cib9752 {
    type: string
    sql: ${TABLE}.cib9752 ;;
  }

  dimension: dma_code_3010 {
    type: string
    sql: ${TABLE}.DMA_CODE_3010 ;;
  }

  dimension: endit {
    type: string
    sql: ${TABLE}.endit ;;
  }

  dimension: fips_state_code_3016 {
    type: string
    sql: ${TABLE}.FIPS_STATE_CODE_3016 ;;
  }

  dimension: nib127000_01 {
    type: number
    sql: ${TABLE}.nib127000_01 ;;
  }

  dimension: nib127000_02 {
    type: number
    sql: ${TABLE}.nib127000_02 ;;
  }

  dimension: nib127000_03 {
    type: number
    sql: ${TABLE}.nib127000_03 ;;
  }

  dimension: nib127000_04 {
    type: number
    sql: ${TABLE}.nib127000_04 ;;
  }

  dimension: nib127000_05 {
    type: number
    sql: ${TABLE}.nib127000_05 ;;
  }

  dimension: nib127000_06 {
    type: number
    sql: ${TABLE}.nib127000_06 ;;
  }

  dimension: nib127000_07 {
    type: number
    sql: ${TABLE}.nib127000_07 ;;
  }

  dimension: nib127000_08 {
    type: number
    sql: ${TABLE}.nib127000_08 ;;
  }

  dimension: nib127000_09 {
    type: number
    sql: ${TABLE}.nib127000_09 ;;
  }

  dimension: nib127000_10 {
    type: number
    sql: ${TABLE}.nib127000_10 ;;
  }

  dimension: nib127000_11 {
    type: number
    sql: ${TABLE}.nib127000_11 ;;
  }

  dimension: nib127000_12 {
    type: number
    sql: ${TABLE}.nib127000_12 ;;
  }

  dimension: nib127000_13 {
    type: number
    sql: ${TABLE}.nib127000_13 ;;
  }

  dimension: nib127000_14 {
    type: number
    sql: ${TABLE}.nib127000_14 ;;
  }

  dimension: nib127000_15 {
    type: number
    sql: ${TABLE}.nib127000_15 ;;
  }

  dimension: nib127000_16 {
    type: number
    sql: ${TABLE}.nib127000_16 ;;
  }

  dimension: nib127000_17 {
    type: number
    sql: ${TABLE}.nib127000_17 ;;
  }

  dimension: nib127000_18 {
    type: number
    sql: ${TABLE}.nib127000_18 ;;
  }

  dimension: nib127000_19 {
    type: number
    sql: ${TABLE}.nib127000_19 ;;
  }

  dimension: nib127000_20 {
    type: number
    sql: ${TABLE}.nib127000_20 ;;
  }

  dimension: nib127000_21 {
    type: number
    sql: ${TABLE}.nib127000_21 ;;
  }

  dimension: nib127000_22 {
    type: number
    sql: ${TABLE}.nib127000_22 ;;
  }

  dimension: nib127000_23 {
    type: number
    sql: ${TABLE}.nib127000_23 ;;
  }

  dimension: nib127000_24 {
    type: number
    sql: ${TABLE}.nib127000_24 ;;
  }

  dimension: nib127000_25 {
    type: number
    sql: ${TABLE}.nib127000_25 ;;
  }

  dimension: nib127000_26 {
    type: number
    sql: ${TABLE}.nib127000_26 ;;
  }

  dimension: nib127000_27 {
    type: number
    sql: ${TABLE}.nib127000_27 ;;
  }

  dimension: nib127000_28 {
    type: number
    sql: ${TABLE}.nib127000_28 ;;
  }

  dimension: nib127000_29 {
    type: number
    sql: ${TABLE}.nib127000_29 ;;
  }

  dimension: nib127000_30 {
    type: number
    sql: ${TABLE}.nib127000_30 ;;
  }

  dimension: nib127000_31 {
    type: number
    sql: ${TABLE}.nib127000_31 ;;
  }

  dimension: nib127000_32 {
    type: number
    sql: ${TABLE}.nib127000_32 ;;
  }

  dimension: nib127000_33 {
    type: number
    sql: ${TABLE}.nib127000_33 ;;
  }

  dimension: nib127000_34 {
    type: number
    sql: ${TABLE}.nib127000_34 ;;
  }

  dimension: nib127000_35 {
    type: number
    sql: ${TABLE}.nib127000_35 ;;
  }

  dimension: nib127000_36 {
    type: number
    sql: ${TABLE}.nib127000_36 ;;
  }

  dimension: nib127000_37 {
    type: number
    sql: ${TABLE}.nib127000_37 ;;
  }

  dimension: nib127000_38 {
    type: number
    sql: ${TABLE}.nib127000_38 ;;
  }

  dimension: nib127000_39 {
    type: number
    sql: ${TABLE}.nib127000_39 ;;
  }

  dimension: nib127000_40 {
    type: number
    sql: ${TABLE}.nib127000_40 ;;
  }

  dimension: nib127000_41 {
    type: number
    sql: ${TABLE}.nib127000_41 ;;
  }

  dimension: nib127000_42 {
    type: number
    sql: ${TABLE}.nib127000_42 ;;
  }

  dimension: nib127000_43 {
    type: number
    sql: ${TABLE}.nib127000_43 ;;
  }

  dimension: nib127000_44 {
    type: number
    sql: ${TABLE}.nib127000_44 ;;
  }

  dimension: nib127000_45 {
    type: number
    sql: ${TABLE}.nib127000_45 ;;
  }

  dimension: nib127000_46 {
    type: number
    sql: ${TABLE}.nib127000_46 ;;
  }

  dimension: nib127000_47 {
    type: number
    sql: ${TABLE}.nib127000_47 ;;
  }

  dimension: nib127000_48 {
    type: number
    sql: ${TABLE}.nib127000_48 ;;
  }

  dimension: nib127000_49 {
    type: number
    sql: ${TABLE}.nib127000_49 ;;
  }

  dimension: nib127000_50 {
    type: number
    sql: ${TABLE}.nib127000_50 ;;
  }

  dimension: nib127000_51 {
    type: number
    sql: ${TABLE}.nib127000_51 ;;
  }

  dimension: nib127000_52 {
    type: number
    sql: ${TABLE}.nib127000_52 ;;
  }

  dimension: nib127000_53 {
    type: number
    sql: ${TABLE}.nib127000_53 ;;
  }

  dimension: nib127000_54 {
    type: number
    sql: ${TABLE}.nib127000_54 ;;
  }

  dimension: nib127000_55 {
    type: number
    sql: ${TABLE}.nib127000_55 ;;
  }

  dimension: nib127000_56 {
    type: number
    sql: ${TABLE}.nib127000_56 ;;
  }

  dimension: nib127000_57 {
    type: number
    sql: ${TABLE}.nib127000_57 ;;
  }

  dimension: nib127000_58 {
    type: number
    sql: ${TABLE}.nib127000_58 ;;
  }

  dimension: nib127000_59 {
    type: number
    sql: ${TABLE}.nib127000_59 ;;
  }

  dimension: nib127000_60 {
    type: number
    sql: ${TABLE}.nib127000_60 ;;
  }

  dimension: nib127000_61 {
    type: number
    sql: ${TABLE}.nib127000_61 ;;
  }

  dimension: nib127000_62 {
    type: number
    sql: ${TABLE}.nib127000_62 ;;
  }

  dimension: nib127000_63 {
    type: number
    sql: ${TABLE}.nib127000_63 ;;
  }

  dimension: nib127000_64 {
    type: number
    sql: ${TABLE}.nib127000_64 ;;
  }

  dimension: nib127000_65 {
    type: number
    sql: ${TABLE}.nib127000_65 ;;
  }

  dimension: nib127000_66 {
    type: number
    sql: ${TABLE}.nib127000_66 ;;
  }

  dimension: nib127000_67 {
    type: number
    sql: ${TABLE}.nib127000_67 ;;
  }

  dimension: nib127000_68 {
    type: number
    sql: ${TABLE}.nib127000_68 ;;
  }

  dimension: nib127000_69 {
    type: number
    sql: ${TABLE}.nib127000_69 ;;
  }

  dimension: nib127000_70 {
    type: number
    sql: ${TABLE}.nib127000_70 ;;
  }

  dimension: nib127100_01_y {
    type: number
    sql: ${TABLE}.nib127100_01Y ;;
  }

  dimension: nib127100_02_y {
    type: number
    sql: ${TABLE}.nib127100_02Y ;;
  }

  dimension: nib127100_03_x {
    type: number
    sql: ${TABLE}.nib127100_03X ;;
  }

  dimension: nib127100_04_x {
    type: number
    sql: ${TABLE}.nib127100_04X ;;
  }

  dimension: nib127100_05_x {
    type: number
    sql: ${TABLE}.nib127100_05X ;;
  }

  dimension: nib127100_06_x {
    type: number
    sql: ${TABLE}.nib127100_06X ;;
  }

  dimension: nib127100_07_x {
    type: number
    sql: ${TABLE}.nib127100_07X ;;
  }

  dimension: nib127100_08_x {
    type: number
    sql: ${TABLE}.nib127100_08X ;;
  }

  dimension: nib127100_09_b {
    type: number
    sql: ${TABLE}.nib127100_09B ;;
  }

  dimension: nib127100_10_b {
    type: number
    sql: ${TABLE}.nib127100_10B ;;
  }

  dimension: nib127100_11_b {
    type: number
    sql: ${TABLE}.nib127100_11B ;;
  }

  dimension: nib127100_12_b {
    type: number
    sql: ${TABLE}.nib127100_12B ;;
  }

  dimension: nib127100_13_b {
    type: number
    sql: ${TABLE}.nib127100_13B ;;
  }

  dimension: nib127100_14_b {
    type: number
    sql: ${TABLE}.nib127100_14B ;;
  }

  dimension: nib127100_15_m {
    type: number
    sql: ${TABLE}.nib127100_15M ;;
  }

  dimension: nib127100_16_m {
    type: number
    sql: ${TABLE}.nib127100_16M ;;
  }

  dimension: nib127100_17_m {
    type: number
    sql: ${TABLE}.nib127100_17M ;;
  }

  dimension: nib127100_18_m {
    type: number
    sql: ${TABLE}.nib127100_18M ;;
  }

  dimension: nib127100_19_m {
    type: number
    sql: ${TABLE}.nib127100_19M ;;
  }

  dimension: nib127100_20_s {
    type: number
    sql: ${TABLE}.nib127100_20S ;;
  }

  dimension: nib127100_21_s {
    type: number
    sql: ${TABLE}.nib127100_21S ;;
  }

  dimension: nib127300 {
    type: number
    sql: ${TABLE}.nib127300 ;;
  }

  dimension: nib127400_01_c {
    type: number
    sql: ${TABLE}.nib127400_01C ;;
  }

  dimension: nib127400_02_c {
    type: number
    sql: ${TABLE}.nib127400_02C ;;
  }

  dimension: nib127400_03_c {
    type: number
    sql: ${TABLE}.nib127400_03C ;;
  }

  dimension: nib127400_04_c {
    type: number
    sql: ${TABLE}.nib127400_04C ;;
  }

  dimension: nib127400_05_c {
    type: number
    sql: ${TABLE}.nib127400_05C ;;
  }

  dimension: nib127400_06_u {
    type: number
    sql: ${TABLE}.nib127400_06U ;;
  }

  dimension: nib127400_07_c {
    type: number
    sql: ${TABLE}.nib127400_07C ;;
  }

  dimension: nib127400_08_o {
    type: number
    sql: ${TABLE}.nib127400_08O ;;
  }

  dimension: nib127400_09_o {
    type: number
    sql: ${TABLE}.nib127400_09O ;;
  }

  dimension: nib127400_10_r {
    type: number
    sql: ${TABLE}.nib127400_10R ;;
  }

  dimension: nib127400_11_r {
    type: number
    sql: ${TABLE}.nib127400_11R ;;
  }

  dimension: nib127400_12_o {
    type: number
    sql: ${TABLE}.nib127400_12O ;;
  }

  dimension: nib127400_13_c {
    type: number
    sql: ${TABLE}.nib127400_13C ;;
  }

  dimension: nib2000 {
    type: number
    sql: ${TABLE}.nib2000 ;;
  }

  dimension: nib2001 {
    type: number
    sql: ${TABLE}.nib2001 ;;
  }

  dimension: nib2002 {
    type: number
    sql: ${TABLE}.nib2002 ;;
  }

  dimension: nib2003 {
    type: number
    sql: ${TABLE}.nib2003 ;;
  }

  dimension: nib2004 {
    type: number
    sql: ${TABLE}.nib2004 ;;
  }

  dimension: nib2005 {
    type: number
    sql: ${TABLE}.nib2005 ;;
  }

  dimension: nib2006 {
    type: number
    sql: ${TABLE}.nib2006 ;;
  }

  dimension: nib2007 {
    type: number
    sql: ${TABLE}.nib2007 ;;
  }

  dimension: nib2008 {
    type: number
    sql: ${TABLE}.nib2008 ;;
  }

  dimension: nib2009 {
    type: number
    sql: ${TABLE}.nib2009 ;;
  }

  dimension: nib2010 {
    type: number
    sql: ${TABLE}.nib2010 ;;
  }

  dimension: nib2011 {
    type: number
    sql: ${TABLE}.nib2011 ;;
  }

  dimension: nib2012 {
    type: number
    sql: ${TABLE}.nib2012 ;;
  }

  dimension: nib2013 {
    type: number
    sql: ${TABLE}.nib2013 ;;
  }

  dimension: nib2014 {
    type: number
    sql: ${TABLE}.nib2014 ;;
  }

  dimension: nib2015 {
    type: number
    sql: ${TABLE}.nib2015 ;;
  }

  dimension: nib2016 {
    type: number
    sql: ${TABLE}.nib2016 ;;
  }

  dimension: nib2017 {
    type: number
    sql: ${TABLE}.nib2017 ;;
  }

  dimension: nib2018 {
    type: number
    sql: ${TABLE}.nib2018 ;;
  }

  dimension: nib2019 {
    type: number
    sql: ${TABLE}.nib2019 ;;
  }

  dimension: nib2020 {
    type: number
    sql: ${TABLE}.nib2020 ;;
  }

  dimension: nib2021 {
    type: number
    sql: ${TABLE}.nib2021 ;;
  }

  dimension: nib2022 {
    type: number
    sql: ${TABLE}.nib2022 ;;
  }

  dimension: nib2023 {
    type: number
    sql: ${TABLE}.nib2023 ;;
  }

  dimension: nib2024 {
    type: number
    sql: ${TABLE}.nib2024 ;;
  }

  dimension: nib2025 {
    type: number
    sql: ${TABLE}.nib2025 ;;
  }

  dimension: nib2026 {
    type: number
    sql: ${TABLE}.nib2026 ;;
  }

  dimension: nib2029 {
    type: number
    sql: ${TABLE}.nib2029 ;;
  }

  dimension: nib2030 {
    type: number
    sql: ${TABLE}.nib2030 ;;
  }

  dimension: nib2031 {
    type: number
    sql: ${TABLE}.nib2031 ;;
  }

  dimension: nib2032 {
    type: number
    sql: ${TABLE}.nib2032 ;;
  }

  dimension: nib2033 {
    type: number
    sql: ${TABLE}.nib2033 ;;
  }

  dimension: nib2058_01 {
    type: number
    sql: ${TABLE}.nib2058_01 ;;
  }

  dimension: nib2058_02 {
    type: number
    sql: ${TABLE}.nib2058_02 ;;
  }

  dimension: nib2059_01 {
    type: number
    sql: ${TABLE}.nib2059_01 ;;
  }

  dimension: nib2059_02 {
    type: number
    sql: ${TABLE}.nib2059_02 ;;
  }

  dimension: nib2060_01 {
    type: number
    sql: ${TABLE}.nib2060_01 ;;
  }

  dimension: nib2060_02 {
    type: number
    sql: ${TABLE}.nib2060_02 ;;
  }

  dimension: nib2061_01 {
    type: number
    sql: ${TABLE}.nib2061_01 ;;
  }

  dimension: nib2061_02 {
    type: number
    sql: ${TABLE}.nib2061_02 ;;
  }

  dimension: nib2062_01 {
    type: number
    sql: ${TABLE}.nib2062_01 ;;
  }

  dimension: nib2062_02 {
    type: number
    sql: ${TABLE}.nib2062_02 ;;
  }

  dimension: nib2076_01 {
    type: number
    sql: ${TABLE}.nib2076_01 ;;
  }

  dimension: nib2076_02 {
    type: number
    sql: ${TABLE}.nib2076_02 ;;
  }

  dimension: nib2076_03 {
    type: number
    sql: ${TABLE}.nib2076_03 ;;
  }

  dimension: nib2076_04 {
    type: number
    sql: ${TABLE}.nib2076_04 ;;
  }

  dimension: nib2076_05 {
    type: number
    sql: ${TABLE}.nib2076_05 ;;
  }

  dimension: nib2076_06 {
    type: number
    sql: ${TABLE}.nib2076_06 ;;
  }

  dimension: nib2076_07 {
    type: number
    sql: ${TABLE}.nib2076_07 ;;
  }

  dimension: nib2076_08 {
    type: number
    sql: ${TABLE}.nib2076_08 ;;
  }

  dimension: nib2076_09 {
    type: number
    sql: ${TABLE}.nib2076_09 ;;
  }

  dimension: nib2076_10 {
    type: number
    sql: ${TABLE}.nib2076_10 ;;
  }

  dimension: nib2076_11 {
    type: number
    sql: ${TABLE}.nib2076_11 ;;
  }

  dimension: nib2076_12 {
    type: number
    sql: ${TABLE}.nib2076_12 ;;
  }

  dimension: nib2076_13 {
    type: number
    sql: ${TABLE}.nib2076_13 ;;
  }

  dimension: nib2077 {
    type: number
    sql: ${TABLE}.nib2077 ;;
  }

  dimension: nib2080 {
    type: string
    sql: ${TABLE}.nib2080 ;;
  }

  dimension: nib2081 {
    type: string
    sql: ${TABLE}.nib2081 ;;
  }

  dimension: nib2082 {
    type: string
    sql: ${TABLE}.nib2082 ;;
  }

  dimension: nib2083 {
    type: string
    sql: ${TABLE}.nib2083 ;;
  }

  dimension: nib2084 {
    type: string
    sql: ${TABLE}.nib2084 ;;
  }

  dimension: nib2085 {
    type: string
    sql: ${TABLE}.nib2085 ;;
  }

  dimension: nib2086 {
    type: string
    sql: ${TABLE}.nib2086 ;;
  }

  dimension: nib2087 {
    type: string
    sql: ${TABLE}.nib2087 ;;
  }

  dimension: nib2088 {
    type: string
    sql: ${TABLE}.nib2088 ;;
  }

  dimension: nib2089 {
    type: string
    sql: ${TABLE}.nib2089 ;;
  }

  dimension: nib2090 {
    type: string
    sql: ${TABLE}.nib2090 ;;
  }

  dimension: nib2091 {
    type: string
    sql: ${TABLE}.nib2091 ;;
  }

  dimension: nib2092 {
    type: string
    sql: ${TABLE}.nib2092 ;;
  }

  dimension: nib2093 {
    type: string
    sql: ${TABLE}.nib2093 ;;
  }

  dimension: nib2094 {
    type: string
    sql: ${TABLE}.nib2094 ;;
  }

  dimension: nib2095 {
    type: string
    sql: ${TABLE}.nib2095 ;;
  }

  dimension: nib2096 {
    type: string
    sql: ${TABLE}.nib2096 ;;
  }

  dimension: nib2097 {
    type: string
    sql: ${TABLE}.nib2097 ;;
  }

  dimension: nib2098 {
    type: string
    sql: ${TABLE}.nib2098 ;;
  }

  dimension: nib2144 {
    type: string
    sql: ${TABLE}.nib2144 ;;
  }

  dimension: nib2145 {
    type: string
    sql: ${TABLE}.nib2145 ;;
  }

  dimension: nib2146 {
    type: string
    sql: ${TABLE}.nib2146 ;;
  }

  dimension: nib2147 {
    type: string
    sql: ${TABLE}.nib2147 ;;
  }

  dimension: nib2148 {
    type: string
    sql: ${TABLE}.nib2148 ;;
  }

  dimension: nib2149 {
    type: string
    sql: ${TABLE}.nib2149 ;;
  }

  dimension: nib2150 {
    type: string
    sql: ${TABLE}.nib2150 ;;
  }

  dimension: nib2151 {
    type: string
    sql: ${TABLE}.nib2151 ;;
  }

  dimension: nib2152 {
    type: string
    sql: ${TABLE}.nib2152 ;;
  }

  dimension: nib2153 {
    type: string
    sql: ${TABLE}.nib2153 ;;
  }

  dimension: nib2154 {
    type: string
    sql: ${TABLE}.nib2154 ;;
  }

  dimension: nib2155 {
    type: string
    sql: ${TABLE}.nib2155 ;;
  }

  # dimension: nib2156 {
  #   type: string
  #   sql: ${TABLE}.nib2156 ;;
  # }

  # dimension: nib2157 {
  #   type: string
  #   sql: ${TABLE}.nib2157 ;;
  # }

  # dimension: nib2158 {
  #   type: string
  #   sql: ${TABLE}.nib2158 ;;
  # }

  # dimension: nib2159 {
  #   type: string
  #   sql: ${TABLE}.nib2159 ;;
  # }

  dimension: nib2160 {
    type: string
    sql: ${TABLE}.nib2160 ;;
  }

  dimension: nib2161 {
    type: string
    sql: ${TABLE}.nib2161 ;;
  }

  dimension: nib2162 {
    type: string
    sql: ${TABLE}.nib2162 ;;
  }

  dimension: nib2163 {
    type: string
    sql: ${TABLE}.nib2163 ;;
  }

  dimension: nib2164 {
    type: string
    sql: ${TABLE}.nib2164 ;;
  }

  dimension: nib2165 {
    type: string
    sql: ${TABLE}.nib2165 ;;
  }

  dimension: nib2166 {
    type: string
    sql: ${TABLE}.nib2166 ;;
  }

  dimension: nib2167 {
    type: string
    sql: ${TABLE}.nib2167 ;;
  }

  dimension: nib2168 {
    type: string
    sql: ${TABLE}.nib2168 ;;
  }

  dimension: nib2169 {
    type: string
    sql: ${TABLE}.nib2169 ;;
  }

  dimension: nib2170 {
    type: string
    sql: ${TABLE}.nib2170 ;;
  }

  dimension: nib2171 {
    type: string
    sql: ${TABLE}.nib2171 ;;
  }

  dimension: nib2172 {
    type: string
    sql: ${TABLE}.nib2172 ;;
  }

  dimension: nib2173 {
    type: string
    sql: ${TABLE}.nib2173 ;;
  }

  dimension: nib2174 {
    type: string
    sql: ${TABLE}.nib2174 ;;
  }

  dimension: nib2175 {
    type: string
    sql: ${TABLE}.nib2175 ;;
  }

  dimension: nib2176 {
    type: string
    sql: ${TABLE}.nib2176 ;;
  }

  dimension: nib2177 {
    type: string
    sql: ${TABLE}.nib2177 ;;
  }

  dimension: nib2178 {
    type: string
    sql: ${TABLE}.nib2178 ;;
  }

  dimension: nib2179 {
    type: string
    sql: ${TABLE}.nib2179 ;;
  }

  dimension: nib2180 {
    type: string
    sql: ${TABLE}.nib2180 ;;
  }

  dimension: nib2181 {
    type: string
    sql: ${TABLE}.nib2181 ;;
  }

  dimension: nib2182 {
    type: string
    sql: ${TABLE}.nib2182 ;;
  }

  dimension: nib2183 {
    type: string
    sql: ${TABLE}.nib2183 ;;
  }

  dimension: nib2184 {
    type: string
    sql: ${TABLE}.nib2184 ;;
  }

  dimension: nib2185 {
    type: string
    sql: ${TABLE}.nib2185 ;;
  }

  dimension: nib2186 {
    type: string
    sql: ${TABLE}.nib2186 ;;
  }

  dimension: nib2187 {
    type: string
    sql: ${TABLE}.nib2187 ;;
  }

  dimension: nib2188 {
    type: string
    sql: ${TABLE}.nib2188 ;;
  }

  dimension: nib2189 {
    type: string
    sql: ${TABLE}.nib2189 ;;
  }

  dimension: nib2190 {
    type: string
    sql: ${TABLE}.nib2190 ;;
  }

  dimension: nib2191 {
    type: string
    sql: ${TABLE}.nib2191 ;;
  }

  dimension: nib2192 {
    type: string
    sql: ${TABLE}.nib2192 ;;
  }

  dimension: nib2193 {
    type: string
    sql: ${TABLE}.nib2193 ;;
  }

  dimension: nib2194 {
    type: string
    sql: ${TABLE}.nib2194 ;;
  }

  dimension: nib2195 {
    type: string
    sql: ${TABLE}.nib2195 ;;
  }

  dimension: nib2205 {
    type: number
    sql: ${TABLE}.nib2205 ;;
  }

  dimension: nib2206 {
    type: number
    sql: ${TABLE}.nib2206 ;;
  }

  dimension: nib2208 {
    type: number
    sql: ${TABLE}.nib2208 ;;
  }

  dimension: nib2350_a {
    type: number
    sql: ${TABLE}.nib2350_A ;;
  }

  dimension: nib2350_b {
    type: number
    sql: ${TABLE}.nib2350_B ;;
  }

  dimension: nib2350_c {
    type: number
    sql: ${TABLE}.nib2350_C ;;
  }

  dimension: nib2350_d {
    type: number
    sql: ${TABLE}.nib2350_D ;;
  }

  dimension: nib2350_e {
    type: number
    sql: ${TABLE}.nib2350_E ;;
  }

  dimension: nib2350_f {
    type: number
    sql: ${TABLE}.nib2350_F ;;
  }

  dimension: nib2350_m {
    type: number
    sql: ${TABLE}.nib2350_M ;;
  }

  dimension: nib2350_o {
    type: number
    sql: ${TABLE}.nib2350_O ;;
  }

  dimension: nib2350_p {
    type: number
    sql: ${TABLE}.nib2350_P ;;
  }

  dimension: nib2350_s {
    type: number
    sql: ${TABLE}.nib2350_S ;;
  }

  dimension: nib2351 {
    type: number
    sql: ${TABLE}.nib2351 ;;
  }

  dimension: nib2354 {
    type: number
    sql: ${TABLE}.nib2354 ;;
  }

  dimension: nib2356 {
    type: number
    sql: ${TABLE}.nib2356 ;;
  }

  dimension: nib2360_a000 {
    type: number
    sql: ${TABLE}.nib2360_A000 ;;
  }

  dimension: nib2360_a001 {
    type: number
    sql: ${TABLE}.nib2360_A001 ;;
  }

  dimension: nib2360_a002 {
    type: number
    sql: ${TABLE}.nib2360_A002 ;;
  }

  dimension: nib2360_a003 {
    type: number
    sql: ${TABLE}.nib2360_A003 ;;
  }

  dimension: nib2360_a004 {
    type: number
    sql: ${TABLE}.nib2360_A004 ;;
  }

  dimension: nib2360_a005 {
    type: number
    sql: ${TABLE}.nib2360_A005 ;;
  }

  dimension: nib2360_a006 {
    type: number
    sql: ${TABLE}.nib2360_A006 ;;
  }

  dimension: nib2360_a007 {
    type: number
    sql: ${TABLE}.nib2360_A007 ;;
  }

  dimension: nib2360_a008 {
    type: number
    sql: ${TABLE}.nib2360_A008 ;;
  }

  dimension: nib2360_a009 {
    type: number
    sql: ${TABLE}.nib2360_A009 ;;
  }

  dimension: nib2360_a010 {
    type: number
    sql: ${TABLE}.nib2360_A010 ;;
  }

  dimension: nib2360_a011 {
    type: number
    sql: ${TABLE}.nib2360_A011 ;;
  }

  dimension: nib2360_a012 {
    type: number
    sql: ${TABLE}.nib2360_A012 ;;
  }

  dimension: nib2360_a013 {
    type: number
    sql: ${TABLE}.nib2360_A013 ;;
  }

  dimension: nib2360_a014 {
    type: number
    sql: ${TABLE}.nib2360_A014 ;;
  }

  dimension: nib2360_a015 {
    type: number
    sql: ${TABLE}.nib2360_A015 ;;
  }

  dimension: nib2360_a016 {
    type: number
    sql: ${TABLE}.nib2360_A016 ;;
  }

  dimension: nib2360_a017 {
    type: number
    sql: ${TABLE}.nib2360_A017 ;;
  }

  dimension: nib2360_a018 {
    type: number
    sql: ${TABLE}.nib2360_A018 ;;
  }

  dimension: nib2360_a019 {
    type: number
    sql: ${TABLE}.nib2360_A019 ;;
  }

  dimension: nib2360_a020 {
    type: number
    sql: ${TABLE}.nib2360_A020 ;;
  }

  dimension: nib2360_a021 {
    type: number
    sql: ${TABLE}.nib2360_A021 ;;
  }

  dimension: nib2360_b000 {
    type: number
    sql: ${TABLE}.nib2360_B000 ;;
  }

  dimension: nib2360_b001 {
    type: number
    sql: ${TABLE}.nib2360_B001 ;;
  }

  dimension: nib2360_b002 {
    type: number
    sql: ${TABLE}.nib2360_B002 ;;
  }

  dimension: nib2360_b003 {
    type: number
    sql: ${TABLE}.nib2360_B003 ;;
  }

  dimension: nib2360_b004 {
    type: number
    sql: ${TABLE}.nib2360_B004 ;;
  }

  dimension: nib2360_b005 {
    type: number
    sql: ${TABLE}.nib2360_B005 ;;
  }

  dimension: nib2360_b006 {
    type: number
    sql: ${TABLE}.nib2360_B006 ;;
  }

  dimension: nib2360_c000 {
    type: number
    sql: ${TABLE}.nib2360_C000 ;;
  }

  dimension: nib2360_c001 {
    type: number
    sql: ${TABLE}.nib2360_C001 ;;
  }

  dimension: nib2360_c002 {
    type: number
    sql: ${TABLE}.nib2360_C002 ;;
  }

  dimension: nib2360_c003 {
    type: number
    sql: ${TABLE}.nib2360_C003 ;;
  }

  dimension: nib2360_c004 {
    type: number
    sql: ${TABLE}.nib2360_C004 ;;
  }

  dimension: nib2360_c005 {
    type: number
    sql: ${TABLE}.nib2360_C005 ;;
  }

  dimension: nib2360_c006 {
    type: number
    sql: ${TABLE}.nib2360_C006 ;;
  }

  dimension: nib2360_c007 {
    type: number
    sql: ${TABLE}.nib2360_C007 ;;
  }

  dimension: nib2360_c008 {
    type: number
    sql: ${TABLE}.nib2360_C008 ;;
  }

  dimension: nib2360_c009 {
    type: number
    sql: ${TABLE}.nib2360_C009 ;;
  }

  dimension: nib2360_c010 {
    type: number
    sql: ${TABLE}.nib2360_C010 ;;
  }

  dimension: nib2360_c011 {
    type: number
    sql: ${TABLE}.nib2360_C011 ;;
  }

  dimension: nib2360_c012 {
    type: number
    sql: ${TABLE}.nib2360_C012 ;;
  }

  dimension: nib2360_c013 {
    type: number
    sql: ${TABLE}.nib2360_C013 ;;
  }

  dimension: nib2360_c014 {
    type: number
    sql: ${TABLE}.nib2360_C014 ;;
  }

  dimension: nib2360_c015 {
    type: number
    sql: ${TABLE}.nib2360_C015 ;;
  }

  dimension: nib2360_c016 {
    type: number
    sql: ${TABLE}.nib2360_C016 ;;
  }

  dimension: nib2360_c017 {
    type: number
    sql: ${TABLE}.nib2360_C017 ;;
  }

  dimension: nib2360_c018 {
    type: number
    sql: ${TABLE}.nib2360_C018 ;;
  }

  dimension: nib2360_c019 {
    type: number
    sql: ${TABLE}.nib2360_C019 ;;
  }

  dimension: nib2360_c020 {
    type: number
    sql: ${TABLE}.nib2360_C020 ;;
  }

  dimension: nib2360_c021 {
    type: number
    sql: ${TABLE}.nib2360_C021 ;;
  }

  dimension: nib2360_c022 {
    type: number
    sql: ${TABLE}.nib2360_C022 ;;
  }

  dimension: nib2360_c023 {
    type: number
    sql: ${TABLE}.nib2360_C023 ;;
  }

  dimension: nib2360_c024 {
    type: number
    sql: ${TABLE}.nib2360_C024 ;;
  }

  dimension: nib2360_c025 {
    type: number
    sql: ${TABLE}.nib2360_C025 ;;
  }

  dimension: nib2360_c026 {
    type: number
    sql: ${TABLE}.nib2360_C026 ;;
  }

  dimension: nib2360_d000 {
    type: number
    sql: ${TABLE}.nib2360_D000 ;;
  }

  dimension: nib2360_d001 {
    type: number
    sql: ${TABLE}.nib2360_D001 ;;
  }

  dimension: nib2360_d002 {
    type: number
    sql: ${TABLE}.nib2360_D002 ;;
  }

  dimension: nib2360_d003 {
    type: number
    sql: ${TABLE}.nib2360_D003 ;;
  }

  dimension: nib2360_d004 {
    type: number
    sql: ${TABLE}.nib2360_D004 ;;
  }

  dimension: nib2360_d005 {
    type: number
    sql: ${TABLE}.nib2360_D005 ;;
  }

  dimension: nib2360_d006 {
    type: number
    sql: ${TABLE}.nib2360_D006 ;;
  }

  dimension: nib2360_d007 {
    type: number
    sql: ${TABLE}.nib2360_D007 ;;
  }

  dimension: nib2360_d008 {
    type: number
    sql: ${TABLE}.nib2360_D008 ;;
  }

  dimension: nib2360_d009 {
    type: number
    sql: ${TABLE}.nib2360_D009 ;;
  }

  dimension: nib2360_d010 {
    type: number
    sql: ${TABLE}.nib2360_D010 ;;
  }

  dimension: nib2360_d011 {
    type: number
    sql: ${TABLE}.nib2360_D011 ;;
  }

  dimension: nib2360_d012 {
    type: number
    sql: ${TABLE}.nib2360_D012 ;;
  }

  dimension: nib2360_d013 {
    type: number
    sql: ${TABLE}.nib2360_D013 ;;
  }

  dimension: nib2360_d014 {
    type: number
    sql: ${TABLE}.nib2360_D014 ;;
  }

  dimension: nib2360_d015 {
    type: number
    sql: ${TABLE}.nib2360_D015 ;;
  }

  dimension: nib2360_d016 {
    type: number
    sql: ${TABLE}.nib2360_D016 ;;
  }

  dimension: nib2360_d017 {
    type: number
    sql: ${TABLE}.nib2360_D017 ;;
  }

  dimension: nib2360_d018 {
    type: number
    sql: ${TABLE}.nib2360_D018 ;;
  }

  dimension: nib2360_d019 {
    type: number
    sql: ${TABLE}.nib2360_D019 ;;
  }

  dimension: nib2360_d020 {
    type: number
    sql: ${TABLE}.nib2360_D020 ;;
  }

  dimension: nib2360_d021 {
    type: number
    sql: ${TABLE}.nib2360_D021 ;;
  }

  dimension: nib2360_d022 {
    type: number
    sql: ${TABLE}.nib2360_D022 ;;
  }

  dimension: nib2360_d023 {
    type: number
    sql: ${TABLE}.nib2360_D023 ;;
  }

  dimension: nib2360_d024 {
    type: number
    sql: ${TABLE}.nib2360_D024 ;;
  }

  dimension: nib2360_d025 {
    type: number
    sql: ${TABLE}.nib2360_D025 ;;
  }

  dimension: nib2360_d026 {
    type: number
    sql: ${TABLE}.nib2360_D026 ;;
  }

  dimension: nib2360_d027 {
    type: number
    sql: ${TABLE}.nib2360_D027 ;;
  }

  dimension: nib2360_d028 {
    type: number
    sql: ${TABLE}.nib2360_D028 ;;
  }

  dimension: nib2360_d029 {
    type: number
    sql: ${TABLE}.nib2360_D029 ;;
  }

  dimension: nib2360_d030 {
    type: number
    sql: ${TABLE}.nib2360_D030 ;;
  }

  dimension: nib2360_d031 {
    type: number
    sql: ${TABLE}.nib2360_D031 ;;
  }

  dimension: nib2360_d032 {
    type: number
    sql: ${TABLE}.nib2360_D032 ;;
  }

  dimension: nib2360_d033 {
    type: number
    sql: ${TABLE}.nib2360_D033 ;;
  }

  dimension: nib2360_d034 {
    type: number
    sql: ${TABLE}.nib2360_D034 ;;
  }

  dimension: nib2360_d035 {
    type: number
    sql: ${TABLE}.nib2360_D035 ;;
  }

  dimension: nib2360_d036 {
    type: number
    sql: ${TABLE}.nib2360_D036 ;;
  }

  dimension: nib2360_d037 {
    type: number
    sql: ${TABLE}.nib2360_D037 ;;
  }

  dimension: nib2360_d038 {
    type: number
    sql: ${TABLE}.nib2360_D038 ;;
  }

  dimension: nib2360_d039 {
    type: number
    sql: ${TABLE}.nib2360_D039 ;;
  }

  dimension: nib2360_d040 {
    type: number
    sql: ${TABLE}.nib2360_D040 ;;
  }

  dimension: nib2360_d041 {
    type: number
    sql: ${TABLE}.nib2360_D041 ;;
  }

  dimension: nib2360_d042 {
    type: number
    sql: ${TABLE}.nib2360_D042 ;;
  }

  dimension: nib2360_d043 {
    type: number
    sql: ${TABLE}.nib2360_D043 ;;
  }

  dimension: nib2360_d044 {
    type: number
    sql: ${TABLE}.nib2360_D044 ;;
  }

  dimension: nib2360_d045 {
    type: number
    sql: ${TABLE}.nib2360_D045 ;;
  }

  dimension: nib2360_d046 {
    type: number
    sql: ${TABLE}.nib2360_D046 ;;
  }

  dimension: nib2360_d047 {
    type: number
    sql: ${TABLE}.nib2360_D047 ;;
  }

  dimension: nib2360_d048 {
    type: number
    sql: ${TABLE}.nib2360_D048 ;;
  }

  dimension: nib2360_d049 {
    type: number
    sql: ${TABLE}.nib2360_D049 ;;
  }

  dimension: nib2360_d050 {
    type: number
    sql: ${TABLE}.nib2360_D050 ;;
  }

  dimension: nib2360_d051 {
    type: number
    sql: ${TABLE}.nib2360_D051 ;;
  }

  dimension: nib2360_d052 {
    type: number
    sql: ${TABLE}.nib2360_D052 ;;
  }

  dimension: nib2360_d053 {
    type: number
    sql: ${TABLE}.nib2360_D053 ;;
  }

  dimension: nib2360_d054 {
    type: number
    sql: ${TABLE}.nib2360_D054 ;;
  }

  dimension: nib2360_d055 {
    type: number
    sql: ${TABLE}.nib2360_D055 ;;
  }

  dimension: nib2360_d056 {
    type: number
    sql: ${TABLE}.nib2360_D056 ;;
  }

  dimension: nib2360_d057 {
    type: number
    sql: ${TABLE}.nib2360_D057 ;;
  }

  dimension: nib2360_d058 {
    type: number
    sql: ${TABLE}.nib2360_D058 ;;
  }

  dimension: nib2360_d059 {
    type: number
    sql: ${TABLE}.nib2360_D059 ;;
  }

  dimension: nib2360_d060 {
    type: number
    sql: ${TABLE}.nib2360_D060 ;;
  }

  dimension: nib2360_d061 {
    type: number
    sql: ${TABLE}.nib2360_D061 ;;
  }

  dimension: nib2360_d062 {
    type: number
    sql: ${TABLE}.nib2360_D062 ;;
  }

  dimension: nib2360_d063 {
    type: number
    sql: ${TABLE}.nib2360_D063 ;;
  }

  dimension: nib2360_d064 {
    type: number
    sql: ${TABLE}.nib2360_D064 ;;
  }

  dimension: nib2360_d065 {
    type: number
    sql: ${TABLE}.nib2360_D065 ;;
  }

  dimension: nib2360_d066 {
    type: number
    sql: ${TABLE}.nib2360_D066 ;;
  }

  dimension: nib2360_d067 {
    type: number
    sql: ${TABLE}.nib2360_D067 ;;
  }

  dimension: nib2360_d068 {
    type: number
    sql: ${TABLE}.nib2360_D068 ;;
  }

  dimension: nib2360_d069 {
    type: number
    sql: ${TABLE}.nib2360_D069 ;;
  }

  dimension: nib2360_d070 {
    type: number
    sql: ${TABLE}.nib2360_D070 ;;
  }

  dimension: nib2360_d071 {
    type: number
    sql: ${TABLE}.nib2360_D071 ;;
  }

  dimension: nib2360_d072 {
    type: number
    sql: ${TABLE}.nib2360_D072 ;;
  }

  dimension: nib2360_d073 {
    type: number
    sql: ${TABLE}.nib2360_D073 ;;
  }

  dimension: nib2360_d074 {
    type: number
    sql: ${TABLE}.nib2360_D074 ;;
  }

  dimension: nib2360_d075 {
    type: number
    sql: ${TABLE}.nib2360_D075 ;;
  }

  dimension: nib2360_d076 {
    type: number
    sql: ${TABLE}.nib2360_D076 ;;
  }

  dimension: nib2360_d077 {
    type: number
    sql: ${TABLE}.nib2360_D077 ;;
  }

  dimension: nib2360_d078 {
    type: number
    sql: ${TABLE}.nib2360_D078 ;;
  }

  dimension: nib2360_d079 {
    type: number
    sql: ${TABLE}.nib2360_D079 ;;
  }

  dimension: nib2360_e001 {
    type: number
    sql: ${TABLE}.nib2360_E001 ;;
  }

  dimension: nib2360_e002 {
    type: number
    sql: ${TABLE}.nib2360_E002 ;;
  }

  dimension: nib2360_e003 {
    type: number
    sql: ${TABLE}.nib2360_E003 ;;
  }

  dimension: nib2360_e004 {
    type: number
    sql: ${TABLE}.nib2360_E004 ;;
  }

  dimension: nib2360_e005 {
    type: number
    sql: ${TABLE}.nib2360_E005 ;;
  }

  dimension: nib2360_e006 {
    type: number
    sql: ${TABLE}.nib2360_E006 ;;
  }

  dimension: nib2360_e007 {
    type: number
    sql: ${TABLE}.nib2360_E007 ;;
  }

  dimension: nib2360_e008 {
    type: number
    sql: ${TABLE}.nib2360_E008 ;;
  }

  dimension: nib2360_e009 {
    type: number
    sql: ${TABLE}.nib2360_E009 ;;
  }

  dimension: nib2360_e010 {
    type: number
    sql: ${TABLE}.nib2360_E010 ;;
  }

  dimension: nib2360_e011 {
    type: number
    sql: ${TABLE}.nib2360_E011 ;;
  }

  dimension: nib2360_e012 {
    type: number
    sql: ${TABLE}.nib2360_E012 ;;
  }

  dimension: nib2360_e013 {
    type: number
    sql: ${TABLE}.nib2360_E013 ;;
  }

  dimension: nib2360_e014 {
    type: number
    sql: ${TABLE}.nib2360_E014 ;;
  }

  dimension: nib2360_e015 {
    type: number
    sql: ${TABLE}.nib2360_E015 ;;
  }

  dimension: nib2360_e016 {
    type: number
    sql: ${TABLE}.nib2360_E016 ;;
  }

  dimension: nib2360_e017 {
    type: number
    sql: ${TABLE}.nib2360_E017 ;;
  }

  dimension: nib2360_e018 {
    type: number
    sql: ${TABLE}.nib2360_E018 ;;
  }

  dimension: nib2360_e019 {
    type: number
    sql: ${TABLE}.nib2360_E019 ;;
  }

  dimension: nib2360_e020 {
    type: number
    sql: ${TABLE}.nib2360_E020 ;;
  }

  dimension: nib2360_e021 {
    type: number
    sql: ${TABLE}.nib2360_E021 ;;
  }

  dimension: nib2360_e022 {
    type: number
    sql: ${TABLE}.nib2360_E022 ;;
  }

  dimension: nib2360_e023 {
    type: number
    sql: ${TABLE}.nib2360_E023 ;;
  }

  dimension: nib2360_e024 {
    type: number
    sql: ${TABLE}.nib2360_E024 ;;
  }

  dimension: nib2360_e025 {
    type: number
    sql: ${TABLE}.nib2360_E025 ;;
  }

  dimension: nib2360_e026 {
    type: number
    sql: ${TABLE}.nib2360_E026 ;;
  }

  dimension: nib2360_e027 {
    type: number
    sql: ${TABLE}.nib2360_E027 ;;
  }

  dimension: nib2360_e028 {
    type: number
    sql: ${TABLE}.nib2360_E028 ;;
  }

  dimension: nib2360_e029 {
    type: number
    sql: ${TABLE}.nib2360_E029 ;;
  }

  dimension: nib2360_e030 {
    type: number
    sql: ${TABLE}.nib2360_E030 ;;
  }

  dimension: nib2360_e031 {
    type: number
    sql: ${TABLE}.nib2360_E031 ;;
  }

  dimension: nib2360_e032 {
    type: number
    sql: ${TABLE}.nib2360_E032 ;;
  }

  dimension: nib2360_e033 {
    type: number
    sql: ${TABLE}.nib2360_E033 ;;
  }

  dimension: nib2360_e034 {
    type: number
    sql: ${TABLE}.nib2360_E034 ;;
  }

  dimension: nib2360_e035 {
    type: number
    sql: ${TABLE}.nib2360_E035 ;;
  }

  dimension: nib2360_e036 {
    type: number
    sql: ${TABLE}.nib2360_E036 ;;
  }

  dimension: nib2360_e037 {
    type: number
    sql: ${TABLE}.nib2360_E037 ;;
  }

  dimension: nib2360_e038 {
    type: number
    sql: ${TABLE}.nib2360_E038 ;;
  }

  dimension: nib2360_e039 {
    type: number
    sql: ${TABLE}.nib2360_E039 ;;
  }

  dimension: nib2360_e040 {
    type: number
    sql: ${TABLE}.nib2360_E040 ;;
  }

  dimension: nib2360_e041 {
    type: number
    sql: ${TABLE}.nib2360_E041 ;;
  }

  dimension: nib2360_e042 {
    type: number
    sql: ${TABLE}.nib2360_E042 ;;
  }

  dimension: nib2360_e043 {
    type: number
    sql: ${TABLE}.nib2360_E043 ;;
  }

  dimension: nib2360_e044 {
    type: number
    sql: ${TABLE}.nib2360_E044 ;;
  }

  dimension: nib2360_e045 {
    type: number
    sql: ${TABLE}.nib2360_E045 ;;
  }

  dimension: nib2360_e046 {
    type: number
    sql: ${TABLE}.nib2360_E046 ;;
  }

  dimension: nib2360_e047 {
    type: number
    sql: ${TABLE}.nib2360_E047 ;;
  }

  dimension: nib2360_e048 {
    type: number
    sql: ${TABLE}.nib2360_E048 ;;
  }

  dimension: nib2360_e049 {
    type: number
    sql: ${TABLE}.nib2360_E049 ;;
  }

  dimension: nib2360_e050 {
    type: number
    sql: ${TABLE}.nib2360_E050 ;;
  }

  dimension: nib2360_e051 {
    type: number
    sql: ${TABLE}.nib2360_E051 ;;
  }

  dimension: nib2360_e052 {
    type: number
    sql: ${TABLE}.nib2360_E052 ;;
  }

  dimension: nib2360_e053 {
    type: number
    sql: ${TABLE}.nib2360_E053 ;;
  }

  dimension: nib2360_e054 {
    type: number
    sql: ${TABLE}.nib2360_E054 ;;
  }

  dimension: nib2360_e055 {
    type: number
    sql: ${TABLE}.nib2360_E055 ;;
  }

  dimension: nib2360_e056 {
    type: number
    sql: ${TABLE}.nib2360_E056 ;;
  }

  dimension: nib2360_e057 {
    type: number
    sql: ${TABLE}.nib2360_E057 ;;
  }

  dimension: nib2360_e058 {
    type: number
    sql: ${TABLE}.nib2360_E058 ;;
  }

  dimension: nib2360_e059 {
    type: number
    sql: ${TABLE}.nib2360_E059 ;;
  }

  dimension: nib2360_e060 {
    type: number
    sql: ${TABLE}.nib2360_E060 ;;
  }

  dimension: nib2360_e061 {
    type: number
    sql: ${TABLE}.nib2360_E061 ;;
  }

  dimension: nib2360_e062 {
    type: number
    sql: ${TABLE}.nib2360_E062 ;;
  }

  dimension: nib2360_e063 {
    type: number
    sql: ${TABLE}.nib2360_E063 ;;
  }

  dimension: nib2360_e064 {
    type: number
    sql: ${TABLE}.nib2360_E064 ;;
  }

  dimension: nib2360_e065 {
    type: number
    sql: ${TABLE}.nib2360_E065 ;;
  }

  dimension: nib2360_e066 {
    type: number
    sql: ${TABLE}.nib2360_E066 ;;
  }

  dimension: nib2360_e067 {
    type: number
    sql: ${TABLE}.nib2360_E067 ;;
  }

  dimension: nib2360_e068 {
    type: number
    sql: ${TABLE}.nib2360_E068 ;;
  }

  dimension: nib2360_e069 {
    type: number
    sql: ${TABLE}.nib2360_E069 ;;
  }

  dimension: nib2360_e070 {
    type: number
    sql: ${TABLE}.nib2360_E070 ;;
  }

  dimension: nib2360_e071 {
    type: number
    sql: ${TABLE}.nib2360_E071 ;;
  }

  dimension: nib2360_e072 {
    type: number
    sql: ${TABLE}.nib2360_E072 ;;
  }

  dimension: nib2360_e073 {
    type: number
    sql: ${TABLE}.nib2360_E073 ;;
  }

  dimension: nib2360_e074 {
    type: number
    sql: ${TABLE}.nib2360_E074 ;;
  }

  dimension: nib2360_e075 {
    type: number
    sql: ${TABLE}.nib2360_E075 ;;
  }

  dimension: nib2360_e076 {
    type: number
    sql: ${TABLE}.nib2360_E076 ;;
  }

  dimension: nib2360_e077 {
    type: number
    sql: ${TABLE}.nib2360_E077 ;;
  }

  dimension: nib2360_e078 {
    type: number
    sql: ${TABLE}.nib2360_E078 ;;
  }

  dimension: nib2360_e079 {
    type: number
    sql: ${TABLE}.nib2360_E079 ;;
  }

  dimension: nib2360_e080 {
    type: number
    sql: ${TABLE}.nib2360_E080 ;;
  }

  dimension: nib2360_e081 {
    type: number
    sql: ${TABLE}.nib2360_E081 ;;
  }

  dimension: nib2360_e082 {
    type: number
    sql: ${TABLE}.nib2360_E082 ;;
  }

  dimension: nib2360_e083 {
    type: number
    sql: ${TABLE}.nib2360_E083 ;;
  }

  dimension: nib2360_e084 {
    type: number
    sql: ${TABLE}.nib2360_E084 ;;
  }

  dimension: nib2360_e085 {
    type: number
    sql: ${TABLE}.nib2360_E085 ;;
  }

  dimension: nib2360_e086 {
    type: number
    sql: ${TABLE}.nib2360_E086 ;;
  }

  dimension: nib2360_e087 {
    type: number
    sql: ${TABLE}.nib2360_E087 ;;
  }

  dimension: nib2360_e088 {
    type: number
    sql: ${TABLE}.nib2360_E088 ;;
  }

  dimension: nib2360_e089 {
    type: number
    sql: ${TABLE}.nib2360_E089 ;;
  }

  dimension: nib2360_e090 {
    type: number
    sql: ${TABLE}.nib2360_E090 ;;
  }

  dimension: nib2360_e091 {
    type: number
    sql: ${TABLE}.nib2360_E091 ;;
  }

  dimension: nib2360_e092 {
    type: number
    sql: ${TABLE}.nib2360_E092 ;;
  }

  dimension: nib2360_e093 {
    type: number
    sql: ${TABLE}.nib2360_E093 ;;
  }

  dimension: nib2360_e094 {
    type: number
    sql: ${TABLE}.nib2360_E094 ;;
  }

  dimension: nib2360_e095 {
    type: number
    sql: ${TABLE}.nib2360_E095 ;;
  }

  dimension: nib2360_e096 {
    type: number
    sql: ${TABLE}.nib2360_E096 ;;
  }

  dimension: nib2360_e097 {
    type: number
    sql: ${TABLE}.nib2360_E097 ;;
  }

  dimension: nib2360_e098 {
    type: number
    sql: ${TABLE}.nib2360_E098 ;;
  }

  dimension: nib2360_e099 {
    type: number
    sql: ${TABLE}.nib2360_E099 ;;
  }

  dimension: nib2360_e100 {
    type: number
    sql: ${TABLE}.nib2360_E100 ;;
  }

  dimension: nib2360_e101 {
    type: number
    sql: ${TABLE}.nib2360_E101 ;;
  }

  dimension: nib2360_e102 {
    type: number
    sql: ${TABLE}.nib2360_E102 ;;
  }

  dimension: nib2360_e103 {
    type: number
    sql: ${TABLE}.nib2360_E103 ;;
  }

  dimension: nib2360_e104 {
    type: number
    sql: ${TABLE}.nib2360_E104 ;;
  }

  dimension: nib2360_e105 {
    type: number
    sql: ${TABLE}.nib2360_E105 ;;
  }

  dimension: nib2360_e106 {
    type: number
    sql: ${TABLE}.nib2360_E106 ;;
  }

  dimension: nib2360_f000 {
    type: number
    sql: ${TABLE}.nib2360_F000 ;;
  }

  dimension: nib2360_f001 {
    type: number
    sql: ${TABLE}.nib2360_F001 ;;
  }

  dimension: nib2360_f002 {
    type: number
    sql: ${TABLE}.nib2360_F002 ;;
  }

  dimension: nib2360_f003 {
    type: number
    sql: ${TABLE}.nib2360_F003 ;;
  }

  dimension: nib2360_f004 {
    type: number
    sql: ${TABLE}.nib2360_F004 ;;
  }

  dimension: nib2360_f005 {
    type: number
    sql: ${TABLE}.nib2360_F005 ;;
  }

  dimension: nib2360_f006 {
    type: number
    sql: ${TABLE}.nib2360_F006 ;;
  }

  dimension: nib2360_f007 {
    type: number
    sql: ${TABLE}.nib2360_F007 ;;
  }

  dimension: nib2360_f008 {
    type: number
    sql: ${TABLE}.nib2360_F008 ;;
  }

  dimension: nib2360_f009 {
    type: number
    sql: ${TABLE}.nib2360_F009 ;;
  }

  dimension: nib2360_f010 {
    type: number
    sql: ${TABLE}.nib2360_F010 ;;
  }

  dimension: nib2360_f011 {
    type: number
    sql: ${TABLE}.nib2360_F011 ;;
  }

  dimension: nib2360_f012 {
    type: number
    sql: ${TABLE}.nib2360_F012 ;;
  }

  dimension: nib2360_f013 {
    type: number
    sql: ${TABLE}.nib2360_F013 ;;
  }

  dimension: nib2360_f014 {
    type: number
    sql: ${TABLE}.nib2360_F014 ;;
  }

  dimension: nib2360_f015 {
    type: number
    sql: ${TABLE}.nib2360_F015 ;;
  }

  dimension: nib2360_f016 {
    type: number
    sql: ${TABLE}.nib2360_F016 ;;
  }

  dimension: nib2360_f017 {
    type: number
    sql: ${TABLE}.nib2360_F017 ;;
  }

  dimension: nib2360_f018 {
    type: number
    sql: ${TABLE}.nib2360_F018 ;;
  }

  dimension: nib2360_f019 {
    type: number
    sql: ${TABLE}.nib2360_F019 ;;
  }

  dimension: nib2360_g001 {
    type: number
    sql: ${TABLE}.nib2360_G001 ;;
  }

  dimension: nib2360_g002 {
    type: number
    sql: ${TABLE}.nib2360_G002 ;;
  }

  dimension: nib2360_g003 {
    type: number
    sql: ${TABLE}.nib2360_G003 ;;
  }

  dimension: nib2360_g004 {
    type: number
    sql: ${TABLE}.nib2360_G004 ;;
  }

  dimension: nib2360_h001 {
    type: number
    sql: ${TABLE}.nib2360_H001 ;;
  }

  dimension: nib2360_i000 {
    type: number
    sql: ${TABLE}.nib2360_I000 ;;
  }

  dimension: nib2360_i001 {
    type: number
    sql: ${TABLE}.nib2360_I001 ;;
  }

  dimension: nib2360_k000 {
    type: number
    sql: ${TABLE}.nib2360_K000 ;;
  }

  dimension: nib2360_k001 {
    type: number
    sql: ${TABLE}.nib2360_K001 ;;
  }

  dimension: nib2360_k002 {
    type: number
    sql: ${TABLE}.nib2360_K002 ;;
  }

  dimension: nib2360_k003 {
    type: number
    sql: ${TABLE}.nib2360_K003 ;;
  }

  dimension: nib2360_k004 {
    type: number
    sql: ${TABLE}.nib2360_K004 ;;
  }

  dimension: nib2360_k005 {
    type: number
    sql: ${TABLE}.nib2360_K005 ;;
  }

  dimension: nib2360_k006 {
    type: number
    sql: ${TABLE}.nib2360_K006 ;;
  }

  dimension: nib2360_k007 {
    type: number
    sql: ${TABLE}.nib2360_K007 ;;
  }

  dimension: nib2360_l001 {
    type: number
    sql: ${TABLE}.nib2360_L001 ;;
  }

  dimension: nib2360_l002 {
    type: number
    sql: ${TABLE}.nib2360_L002 ;;
  }

  dimension: nib2360_l003 {
    type: number
    sql: ${TABLE}.nib2360_L003 ;;
  }

  dimension: nib2360_l004 {
    type: number
    sql: ${TABLE}.nib2360_L004 ;;
  }

  dimension: nib2360_l005 {
    type: number
    sql: ${TABLE}.nib2360_L005 ;;
  }

  dimension: nib2360_l006 {
    type: number
    sql: ${TABLE}.nib2360_L006 ;;
  }

  dimension: nib2360_l007 {
    type: number
    sql: ${TABLE}.nib2360_L007 ;;
  }

  dimension: nib2360_m001 {
    type: number
    sql: ${TABLE}.nib2360_M001 ;;
  }

  dimension: nib2360_m002 {
    type: number
    sql: ${TABLE}.nib2360_M002 ;;
  }

  dimension: nib2360_m003 {
    type: number
    sql: ${TABLE}.nib2360_M003 ;;
  }

  dimension: nib2360_n000 {
    type: number
    sql: ${TABLE}.nib2360_N000 ;;
  }

  dimension: nib2360_n001 {
    type: number
    sql: ${TABLE}.nib2360_N001 ;;
  }

  dimension: nib2360_n002 {
    type: number
    sql: ${TABLE}.nib2360_N002 ;;
  }

  dimension: nib2360_n003 {
    type: number
    sql: ${TABLE}.nib2360_N003 ;;
  }

  dimension: nib2360_n004 {
    type: number
    sql: ${TABLE}.nib2360_N004 ;;
  }

  dimension: nib2360_p000 {
    type: number
    sql: ${TABLE}.nib2360_P000 ;;
  }

  dimension: nib2360_p001 {
    type: number
    sql: ${TABLE}.nib2360_P001 ;;
  }

  dimension: nib2360_p002 {
    type: number
    sql: ${TABLE}.nib2360_P002 ;;
  }

  dimension: nib2360_p003 {
    type: number
    sql: ${TABLE}.nib2360_P003 ;;
  }

  dimension: nib2360_p004 {
    type: number
    sql: ${TABLE}.nib2360_P004 ;;
  }

  dimension: nib2360_p005 {
    type: number
    sql: ${TABLE}.nib2360_P005 ;;
  }

  dimension: nib2360_p006 {
    type: number
    sql: ${TABLE}.nib2360_P006 ;;
  }

  dimension: nib2360_p007 {
    type: number
    sql: ${TABLE}.nib2360_P007 ;;
  }

  dimension: nib2360_p008 {
    type: number
    sql: ${TABLE}.nib2360_P008 ;;
  }

  dimension: nib2360_p009 {
    type: number
    sql: ${TABLE}.nib2360_P009 ;;
  }

  dimension: nib2360_p010 {
    type: number
    sql: ${TABLE}.nib2360_P010 ;;
  }

  dimension: nib2360_q001 {
    type: number
    sql: ${TABLE}.nib2360_Q001 ;;
  }

  dimension: nib2360_r001 {
    type: number
    sql: ${TABLE}.nib2360_R001 ;;
  }

  dimension: nib2360_s001 {
    type: number
    sql: ${TABLE}.nib2360_S001 ;;
  }

  dimension: nib2361 {
    type: string
    sql: ${TABLE}.nib2361 ;;
  }

  dimension: nib2362 {
    type: string
    sql: ${TABLE}.nib2362 ;;
  }

  dimension: nib2363 {
    type: string
    sql: ${TABLE}.nib2363 ;;
  }

  dimension: nib2364 {
    type: string
    sql: ${TABLE}.nib2364 ;;
  }

  dimension: nib2365 {
    type: string
    sql: ${TABLE}.nib2365 ;;
  }

  dimension: nib2366 {
    type: string
    sql: ${TABLE}.nib2366 ;;
  }

  dimension: nib2367 {
    type: string
    sql: ${TABLE}.nib2367 ;;
  }

  dimension: nib2368 {
    type: string
    sql: ${TABLE}.nib2368 ;;
  }

  dimension: nib2369 {
    type: string
    sql: ${TABLE}.nib2369 ;;
  }

  dimension: nib2370 {
    type: string
    sql: ${TABLE}.nib2370 ;;
  }

  dimension: nib2371 {
    type: string
    sql: ${TABLE}.nib2371 ;;
  }

  dimension: nib2372 {
    type: string
    sql: ${TABLE}.nib2372 ;;
  }

  dimension: nib2373 {
    type: string
    sql: ${TABLE}.nib2373 ;;
  }

  dimension: nib2507_01 {
    type: number
    sql: ${TABLE}.nib2507_01 ;;
  }

  dimension: nib2507_02 {
    type: number
    sql: ${TABLE}.nib2507_02 ;;
  }

  dimension: nib2509 {
    type: number
    sql: ${TABLE}.nib2509 ;;
  }

  dimension: nib2510 {
    type: number
    sql: ${TABLE}.nib2510 ;;
  }

  dimension: nib2522_01 {
    type: number
    sql: ${TABLE}.nib2522_01 ;;
  }

  dimension: nib2522_02 {
    type: number
    sql: ${TABLE}.nib2522_02 ;;
  }

  dimension: nib2524_01 {
    type: number
    sql: ${TABLE}.nib2524_01 ;;
  }

  dimension: nib2524_02 {
    type: number
    sql: ${TABLE}.nib2524_02 ;;
  }

  dimension: nib2526 {
    type: string
    sql: ${TABLE}.nib2526 ;;
  }

  dimension: nib2527 {
    type: number
    sql: ${TABLE}.nib2527 ;;
  }

  dimension: nib2529 {
    type: number
    sql: ${TABLE}.nib2529 ;;
  }

  dimension: nib2531_01 {
    type: number
    sql: ${TABLE}.nib2531_01 ;;
  }

  dimension: nib2531_02 {
    type: number
    sql: ${TABLE}.nib2531_02 ;;
  }

  dimension: nib2532_01 {
    type: number
    sql: ${TABLE}.nib2532_01 ;;
  }

  dimension: nib2532_02 {
    type: number
    sql: ${TABLE}.nib2532_02 ;;
  }

  dimension: nib2751 {
    type: string
    sql: ${TABLE}.nib2751 ;;
  }

  dimension: nib2752 {
    type: string
    sql: ${TABLE}.nib2752 ;;
  }

  dimension: nib2753 {
    type: string
    sql: ${TABLE}.nib2753 ;;
  }

  dimension: nib2754 {
    type: string
    sql: ${TABLE}.nib2754 ;;
  }

  dimension: nib2755 {
    type: string
    sql: ${TABLE}.nib2755 ;;
  }

  dimension: nib2756 {
    type: string
    sql: ${TABLE}.nib2756 ;;
  }

  dimension: nib2757 {
    type: string
    sql: ${TABLE}.nib2757 ;;
  }

  dimension: nib2758 {
    type: string
    sql: ${TABLE}.nib2758 ;;
  }

  dimension: nib2759 {
    type: string
    sql: ${TABLE}.nib2759 ;;
  }

  dimension: nib2760 {
    type: string
    sql: ${TABLE}.nib2760 ;;
  }

  dimension: nib2761 {
    type: string
    sql: ${TABLE}.nib2761 ;;
  }

  dimension: nib2762 {
    type: string
    sql: ${TABLE}.nib2762 ;;
  }

  dimension: nib2763 {
    type: string
    sql: ${TABLE}.nib2763 ;;
  }

  dimension: nib2764 {
    type: string
    sql: ${TABLE}.nib2764 ;;
  }

  dimension: nib2765 {
    type: string
    sql: ${TABLE}.nib2765 ;;
  }

  dimension: nib2766 {
    type: string
    sql: ${TABLE}.nib2766 ;;
  }

  dimension: nib2767 {
    type: string
    sql: ${TABLE}.nib2767 ;;
  }

  dimension: nib2768 {
    type: string
    sql: ${TABLE}.nib2768 ;;
  }

  dimension: nib2769 {
    type: string
    sql: ${TABLE}.nib2769 ;;
  }

  dimension: nib2770 {
    type: string
    sql: ${TABLE}.nib2770 ;;
  }

  dimension: nib2771 {
    type: string
    sql: ${TABLE}.nib2771 ;;
  }

  dimension: nib2772 {
    type: string
    sql: ${TABLE}.nib2772 ;;
  }

  dimension: nib2773 {
    type: string
    sql: ${TABLE}.nib2773 ;;
  }

  dimension: nib2774 {
    type: string
    sql: ${TABLE}.nib2774 ;;
  }

  dimension: nib2778 {
    type: string
    sql: ${TABLE}.nib2778 ;;
  }

  dimension: nib2779 {
    type: string
    sql: ${TABLE}.nib2779 ;;
  }

  dimension: nib2780 {
    type: string
    sql: ${TABLE}.nib2780 ;;
  }

  dimension: nib2781 {
    type: string
    sql: ${TABLE}.nib2781 ;;
  }

  dimension: nib2800 {
    type: string
    sql: ${TABLE}.nib2800 ;;
  }

  dimension: nib2807_a {
    type: number
    sql: ${TABLE}.nib2807_A ;;
  }

  dimension: nib2807_b {
    type: number
    sql: ${TABLE}.nib2807_B ;;
  }

  dimension: nib2807_c {
    type: number
    sql: ${TABLE}.nib2807_C ;;
  }

  dimension: nib2807_d {
    type: number
    sql: ${TABLE}.nib2807_D ;;
  }

  dimension: nib2807_e {
    type: number
    sql: ${TABLE}.nib2807_E ;;
  }

  dimension: nib2807_f {
    type: number
    sql: ${TABLE}.nib2807_F ;;
  }

  dimension: nib2807_m {
    type: number
    sql: ${TABLE}.nib2807_M ;;
  }

  dimension: nib2807_o {
    type: number
    sql: ${TABLE}.nib2807_O ;;
  }

  dimension: nib2807_p {
    type: number
    sql: ${TABLE}.nib2807_P ;;
  }

  dimension: nib2807_s {
    type: number
    sql: ${TABLE}.nib2807_S ;;
  }

  dimension: nib2810 {
    type: number
    sql: ${TABLE}.nib2810 ;;
  }

  dimension: nib2860 {
    type: number
    sql: ${TABLE}.nib2860 ;;
  }

  dimension: nib2861 {
    type: number
    sql: ${TABLE}.nib2861 ;;
  }

  dimension: nib2862 {
    type: number
    sql: ${TABLE}.nib2862 ;;
  }

  dimension: nib2863 {
    type: number
    sql: ${TABLE}.nib2863 ;;
  }

  dimension: nib2864 {
    type: number
    sql: ${TABLE}.nib2864 ;;
  }

  dimension: nib2865 {
    type: number
    sql: ${TABLE}.nib2865 ;;
  }

  dimension: nib2866 {
    type: number
    sql: ${TABLE}.nib2866 ;;
  }

  dimension: nib2867 {
    type: number
    sql: ${TABLE}.nib2867 ;;
  }

  dimension: nib2868 {
    type: number
    sql: ${TABLE}.nib2868 ;;
  }

  dimension: nib2869 {
    type: number
    sql: ${TABLE}.nib2869 ;;
  }

  dimension: nib2870 {
    type: number
    sql: ${TABLE}.nib2870 ;;
  }

  dimension: nib2871 {
    type: number
    sql: ${TABLE}.nib2871 ;;
  }

  dimension: nib2872 {
    type: number
    sql: ${TABLE}.nib2872 ;;
  }

  dimension: nib2873 {
    type: number
    sql: ${TABLE}.nib2873 ;;
  }

  dimension: nib2874 {
    type: number
    sql: ${TABLE}.nib2874 ;;
  }

  dimension: nib2875 {
    type: number
    sql: ${TABLE}.nib2875 ;;
  }

  dimension: nib2876 {
    type: number
    sql: ${TABLE}.nib2876 ;;
  }

  dimension: nib2877 {
    type: number
    sql: ${TABLE}.nib2877 ;;
  }

  dimension: nib2878 {
    type: number
    sql: ${TABLE}.nib2878 ;;
  }

  dimension: nib2879 {
    type: number
    sql: ${TABLE}.nib2879 ;;
  }

  dimension: nib2880 {
    type: number
    sql: ${TABLE}.nib2880 ;;
  }

  dimension: nib2881 {
    type: number
    sql: ${TABLE}.nib2881 ;;
  }

  dimension: nib2882 {
    type: number
    sql: ${TABLE}.nib2882 ;;
  }

  dimension: nib2883 {
    type: number
    sql: ${TABLE}.nib2883 ;;
  }

  dimension: nib2884 {
    type: number
    sql: ${TABLE}.nib2884 ;;
  }

  dimension: nib2885 {
    type: number
    sql: ${TABLE}.nib2885 ;;
  }

  dimension: nib2886 {
    type: number
    sql: ${TABLE}.nib2886 ;;
  }

  dimension: nib2887 {
    type: number
    sql: ${TABLE}.nib2887 ;;
  }

  dimension: nib2888 {
    type: number
    sql: ${TABLE}.nib2888 ;;
  }

  dimension: nib2889 {
    type: number
    sql: ${TABLE}.nib2889 ;;
  }

  dimension: nib2890 {
    type: number
    sql: ${TABLE}.nib2890 ;;
  }

  dimension: nib2891 {
    type: number
    sql: ${TABLE}.nib2891 ;;
  }

  dimension: nib2892 {
    type: number
    sql: ${TABLE}.nib2892 ;;
  }

  dimension: nib2897 {
    type: string
    sql: ${TABLE}.nib2897 ;;
  }

  dimension: nib3101_a {
    type: number
    sql: ${TABLE}.nib3101_A ;;
  }

  dimension: nib3101_b {
    type: number
    sql: ${TABLE}.nib3101_B ;;
  }

  dimension: nib3101_h {
    type: number
    sql: ${TABLE}.nib3101_H ;;
  }

  dimension: nib3101_w {
    type: number
    sql: ${TABLE}.nib3101_W ;;
  }

  dimension: nib3102_10 {
    type: number
    sql: ${TABLE}.nib3102_10 ;;
  }

  dimension: nib3102_11 {
    type: number
    sql: ${TABLE}.nib3102_11 ;;
  }

  dimension: nib3102_12 {
    type: number
    sql: ${TABLE}.nib3102_12 ;;
  }

  dimension: nib3102_13 {
    type: number
    sql: ${TABLE}.nib3102_13 ;;
  }

  dimension: nib3102_14 {
    type: number
    sql: ${TABLE}.nib3102_14 ;;
  }

  dimension: nib3102_15 {
    type: number
    sql: ${TABLE}.nib3102_15 ;;
  }

  dimension: nib3102_16 {
    type: number
    sql: ${TABLE}.nib3102_16 ;;
  }

  dimension: nib3102_17 {
    type: number
    sql: ${TABLE}.nib3102_17 ;;
  }

  dimension: nib3102_18 {
    type: number
    sql: ${TABLE}.nib3102_18 ;;
  }

  dimension: nib3102_19 {
    type: number
    sql: ${TABLE}.nib3102_19 ;;
  }

  dimension: nib3102_1_a {
    type: number
    sql: ${TABLE}.nib3102_1A ;;
  }

  dimension: nib3102_1_b {
    type: number
    sql: ${TABLE}.nib3102_1B ;;
  }

  dimension: nib3102_20 {
    type: number
    sql: ${TABLE}.nib3102_20 ;;
  }

  dimension: nib3102_30 {
    type: number
    sql: ${TABLE}.nib3102_30 ;;
  }

  dimension: nib3102_40 {
    type: number
    sql: ${TABLE}.nib3102_40 ;;
  }

  dimension: nib3102_41 {
    type: number
    sql: ${TABLE}.nib3102_41 ;;
  }

  dimension: nib3102_42 {
    type: number
    sql: ${TABLE}.nib3102_42 ;;
  }

  dimension: nib3102_43 {
    type: number
    sql: ${TABLE}.nib3102_43 ;;
  }

  dimension: nib3102_44 {
    type: number
    sql: ${TABLE}.nib3102_44 ;;
  }

  dimension: nib3102_45 {
    type: number
    sql: ${TABLE}.nib3102_45 ;;
  }

  dimension: nib3102_46 {
    type: number
    sql: ${TABLE}.nib3102_46 ;;
  }

  dimension: nib3102_47 {
    type: number
    sql: ${TABLE}.nib3102_47 ;;
  }

  dimension: nib3102_48 {
    type: number
    sql: ${TABLE}.nib3102_48 ;;
  }

  dimension: nib3102_49 {
    type: number
    sql: ${TABLE}.nib3102_49 ;;
  }

  dimension: nib3102_4_a {
    type: number
    sql: ${TABLE}.nib3102_4A ;;
  }

  dimension: nib3102_4_b {
    type: number
    sql: ${TABLE}.nib3102_4B ;;
  }

  dimension: nib3102_4_c {
    type: number
    sql: ${TABLE}.nib3102_4C ;;
  }

  dimension: nib3102_4_d {
    type: number
    sql: ${TABLE}.nib3102_4D ;;
  }

  dimension: nib3102_4_e {
    type: number
    sql: ${TABLE}.nib3102_4E ;;
  }

  dimension: nib3102_4_f {
    type: number
    sql: ${TABLE}.nib3102_4F ;;
  }

  dimension: nib3102_4_g {
    type: number
    sql: ${TABLE}.nib3102_4G ;;
  }

  dimension: nib3102_4_h {
    type: number
    sql: ${TABLE}.nib3102_4H ;;
  }

  dimension: nib3102_4_i {
    type: number
    sql: ${TABLE}.nib3102_4I ;;
  }

  dimension: nib3102_4_j {
    type: number
    sql: ${TABLE}.nib3102_4J ;;
  }

  dimension: nib3102_4_k {
    type: number
    sql: ${TABLE}.nib3102_4K ;;
  }

  dimension: nib3102_4_l {
    type: number
    sql: ${TABLE}.nib3102_4L ;;
  }

  dimension: nib3102_4_m {
    type: number
    sql: ${TABLE}.nib3102_4M ;;
  }

  dimension: nib3102_4_n {
    type: number
    sql: ${TABLE}.nib3102_4N ;;
  }

  dimension: nib3102_4_o {
    type: number
    sql: ${TABLE}.nib3102_4O ;;
  }

  dimension: nib3102_4_p {
    type: number
    sql: ${TABLE}.nib3102_4P ;;
  }

  dimension: nib3102_4_q {
    type: number
    sql: ${TABLE}.nib3102_4Q ;;
  }

  dimension: nib3102_4_r {
    type: number
    sql: ${TABLE}.nib3102_4R ;;
  }

  dimension: nib3102_4_s {
    type: number
    sql: ${TABLE}.nib3102_4S ;;
  }

  dimension: nib3102_4_t {
    type: number
    sql: ${TABLE}.nib3102_4T ;;
  }

  dimension: nib3102_4_u {
    type: number
    sql: ${TABLE}.nib3102_4U ;;
  }

  dimension: nib3102_4_v {
    type: number
    sql: ${TABLE}.nib3102_4V ;;
  }

  dimension: nib3102_4_w {
    type: number
    sql: ${TABLE}.nib3102_4W ;;
  }

  dimension: nib3102_4_x {
    type: number
    sql: ${TABLE}.nib3102_4X ;;
  }

  dimension: nib3102_4_y {
    type: number
    sql: ${TABLE}.nib3102_4Y ;;
  }

  dimension: nib3102_4_z {
    type: number
    sql: ${TABLE}.nib3102_4Z ;;
  }

  dimension: nib3102_51 {
    type: number
    sql: ${TABLE}.nib3102_51 ;;
  }

  dimension: nib3102_52 {
    type: number
    sql: ${TABLE}.nib3102_52 ;;
  }

  dimension: nib3102_53 {
    type: number
    sql: ${TABLE}.nib3102_53 ;;
  }

  dimension: nib3102_54 {
    type: number
    sql: ${TABLE}.nib3102_54 ;;
  }

  dimension: nib3102_55 {
    type: number
    sql: ${TABLE}.nib3102_55 ;;
  }

  dimension: nib3102_56 {
    type: number
    sql: ${TABLE}.nib3102_56 ;;
  }

  dimension: nib3102_57 {
    type: number
    sql: ${TABLE}.nib3102_57 ;;
  }

  dimension: nib3102_58 {
    type: number
    sql: ${TABLE}.nib3102_58 ;;
  }

  dimension: nib3102_59 {
    type: number
    sql: ${TABLE}.nib3102_59 ;;
  }

  dimension: nib3102_5_a {
    type: number
    sql: ${TABLE}.nib3102_5A ;;
  }

  dimension: nib3102_5_b {
    type: number
    sql: ${TABLE}.nib3102_5B ;;
  }

  dimension: nib3102_5_c {
    type: number
    sql: ${TABLE}.nib3102_5C ;;
  }

  dimension: nib3102_5_d {
    type: number
    sql: ${TABLE}.nib3102_5D ;;
  }

  dimension: nib3102_5_e {
    type: number
    sql: ${TABLE}.nib3102_5E ;;
  }

  dimension: nib3103_b {
    type: number
    sql: ${TABLE}.nib3103_B ;;
  }

  dimension: nib3103_e {
    type: number
    sql: ${TABLE}.nib3103_E ;;
  }

  dimension: nib3103_s {
    type: number
    sql: ${TABLE}.nib3103_S ;;
  }

  dimension: nib3103_x {
    type: number
    sql: ${TABLE}.nib3103_X ;;
  }

  dimension: nib3446 {
    type: string
    sql: ${TABLE}.nib3446 ;;
  }

  dimension: nib3447 {
    type: string
    sql: ${TABLE}.nib3447 ;;
  }

  dimension: nib3448 {
    type: string
    sql: ${TABLE}.nib3448 ;;
  }

  dimension: nib3587 {
    type: string
    sql: ${TABLE}.nib3587 ;;
  }

  dimension: nib3588 {
    type: string
    sql: ${TABLE}.nib3588 ;;
  }

  dimension: nib3589 {
    type: string
    sql: ${TABLE}.nib3589 ;;
  }

  dimension: nib3590 {
    type: string
    sql: ${TABLE}.nib3590 ;;
  }

  dimension: nib3591 {
    type: string
    sql: ${TABLE}.nib3591 ;;
  }

  dimension: nib3592 {
    type: string
    sql: ${TABLE}.nib3592 ;;
  }

  dimension: nib3593 {
    type: string
    sql: ${TABLE}.nib3593 ;;
  }

  dimension: nib3594 {
    type: string
    sql: ${TABLE}.nib3594 ;;
  }

  dimension: nib3595 {
    type: string
    sql: ${TABLE}.nib3595 ;;
  }

  dimension: nib4000 {
    type: string
    sql: ${TABLE}.nib4000 ;;
  }

  dimension: nib6102 {
    type: string
    sql: ${TABLE}.nib6102 ;;
  }

  dimension: nib6103 {
    type: string
    sql: ${TABLE}.nib6103 ;;
  }

  dimension: nib6104 {
    type: string
    sql: ${TABLE}.nib6104 ;;
  }

  dimension: nib6105 {
    type: string
    sql: ${TABLE}.nib6105 ;;
  }

  dimension: nib6106 {
    type: string
    sql: ${TABLE}.nib6106 ;;
  }

  dimension: nib6107 {
    type: string
    sql: ${TABLE}.nib6107 ;;
  }

  dimension: nib6108 {
    type: string
    sql: ${TABLE}.nib6108 ;;
  }

  dimension: nib6109 {
    type: string
    sql: ${TABLE}.nib6109 ;;
  }

  dimension: nib6110 {
    type: string
    sql: ${TABLE}.nib6110 ;;
  }

  dimension: nib6111 {
    type: string
    sql: ${TABLE}.nib6111 ;;
  }

  dimension: nib6112 {
    type: string
    sql: ${TABLE}.nib6112 ;;
  }

  dimension: nib6113 {
    type: string
    sql: ${TABLE}.nib6113 ;;
  }

  dimension: nib6114 {
    type: string
    sql: ${TABLE}.nib6114 ;;
  }

  dimension: nib6115 {
    type: string
    sql: ${TABLE}.nib6115 ;;
  }

  dimension: nib6116 {
    type: string
    sql: ${TABLE}.nib6116 ;;
  }

  dimension: nib6117 {
    type: string
    sql: ${TABLE}.nib6117 ;;
  }

  dimension: nib6118 {
    type: string
    sql: ${TABLE}.nib6118 ;;
  }

  dimension: nib6119 {
    type: string
    sql: ${TABLE}.nib6119 ;;
  }

  dimension: nib6121 {
    type: string
    sql: ${TABLE}.nib6121 ;;
  }

  dimension: nib6122 {
    type: string
    sql: ${TABLE}.nib6122 ;;
  }

  dimension: nib6123 {
    type: string
    sql: ${TABLE}.nib6123 ;;
  }

  dimension: nib6124 {
    type: string
    sql: ${TABLE}.nib6124 ;;
  }

  dimension: nib6125 {
    type: string
    sql: ${TABLE}.nib6125 ;;
  }

  dimension: nib6126 {
    type: string
    sql: ${TABLE}.nib6126 ;;
  }

  dimension: nib6127 {
    type: string
    sql: ${TABLE}.nib6127 ;;
  }

  dimension: nib6128 {
    type: string
    sql: ${TABLE}.nib6128 ;;
  }

  dimension: nib6129 {
    type: string
    sql: ${TABLE}.nib6129 ;;
  }

  dimension: nib6130 {
    type: string
    sql: ${TABLE}.nib6130 ;;
  }

  dimension: nib6131 {
    type: string
    sql: ${TABLE}.nib6131 ;;
  }

  dimension: nib6132 {
    type: string
    sql: ${TABLE}.nib6132 ;;
  }

  dimension: nib6134 {
    type: number
    sql: ${TABLE}.nib6134 ;;
  }

  dimension: nib6135 {
    type: number
    sql: ${TABLE}.nib6135 ;;
  }

  dimension: nib6136 {
    type: number
    sql: ${TABLE}.nib6136 ;;
  }

  dimension: nib6137 {
    type: number
    sql: ${TABLE}.nib6137 ;;
  }

  dimension: nib6138 {
    type: number
    sql: ${TABLE}.nib6138 ;;
  }

  dimension: nib6139 {
    type: number
    sql: ${TABLE}.nib6139 ;;
  }

  dimension: nib6140 {
    type: number
    sql: ${TABLE}.nib6140 ;;
  }

  dimension: nib6141 {
    type: number
    sql: ${TABLE}.nib6141 ;;
  }

  dimension: nib6142 {
    type: number
    sql: ${TABLE}.nib6142 ;;
  }

  dimension: nib6143 {
    type: number
    sql: ${TABLE}.nib6143 ;;
  }

  dimension: nib6144 {
    type: number
    sql: ${TABLE}.nib6144 ;;
  }

  dimension: nib6145 {
    type: number
    sql: ${TABLE}.nib6145 ;;
  }

  dimension: nib6146 {
    type: number
    sql: ${TABLE}.nib6146 ;;
  }

  dimension: nib6147 {
    type: number
    sql: ${TABLE}.nib6147 ;;
  }

  dimension: nib6148 {
    type: number
    sql: ${TABLE}.nib6148 ;;
  }

  dimension: nib6149 {
    type: number
    sql: ${TABLE}.nib6149 ;;
  }

  dimension: nib6150 {
    type: number
    sql: ${TABLE}.nib6150 ;;
  }

  dimension: nib6151 {
    type: number
    sql: ${TABLE}.nib6151 ;;
  }

  dimension: nib6152 {
    type: number
    sql: ${TABLE}.nib6152 ;;
  }

  dimension: nib6154 {
    type: number
    sql: ${TABLE}.nib6154 ;;
  }

  dimension: nib6155 {
    type: number
    sql: ${TABLE}.nib6155 ;;
  }

  dimension: nib6156 {
    type: number
    sql: ${TABLE}.nib6156 ;;
  }

  dimension: nib6157 {
    type: number
    sql: ${TABLE}.nib6157 ;;
  }

  dimension: nib6161 {
    type: string
    sql: ${TABLE}.nib6161 ;;
  }

  dimension: nib6162 {
    type: string
    sql: ${TABLE}.nib6162 ;;
  }

  dimension: nib6163 {
    type: string
    sql: ${TABLE}.nib6163 ;;
  }

  dimension: nib6164 {
    type: string
    sql: ${TABLE}.nib6164 ;;
  }

  dimension: nib6165 {
    type: number
    sql: ${TABLE}.nib6165 ;;
  }

  dimension: nib6166 {
    type: number
    sql: ${TABLE}.nib6166 ;;
  }

  dimension: nib6167 {
    type: number
    sql: ${TABLE}.nib6167 ;;
  }

  dimension: nib6168 {
    type: number
    sql: ${TABLE}.nib6168 ;;
  }

  dimension: nib6169 {
    type: number
    sql: ${TABLE}.nib6169 ;;
  }

  dimension: nib6170 {
    type: number
    sql: ${TABLE}.nib6170 ;;
  }

  dimension: nib6171 {
    type: number
    sql: ${TABLE}.nib6171 ;;
  }

  dimension: nib6172 {
    type: number
    sql: ${TABLE}.nib6172 ;;
  }

  dimension: nib6173 {
    type: number
    sql: ${TABLE}.nib6173 ;;
  }

  dimension: nib6174 {
    type: number
    sql: ${TABLE}.nib6174 ;;
  }

  dimension: nib6175 {
    type: number
    sql: ${TABLE}.nib6175 ;;
  }

  dimension: nib6176 {
    type: number
    sql: ${TABLE}.nib6176 ;;
  }

  dimension: nib6177 {
    type: number
    sql: ${TABLE}.nib6177 ;;
  }

  dimension: nib6178 {
    type: number
    sql: ${TABLE}.nib6178 ;;
  }

  dimension: nib6179 {
    type: number
    sql: ${TABLE}.nib6179 ;;
  }

  dimension: nib6180 {
    type: number
    sql: ${TABLE}.nib6180 ;;
  }

  dimension: nib6182 {
    type: number
    sql: ${TABLE}.nib6182 ;;
  }

  dimension: nib6183 {
    type: number
    sql: ${TABLE}.nib6183 ;;
  }

  dimension: nib6184 {
    type: number
    sql: ${TABLE}.nib6184 ;;
  }

  dimension: nib6185 {
    type: number
    sql: ${TABLE}.nib6185 ;;
  }

  dimension: nib6186 {
    type: number
    sql: ${TABLE}.nib6186 ;;
  }

  dimension: nib6187 {
    type: number
    sql: ${TABLE}.nib6187 ;;
  }

  dimension: nib6188 {
    type: number
    sql: ${TABLE}.nib6188 ;;
  }

  dimension: nib6189 {
    type: number
    sql: ${TABLE}.nib6189 ;;
  }

  dimension: nib6190 {
    type: number
    sql: ${TABLE}.nib6190 ;;
  }

  dimension: nib6191 {
    type: number
    sql: ${TABLE}.nib6191 ;;
  }

  dimension: nib6192 {
    type: number
    sql: ${TABLE}.nib6192 ;;
  }

  dimension: nib6193 {
    type: number
    sql: ${TABLE}.nib6193 ;;
  }

  dimension: nib6195 {
    type: number
    sql: ${TABLE}.nib6195 ;;
  }

  dimension: nib6196 {
    type: number
    sql: ${TABLE}.nib6196 ;;
  }

  dimension: nib6197 {
    type: number
    sql: ${TABLE}.nib6197 ;;
  }

  dimension: nib6198 {
    type: number
    sql: ${TABLE}.nib6198 ;;
  }

  dimension: nib6199 {
    type: number
    sql: ${TABLE}.nib6199 ;;
  }

  dimension: nib6200 {
    type: number
    sql: ${TABLE}.nib6200 ;;
  }

  dimension: nib6201 {
    type: number
    sql: ${TABLE}.nib6201 ;;
  }

  dimension: nib6202 {
    type: number
    sql: ${TABLE}.nib6202 ;;
  }

  dimension: nib6203 {
    type: number
    sql: ${TABLE}.nib6203 ;;
  }

  dimension: nib6204 {
    type: number
    sql: ${TABLE}.nib6204 ;;
  }

  dimension: nib6205 {
    type: number
    sql: ${TABLE}.nib6205 ;;
  }

  dimension: nib6206 {
    type: number
    sql: ${TABLE}.nib6206 ;;
  }

  dimension: nib6207 {
    type: number
    sql: ${TABLE}.nib6207 ;;
  }

  dimension: nib6208 {
    type: number
    sql: ${TABLE}.nib6208 ;;
  }

  dimension: nib6209 {
    type: number
    sql: ${TABLE}.nib6209 ;;
  }

  dimension: nib6210 {
    type: number
    sql: ${TABLE}.nib6210 ;;
  }

  dimension: nib6211 {
    type: number
    sql: ${TABLE}.nib6211 ;;
  }

  dimension: nib6212 {
    type: number
    sql: ${TABLE}.nib6212 ;;
  }

  dimension: nib6213 {
    type: number
    sql: ${TABLE}.nib6213 ;;
  }

  dimension: nib6214 {
    type: number
    sql: ${TABLE}.nib6214 ;;
  }

  dimension: nib6215 {
    type: number
    sql: ${TABLE}.nib6215 ;;
  }

  dimension: nib6216 {
    type: number
    sql: ${TABLE}.nib6216 ;;
  }

  dimension: nib6217 {
    type: number
    sql: ${TABLE}.nib6217 ;;
  }

  dimension: nib6220 {
    type: number
    sql: ${TABLE}.nib6220 ;;
  }

  dimension: nib6221 {
    type: number
    sql: ${TABLE}.nib6221 ;;
  }

  dimension: nib6222 {
    type: number
    sql: ${TABLE}.nib6222 ;;
  }

  dimension: nib6223 {
    type: number
    sql: ${TABLE}.nib6223 ;;
  }

  dimension: nib6224 {
    type: number
    sql: ${TABLE}.nib6224 ;;
  }

  dimension: nib6225 {
    type: number
    sql: ${TABLE}.nib6225 ;;
  }

  dimension: nib6226 {
    type: number
    sql: ${TABLE}.nib6226 ;;
  }

  dimension: nib6227 {
    type: number
    sql: ${TABLE}.nib6227 ;;
  }

  dimension: nib6228 {
    type: number
    sql: ${TABLE}.nib6228 ;;
  }

  dimension: nib6229 {
    type: number
    sql: ${TABLE}.nib6229 ;;
  }

  dimension: nib6230 {
    type: number
    sql: ${TABLE}.nib6230 ;;
  }

  dimension: nib6231 {
    type: number
    sql: ${TABLE}.nib6231 ;;
  }

  dimension: nib6232 {
    type: number
    sql: ${TABLE}.nib6232 ;;
  }

  dimension: nib6233 {
    type: number
    sql: ${TABLE}.nib6233 ;;
  }

  dimension: nib6234 {
    type: number
    sql: ${TABLE}.nib6234 ;;
  }

  dimension: nib6235 {
    type: number
    sql: ${TABLE}.nib6235 ;;
  }

  dimension: nib6236 {
    type: number
    sql: ${TABLE}.nib6236 ;;
  }

  dimension: nib6237 {
    type: number
    sql: ${TABLE}.nib6237 ;;
  }

  dimension: nib6239 {
    type: number
    sql: ${TABLE}.nib6239 ;;
  }

  dimension: nib6240 {
    type: number
    sql: ${TABLE}.nib6240 ;;
  }

  dimension: nib6241 {
    type: number
    sql: ${TABLE}.nib6241 ;;
  }

  dimension: nib6242 {
    type: number
    sql: ${TABLE}.nib6242 ;;
  }

  dimension: nib6243 {
    type: number
    sql: ${TABLE}.nib6243 ;;
  }

  dimension: nib6244 {
    type: number
    sql: ${TABLE}.nib6244 ;;
  }

  dimension: nib6245 {
    type: number
    sql: ${TABLE}.nib6245 ;;
  }

  dimension: nib6246 {
    type: number
    sql: ${TABLE}.nib6246 ;;
  }

  dimension: nib6247 {
    type: number
    sql: ${TABLE}.nib6247 ;;
  }

  dimension: nib6248 {
    type: number
    sql: ${TABLE}.nib6248 ;;
  }

  dimension: nib6249 {
    type: number
    sql: ${TABLE}.nib6249 ;;
  }

  dimension: nib6250 {
    type: number
    sql: ${TABLE}.nib6250 ;;
  }

  dimension: nib6251 {
    type: number
    sql: ${TABLE}.nib6251 ;;
  }

  dimension: nib6252 {
    type: number
    sql: ${TABLE}.nib6252 ;;
  }

  dimension: nib6253 {
    type: number
    sql: ${TABLE}.nib6253 ;;
  }

  dimension: nib6254 {
    type: number
    sql: ${TABLE}.nib6254 ;;
  }

  dimension: nib6255 {
    type: number
    sql: ${TABLE}.nib6255 ;;
  }

  dimension: nib6256 {
    type: number
    sql: ${TABLE}.nib6256 ;;
  }

  dimension: nib6257 {
    type: number
    sql: ${TABLE}.nib6257 ;;
  }

  dimension: nib6258 {
    type: number
    sql: ${TABLE}.nib6258 ;;
  }

  dimension: nib6259 {
    type: number
    sql: ${TABLE}.nib6259 ;;
  }

  dimension: nib6260 {
    type: number
    sql: ${TABLE}.nib6260 ;;
  }

  dimension: nib6261 {
    type: number
    sql: ${TABLE}.nib6261 ;;
  }

  dimension: nib6262 {
    type: number
    sql: ${TABLE}.nib6262 ;;
  }

  dimension: nib6263 {
    type: number
    sql: ${TABLE}.nib6263 ;;
  }

  dimension: nib6265 {
    type: number
    sql: ${TABLE}.nib6265 ;;
  }

  dimension: nib6266 {
    type: number
    sql: ${TABLE}.nib6266 ;;
  }

  dimension: nib6267 {
    type: number
    sql: ${TABLE}.nib6267 ;;
  }

  dimension: nib6268 {
    type: number
    sql: ${TABLE}.nib6268 ;;
  }

  dimension: nib6269 {
    type: number
    sql: ${TABLE}.nib6269 ;;
  }

  dimension: nib6270 {
    type: number
    sql: ${TABLE}.nib6270 ;;
  }

  dimension: nib6271 {
    type: number
    sql: ${TABLE}.nib6271 ;;
  }

  dimension: nib6272 {
    type: number
    sql: ${TABLE}.nib6272 ;;
  }

  dimension: nib6273 {
    type: number
    sql: ${TABLE}.nib6273 ;;
  }

  dimension: nib6274 {
    type: number
    sql: ${TABLE}.nib6274 ;;
  }

  dimension: nib6275 {
    type: number
    sql: ${TABLE}.nib6275 ;;
  }

  dimension: nib6276 {
    type: number
    sql: ${TABLE}.nib6276 ;;
  }

  dimension: nib6277 {
    type: number
    sql: ${TABLE}.nib6277 ;;
  }

  dimension: nib6278 {
    type: number
    sql: ${TABLE}.nib6278 ;;
  }

  dimension: nib6279 {
    type: number
    sql: ${TABLE}.nib6279 ;;
  }

  dimension: nib6280 {
    type: number
    sql: ${TABLE}.nib6280 ;;
  }

  dimension: nib6281 {
    type: number
    sql: ${TABLE}.nib6281 ;;
  }

  dimension: nib6282 {
    type: number
    sql: ${TABLE}.nib6282 ;;
  }

  dimension: nib6283 {
    type: number
    sql: ${TABLE}.nib6283 ;;
  }

  dimension: nib6285 {
    type: number
    sql: ${TABLE}.nib6285 ;;
  }

  dimension: nib6286 {
    type: number
    sql: ${TABLE}.nib6286 ;;
  }

  dimension: nib6289 {
    type: number
    sql: ${TABLE}.nib6289 ;;
  }

  dimension: nib6291 {
    type: number
    sql: ${TABLE}.nib6291 ;;
  }

  dimension: nib6292 {
    type: number
    sql: ${TABLE}.nib6292 ;;
  }

  dimension: nib6293 {
    type: number
    sql: ${TABLE}.nib6293 ;;
  }

  dimension: nib6294 {
    type: number
    sql: ${TABLE}.nib6294 ;;
  }

  dimension: nib6295 {
    type: number
    sql: ${TABLE}.nib6295 ;;
  }

  dimension: nib6296 {
    type: number
    sql: ${TABLE}.nib6296 ;;
  }

  dimension: nib6297 {
    type: number
    sql: ${TABLE}.nib6297 ;;
  }

  dimension: nib6298 {
    type: number
    sql: ${TABLE}.nib6298 ;;
  }

  dimension: nib6300 {
    type: number
    sql: ${TABLE}.nib6300 ;;
  }

  dimension: nib6301 {
    type: number
    sql: ${TABLE}.nib6301 ;;
  }

  dimension: nib6302 {
    type: number
    sql: ${TABLE}.nib6302 ;;
  }

  dimension: nib6303 {
    type: number
    sql: ${TABLE}.nib6303 ;;
  }

  dimension: nib6305 {
    type: number
    sql: ${TABLE}.nib6305 ;;
  }

  dimension: nib6308 {
    type: number
    sql: ${TABLE}.nib6308 ;;
  }

  dimension: nib6309 {
    type: number
    sql: ${TABLE}.nib6309 ;;
  }

  dimension: nib6311 {
    type: number
    sql: ${TABLE}.nib6311 ;;
  }

  dimension: nib6312 {
    type: number
    sql: ${TABLE}.nib6312 ;;
  }

  dimension: nib6313 {
    type: number
    sql: ${TABLE}.nib6313 ;;
  }

  dimension: nib6314 {
    type: number
    sql: ${TABLE}.nib6314 ;;
  }

  dimension: nib6315 {
    type: number
    sql: ${TABLE}.nib6315 ;;
  }

  dimension: nib6316 {
    type: number
    sql: ${TABLE}.nib6316 ;;
  }

  dimension: nib6317 {
    type: number
    sql: ${TABLE}.nib6317 ;;
  }

  dimension: nib6318 {
    type: number
    sql: ${TABLE}.nib6318 ;;
  }

  dimension: nib6319 {
    type: number
    sql: ${TABLE}.nib6319 ;;
  }

  dimension: nib6320 {
    type: number
    sql: ${TABLE}.nib6320 ;;
  }

  dimension: nib6322 {
    type: number
    sql: ${TABLE}.nib6322 ;;
  }

  dimension: nib6323 {
    type: number
    sql: ${TABLE}.nib6323 ;;
  }

  dimension: nib6324 {
    type: number
    sql: ${TABLE}.nib6324 ;;
  }

  dimension: nib6325 {
    type: number
    sql: ${TABLE}.nib6325 ;;
  }

  dimension: nib6326 {
    type: number
    sql: ${TABLE}.nib6326 ;;
  }

  dimension: nib6328 {
    type: number
    sql: ${TABLE}.nib6328 ;;
  }

  dimension: nib6329 {
    type: number
    sql: ${TABLE}.nib6329 ;;
  }

  dimension: nib6330 {
    type: number
    sql: ${TABLE}.nib6330 ;;
  }

  dimension: nib6331 {
    type: number
    sql: ${TABLE}.nib6331 ;;
  }

  dimension: nib6332 {
    type: number
    sql: ${TABLE}.nib6332 ;;
  }

  dimension: nib6333 {
    type: number
    sql: ${TABLE}.nib6333 ;;
  }

  dimension: nib6334 {
    type: number
    sql: ${TABLE}.nib6334 ;;
  }

  dimension: nib6335 {
    type: number
    sql: ${TABLE}.nib6335 ;;
  }

  dimension: nib6336 {
    type: number
    sql: ${TABLE}.nib6336 ;;
  }

  dimension: nib6337 {
    type: number
    sql: ${TABLE}.nib6337 ;;
  }

  dimension: nib6338 {
    type: number
    sql: ${TABLE}.nib6338 ;;
  }

  dimension: nib6339 {
    type: number
    sql: ${TABLE}.nib6339 ;;
  }

  dimension: nib6341 {
    type: number
    sql: ${TABLE}.nib6341 ;;
  }

  dimension: nib6342 {
    type: number
    sql: ${TABLE}.nib6342 ;;
  }

  dimension: nib6343 {
    type: number
    sql: ${TABLE}.nib6343 ;;
  }

  dimension: nib6344 {
    type: number
    sql: ${TABLE}.nib6344 ;;
  }

  dimension: nib6345 {
    type: number
    sql: ${TABLE}.nib6345 ;;
  }

  dimension: nib6346 {
    type: number
    sql: ${TABLE}.nib6346 ;;
  }

  dimension: nib6347 {
    type: number
    sql: ${TABLE}.nib6347 ;;
  }

  dimension: nib6348 {
    type: number
    sql: ${TABLE}.nib6348 ;;
  }

  dimension: nib6349 {
    type: number
    sql: ${TABLE}.nib6349 ;;
  }

  dimension: nib6350 {
    type: number
    sql: ${TABLE}.nib6350 ;;
  }

  dimension: nib6351 {
    type: number
    sql: ${TABLE}.nib6351 ;;
  }

  dimension: nib6354 {
    type: number
    sql: ${TABLE}.nib6354 ;;
  }

  dimension: nib6358 {
    type: number
    sql: ${TABLE}.nib6358 ;;
  }

  dimension: nib6359 {
    type: number
    sql: ${TABLE}.nib6359 ;;
  }

  dimension: nib6360 {
    type: number
    sql: ${TABLE}.nib6360 ;;
  }

  dimension: nib6361 {
    type: number
    sql: ${TABLE}.nib6361 ;;
  }

  dimension: nib6362 {
    type: number
    sql: ${TABLE}.nib6362 ;;
  }

  dimension: nib6365 {
    type: number
    sql: ${TABLE}.nib6365 ;;
  }

  dimension: nib6366 {
    type: number
    sql: ${TABLE}.nib6366 ;;
  }

  dimension: nib6367 {
    type: number
    sql: ${TABLE}.nib6367 ;;
  }

  dimension: nib6368 {
    type: number
    sql: ${TABLE}.nib6368 ;;
  }

  dimension: nib6369 {
    type: number
    sql: ${TABLE}.nib6369 ;;
  }

  dimension: nib6370 {
    type: number
    sql: ${TABLE}.nib6370 ;;
  }

  dimension: nib6371 {
    type: number
    sql: ${TABLE}.nib6371 ;;
  }

  dimension: nib6372 {
    type: number
    sql: ${TABLE}.nib6372 ;;
  }

  dimension: nib6373 {
    type: number
    sql: ${TABLE}.nib6373 ;;
  }

  dimension: nib6374 {
    type: number
    sql: ${TABLE}.nib6374 ;;
  }

  dimension: nib6375 {
    type: number
    sql: ${TABLE}.nib6375 ;;
  }

  dimension: nib6376 {
    type: number
    sql: ${TABLE}.nib6376 ;;
  }

  dimension: nib6377 {
    type: number
    sql: ${TABLE}.nib6377 ;;
  }

  dimension: nib6378 {
    type: number
    sql: ${TABLE}.nib6378 ;;
  }

  dimension: nib6379 {
    type: number
    sql: ${TABLE}.nib6379 ;;
  }

  dimension: nib6380 {
    type: number
    sql: ${TABLE}.nib6380 ;;
  }

  dimension: nib6381 {
    type: number
    sql: ${TABLE}.nib6381 ;;
  }

  dimension: nib6382 {
    type: number
    sql: ${TABLE}.nib6382 ;;
  }

  dimension: nib6383 {
    type: number
    sql: ${TABLE}.nib6383 ;;
  }

  dimension: nib6384 {
    type: number
    sql: ${TABLE}.nib6384 ;;
  }

  dimension: nib6385 {
    type: number
    sql: ${TABLE}.nib6385 ;;
  }

  dimension: nib6386 {
    type: number
    sql: ${TABLE}.nib6386 ;;
  }

  dimension: nib6387 {
    type: number
    sql: ${TABLE}.nib6387 ;;
  }

  dimension: nib6388 {
    type: number
    sql: ${TABLE}.nib6388 ;;
  }

  dimension: nib6389 {
    type: number
    sql: ${TABLE}.nib6389 ;;
  }

  dimension: nib6390 {
    type: number
    sql: ${TABLE}.nib6390 ;;
  }

  dimension: nib6391 {
    type: number
    sql: ${TABLE}.nib6391 ;;
  }

  dimension: nib6392 {
    type: number
    sql: ${TABLE}.nib6392 ;;
  }

  dimension: nib6393 {
    type: number
    sql: ${TABLE}.nib6393 ;;
  }

  dimension: nib6394 {
    type: number
    sql: ${TABLE}.nib6394 ;;
  }

  dimension: nib6395 {
    type: number
    sql: ${TABLE}.nib6395 ;;
  }

  dimension: nib6396 {
    type: number
    sql: ${TABLE}.nib6396 ;;
  }

  dimension: nib6397 {
    type: number
    sql: ${TABLE}.nib6397 ;;
  }

  dimension: nib6398 {
    type: number
    sql: ${TABLE}.nib6398 ;;
  }

  dimension: nib6400 {
    type: number
    sql: ${TABLE}.nib6400 ;;
  }

  dimension: nib6401 {
    type: number
    sql: ${TABLE}.nib6401 ;;
  }

  dimension: nib6402 {
    type: number
    sql: ${TABLE}.nib6402 ;;
  }

  dimension: nib6403 {
    type: number
    sql: ${TABLE}.nib6403 ;;
  }

  dimension: nib6404 {
    type: number
    sql: ${TABLE}.nib6404 ;;
  }

  dimension: nib6405 {
    type: number
    sql: ${TABLE}.nib6405 ;;
  }

  dimension: nib6406 {
    type: number
    sql: ${TABLE}.nib6406 ;;
  }

  dimension: nib6407 {
    type: number
    sql: ${TABLE}.nib6407 ;;
  }

  dimension: nib6408 {
    type: number
    sql: ${TABLE}.nib6408 ;;
  }

  dimension: nib6409 {
    type: number
    sql: ${TABLE}.nib6409 ;;
  }

  dimension: nib6410 {
    type: number
    sql: ${TABLE}.nib6410 ;;
  }

  dimension: nib6411 {
    type: number
    sql: ${TABLE}.nib6411 ;;
  }

  dimension: nib6412 {
    type: number
    sql: ${TABLE}.nib6412 ;;
  }

  dimension: nib6413 {
    type: number
    sql: ${TABLE}.nib6413 ;;
  }

  dimension: nib6414 {
    type: number
    sql: ${TABLE}.nib6414 ;;
  }

  dimension: nib6415 {
    type: number
    sql: ${TABLE}.nib6415 ;;
  }

  dimension: nib6416 {
    type: number
    sql: ${TABLE}.nib6416 ;;
  }

  dimension: nib6417 {
    type: number
    sql: ${TABLE}.nib6417 ;;
  }

  dimension: nib6418 {
    type: number
    sql: ${TABLE}.nib6418 ;;
  }

  dimension: nib6421 {
    type: number
    sql: ${TABLE}.nib6421 ;;
  }

  dimension: nib6422 {
    type: number
    sql: ${TABLE}.nib6422 ;;
  }

  dimension: nib6423 {
    type: number
    sql: ${TABLE}.nib6423 ;;
  }

  dimension: nib6424 {
    type: number
    sql: ${TABLE}.nib6424 ;;
  }

  dimension: nib6425 {
    type: number
    sql: ${TABLE}.nib6425 ;;
  }

  dimension: nib6426 {
    type: number
    sql: ${TABLE}.nib6426 ;;
  }

  dimension: nib6427 {
    type: number
    sql: ${TABLE}.nib6427 ;;
  }

  dimension: nib6428 {
    type: number
    sql: ${TABLE}.nib6428 ;;
  }

  dimension: nib6430 {
    type: number
    sql: ${TABLE}.nib6430 ;;
  }

  dimension: nib6431 {
    type: number
    sql: ${TABLE}.nib6431 ;;
  }

  dimension: nib6432 {
    type: number
    sql: ${TABLE}.nib6432 ;;
  }

  dimension: nib6434 {
    type: number
    sql: ${TABLE}.nib6434 ;;
  }

  dimension: nib6436 {
    type: number
    sql: ${TABLE}.nib6436 ;;
  }

  dimension: nib6437 {
    type: number
    sql: ${TABLE}.nib6437 ;;
  }

  dimension: nib6438 {
    type: number
    sql: ${TABLE}.nib6438 ;;
  }

  dimension: nib6448 {
    type: number
    sql: ${TABLE}.nib6448 ;;
  }

  dimension: nib6449 {
    type: number
    sql: ${TABLE}.nib6449 ;;
  }

  dimension: nib6450 {
    type: number
    sql: ${TABLE}.nib6450 ;;
  }

  dimension: nib6452 {
    type: number
    sql: ${TABLE}.nib6452 ;;
  }

  dimension: nib6453 {
    type: number
    sql: ${TABLE}.nib6453 ;;
  }

  dimension: nib6454 {
    type: number
    sql: ${TABLE}.nib6454 ;;
  }

  dimension: nib6455 {
    type: number
    sql: ${TABLE}.nib6455 ;;
  }

  dimension: nib6456 {
    type: number
    sql: ${TABLE}.nib6456 ;;
  }

  dimension: nib6457 {
    type: number
    sql: ${TABLE}.nib6457 ;;
  }

  dimension: nib6458 {
    type: number
    sql: ${TABLE}.nib6458 ;;
  }

  dimension: nib6459 {
    type: number
    sql: ${TABLE}.nib6459 ;;
  }

  dimension: nib6460 {
    type: number
    sql: ${TABLE}.nib6460 ;;
  }

  dimension: nib6483 {
    type: number
    sql: ${TABLE}.nib6483 ;;
  }

  dimension: nib6484 {
    type: number
    sql: ${TABLE}.nib6484 ;;
  }

  dimension: nib6485 {
    type: number
    sql: ${TABLE}.nib6485 ;;
  }

  dimension: nib6487 {
    type: number
    sql: ${TABLE}.nib6487 ;;
  }

  dimension: nib6488 {
    type: number
    sql: ${TABLE}.nib6488 ;;
  }

  dimension: nib6489 {
    type: number
    sql: ${TABLE}.nib6489 ;;
  }

  dimension: nib6490 {
    type: number
    sql: ${TABLE}.nib6490 ;;
  }

  dimension: nib6491 {
    type: number
    sql: ${TABLE}.nib6491 ;;
  }

  dimension: nib6492 {
    type: number
    sql: ${TABLE}.nib6492 ;;
  }

  dimension: nib6493 {
    type: number
    sql: ${TABLE}.nib6493 ;;
  }

  dimension: nib6494 {
    type: number
    sql: ${TABLE}.nib6494 ;;
  }

  dimension: nib6495 {
    type: number
    sql: ${TABLE}.nib6495 ;;
  }

  dimension: nib6496 {
    type: number
    sql: ${TABLE}.nib6496 ;;
  }

  dimension: nib6497 {
    type: number
    sql: ${TABLE}.nib6497 ;;
  }

  dimension: nib6498 {
    type: number
    sql: ${TABLE}.nib6498 ;;
  }

  dimension: nib6499 {
    type: number
    sql: ${TABLE}.nib6499 ;;
  }

  dimension: nib6500 {
    type: number
    sql: ${TABLE}.nib6500 ;;
  }

  dimension: nib6501 {
    type: number
    sql: ${TABLE}.nib6501 ;;
  }

  dimension: nib6502 {
    type: number
    sql: ${TABLE}.nib6502 ;;
  }

  dimension: nib6503 {
    type: number
    sql: ${TABLE}.nib6503 ;;
  }

  dimension: nib6504 {
    type: number
    sql: ${TABLE}.nib6504 ;;
  }

  dimension: nib6505 {
    type: number
    sql: ${TABLE}.nib6505 ;;
  }

  dimension: nib6506 {
    type: number
    sql: ${TABLE}.nib6506 ;;
  }

  dimension: nib6507 {
    type: number
    sql: ${TABLE}.nib6507 ;;
  }

  dimension: nib6508 {
    type: number
    sql: ${TABLE}.nib6508 ;;
  }

  dimension: nib6509 {
    type: number
    sql: ${TABLE}.nib6509 ;;
  }

  dimension: nib6510 {
    type: number
    sql: ${TABLE}.nib6510 ;;
  }

  dimension: nib6511 {
    type: number
    sql: ${TABLE}.nib6511 ;;
  }

  dimension: nib6512 {
    type: number
    sql: ${TABLE}.nib6512 ;;
  }

  dimension: nib6513 {
    type: number
    sql: ${TABLE}.nib6513 ;;
  }

  dimension: nib6514 {
    type: number
    sql: ${TABLE}.nib6514 ;;
  }

  dimension: nib6515 {
    type: number
    sql: ${TABLE}.nib6515 ;;
  }

  dimension: nib6516 {
    type: number
    sql: ${TABLE}.nib6516 ;;
  }

  dimension: nib6517 {
    type: number
    sql: ${TABLE}.nib6517 ;;
  }

  dimension: nib6518 {
    type: number
    sql: ${TABLE}.nib6518 ;;
  }

  dimension: nib6522 {
    type: number
    sql: ${TABLE}.nib6522 ;;
  }

  dimension: nib6523 {
    type: number
    sql: ${TABLE}.nib6523 ;;
  }

  dimension: nib6524 {
    type: number
    sql: ${TABLE}.nib6524 ;;
  }

  dimension: nib6525 {
    type: number
    sql: ${TABLE}.nib6525 ;;
  }

  dimension: nib6526 {
    type: number
    sql: ${TABLE}.nib6526 ;;
  }

  dimension: nib6527 {
    type: number
    sql: ${TABLE}.nib6527 ;;
  }

  dimension: nib6529 {
    type: number
    sql: ${TABLE}.nib6529 ;;
  }

  dimension: nib6530 {
    type: number
    sql: ${TABLE}.nib6530 ;;
  }

  dimension: nib6531 {
    type: number
    sql: ${TABLE}.nib6531 ;;
  }

  dimension: nib6537 {
    type: number
    sql: ${TABLE}.nib6537 ;;
  }

  dimension: nib6538 {
    type: number
    sql: ${TABLE}.nib6538 ;;
  }

  dimension: nib6539 {
    type: number
    sql: ${TABLE}.nib6539 ;;
  }

  dimension: nib6540 {
    type: number
    sql: ${TABLE}.nib6540 ;;
  }

  dimension: nib6541 {
    type: number
    sql: ${TABLE}.nib6541 ;;
  }

  dimension: nib6543 {
    type: number
    sql: ${TABLE}.nib6543 ;;
  }

  dimension: nib6544 {
    type: number
    sql: ${TABLE}.nib6544 ;;
  }

  dimension: nib6545 {
    type: number
    sql: ${TABLE}.nib6545 ;;
  }

  dimension: nib6546 {
    type: number
    sql: ${TABLE}.nib6546 ;;
  }

  dimension: nib6547 {
    type: number
    sql: ${TABLE}.nib6547 ;;
  }

  dimension: nib6548 {
    type: number
    sql: ${TABLE}.nib6548 ;;
  }

  dimension: nib6549 {
    type: number
    sql: ${TABLE}.nib6549 ;;
  }

  dimension: nib6550 {
    type: number
    sql: ${TABLE}.nib6550 ;;
  }

  dimension: nib6551 {
    type: number
    sql: ${TABLE}.nib6551 ;;
  }

  dimension: nib6552 {
    type: number
    sql: ${TABLE}.nib6552 ;;
  }

  dimension: nib6553 {
    type: number
    sql: ${TABLE}.nib6553 ;;
  }

  dimension: nib6554 {
    type: number
    sql: ${TABLE}.nib6554 ;;
  }

  dimension: nib6555 {
    type: number
    sql: ${TABLE}.nib6555 ;;
  }

  dimension: nib6556 {
    type: number
    sql: ${TABLE}.nib6556 ;;
  }

  dimension: nib6558 {
    type: number
    sql: ${TABLE}.nib6558 ;;
  }

  dimension: nib6559 {
    type: number
    sql: ${TABLE}.nib6559 ;;
  }

  dimension: nib6560 {
    type: number
    sql: ${TABLE}.nib6560 ;;
  }

  dimension: nib6565 {
    type: number
    sql: ${TABLE}.nib6565 ;;
  }

  dimension: nib6566 {
    type: number
    sql: ${TABLE}.nib6566 ;;
  }

  dimension: nib6568 {
    type: number
    sql: ${TABLE}.nib6568 ;;
  }

  dimension: nib6569 {
    type: number
    sql: ${TABLE}.nib6569 ;;
  }

  dimension: nib6570 {
    type: number
    sql: ${TABLE}.nib6570 ;;
  }

  dimension: nib6571 {
    type: number
    sql: ${TABLE}.nib6571 ;;
  }

  dimension: nib6572 {
    type: number
    sql: ${TABLE}.nib6572 ;;
  }

  dimension: nib6573 {
    type: number
    sql: ${TABLE}.nib6573 ;;
  }

  dimension: nib6574 {
    type: number
    sql: ${TABLE}.nib6574 ;;
  }

  dimension: nib6575 {
    type: number
    sql: ${TABLE}.nib6575 ;;
  }

  dimension: nib6576 {
    type: number
    sql: ${TABLE}.nib6576 ;;
  }

  dimension: nib6577 {
    type: number
    sql: ${TABLE}.nib6577 ;;
  }

  dimension: nib6578 {
    type: number
    sql: ${TABLE}.nib6578 ;;
  }

  dimension: nib6579 {
    type: number
    sql: ${TABLE}.nib6579 ;;
  }

  dimension: nib6580 {
    type: number
    sql: ${TABLE}.nib6580 ;;
  }

  dimension: nib6581 {
    type: number
    sql: ${TABLE}.nib6581 ;;
  }

  dimension: nib6582 {
    type: number
    sql: ${TABLE}.nib6582 ;;
  }

  dimension: nib6583 {
    type: number
    sql: ${TABLE}.nib6583 ;;
  }

  dimension: nib6584 {
    type: number
    sql: ${TABLE}.nib6584 ;;
  }

  dimension: nib6585 {
    type: number
    sql: ${TABLE}.nib6585 ;;
  }

  dimension: nib6586 {
    type: number
    sql: ${TABLE}.nib6586 ;;
  }

  dimension: nib6588 {
    type: number
    sql: ${TABLE}.nib6588 ;;
  }

  dimension: nib6589 {
    type: number
    sql: ${TABLE}.nib6589 ;;
  }

  dimension: nib6590 {
    type: number
    sql: ${TABLE}.nib6590 ;;
  }

  dimension: nib6591 {
    type: number
    sql: ${TABLE}.nib6591 ;;
  }

  dimension: nib6592 {
    type: number
    sql: ${TABLE}.nib6592 ;;
  }

  dimension: nib6593 {
    type: number
    sql: ${TABLE}.nib6593 ;;
  }

  dimension: nib6594 {
    type: number
    sql: ${TABLE}.nib6594 ;;
  }

  dimension: nib6595 {
    type: number
    sql: ${TABLE}.nib6595 ;;
  }

  dimension: nib6596 {
    type: number
    sql: ${TABLE}.nib6596 ;;
  }

  dimension: nib6597 {
    type: number
    sql: ${TABLE}.nib6597 ;;
  }

  dimension: nib6598 {
    type: number
    sql: ${TABLE}.nib6598 ;;
  }

  dimension: nib6599 {
    type: number
    sql: ${TABLE}.nib6599 ;;
  }

  dimension: nib6600 {
    type: number
    sql: ${TABLE}.nib6600 ;;
  }

  dimension: nib6603 {
    type: string
    sql: ${TABLE}.nib6603 ;;
  }

  dimension: nib6604 {
    type: string
    sql: ${TABLE}.nib6604 ;;
  }

  dimension: nib6605 {
    type: string
    sql: ${TABLE}.nib6605 ;;
  }

  dimension: nib6606 {
    type: string
    sql: ${TABLE}.nib6606 ;;
  }

  dimension: nib6607 {
    type: string
    sql: ${TABLE}.nib6607 ;;
  }

  dimension: nib6608 {
    type: string
    sql: ${TABLE}.nib6608 ;;
  }

  dimension: nib6609 {
    type: string
    sql: ${TABLE}.nib6609 ;;
  }

  dimension: nib6610 {
    type: string
    sql: ${TABLE}.nib6610 ;;
  }

  dimension: nib6611 {
    type: string
    sql: ${TABLE}.nib6611 ;;
  }

  dimension: nib6612 {
    type: number
    sql: ${TABLE}.nib6612 ;;
  }

  dimension: nib6614 {
    type: number
    sql: ${TABLE}.nib6614 ;;
  }

  dimension: nib6615 {
    type: number
    sql: ${TABLE}.nib6615 ;;
  }

  dimension: nib6617 {
    type: number
    sql: ${TABLE}.nib6617 ;;
  }

  dimension: nib6618 {
    type: number
    sql: ${TABLE}.nib6618 ;;
  }

  dimension: nib6619 {
    type: number
    sql: ${TABLE}.nib6619 ;;
  }

  dimension: nib6620 {
    type: number
    sql: ${TABLE}.nib6620 ;;
  }

  dimension: nib6621 {
    type: number
    sql: ${TABLE}.nib6621 ;;
  }

  dimension: nib6622 {
    type: number
    sql: ${TABLE}.nib6622 ;;
  }

  dimension: nib6623 {
    type: number
    sql: ${TABLE}.nib6623 ;;
  }

  dimension: nib6624 {
    type: number
    sql: ${TABLE}.nib6624 ;;
  }

  dimension: nib6625 {
    type: number
    sql: ${TABLE}.nib6625 ;;
  }

  dimension: nib6626 {
    type: number
    sql: ${TABLE}.nib6626 ;;
  }

  dimension: nib6627 {
    type: number
    sql: ${TABLE}.nib6627 ;;
  }

  dimension: nib6628 {
    type: number
    sql: ${TABLE}.nib6628 ;;
  }

  dimension: nib6629 {
    type: number
    sql: ${TABLE}.nib6629 ;;
  }

  dimension: nib6630 {
    type: number
    sql: ${TABLE}.nib6630 ;;
  }

  dimension: nib6631 {
    type: number
    sql: ${TABLE}.nib6631 ;;
  }

  dimension: nib6632 {
    type: number
    sql: ${TABLE}.nib6632 ;;
  }

  dimension: nib6633 {
    type: number
    sql: ${TABLE}.nib6633 ;;
  }

  dimension: nib6634 {
    type: number
    sql: ${TABLE}.nib6634 ;;
  }

  dimension: nib6636 {
    type: number
    sql: ${TABLE}.nib6636 ;;
  }

  dimension: nib6637 {
    type: number
    sql: ${TABLE}.nib6637 ;;
  }

  dimension: nib6638 {
    type: number
    sql: ${TABLE}.nib6638 ;;
  }

  dimension: nib6639 {
    type: number
    sql: ${TABLE}.nib6639 ;;
  }

  dimension: nib6640 {
    type: number
    sql: ${TABLE}.nib6640 ;;
  }

  dimension: nib6641 {
    type: number
    sql: ${TABLE}.nib6641 ;;
  }

  dimension: nib6642 {
    type: number
    sql: ${TABLE}.nib6642 ;;
  }

  dimension: nib6643 {
    type: number
    sql: ${TABLE}.nib6643 ;;
  }

  dimension: nib6644 {
    type: number
    sql: ${TABLE}.nib6644 ;;
  }

  dimension: nib6645 {
    type: number
    sql: ${TABLE}.nib6645 ;;
  }

  dimension: nib6647 {
    type: number
    sql: ${TABLE}.nib6647 ;;
  }

  dimension: nib6648 {
    type: number
    sql: ${TABLE}.nib6648 ;;
  }

  dimension: nib6649 {
    type: number
    sql: ${TABLE}.nib6649 ;;
  }

  dimension: nib6650 {
    type: number
    sql: ${TABLE}.nib6650 ;;
  }

  dimension: nib6651 {
    type: number
    sql: ${TABLE}.nib6651 ;;
  }

  dimension: nib6652 {
    type: number
    sql: ${TABLE}.nib6652 ;;
  }

  dimension: nib6653 {
    type: number
    sql: ${TABLE}.nib6653 ;;
  }

  dimension: nib6654 {
    type: number
    sql: ${TABLE}.nib6654 ;;
  }

  dimension: nib6655 {
    type: number
    sql: ${TABLE}.nib6655 ;;
  }

  dimension: nib6656 {
    type: number
    sql: ${TABLE}.nib6656 ;;
  }

  dimension: nib6657 {
    type: number
    sql: ${TABLE}.nib6657 ;;
  }

  dimension: nib6658 {
    type: number
    sql: ${TABLE}.nib6658 ;;
  }

  dimension: nib6659 {
    type: number
    sql: ${TABLE}.nib6659 ;;
  }

  dimension: nib6660 {
    type: number
    sql: ${TABLE}.nib6660 ;;
  }

  dimension: nib6661 {
    type: number
    sql: ${TABLE}.nib6661 ;;
  }

  dimension: nib6662 {
    type: number
    sql: ${TABLE}.nib6662 ;;
  }

  dimension: nib6663 {
    type: number
    sql: ${TABLE}.nib6663 ;;
  }

  dimension: nib6664 {
    type: number
    sql: ${TABLE}.nib6664 ;;
  }

  dimension: nib6665 {
    type: number
    sql: ${TABLE}.nib6665 ;;
  }

  dimension: nib6666 {
    type: number
    sql: ${TABLE}.nib6666 ;;
  }

  dimension: nib6667 {
    type: number
    sql: ${TABLE}.nib6667 ;;
  }

  dimension: nib6668 {
    type: number
    sql: ${TABLE}.nib6668 ;;
  }

  dimension: nib6669 {
    type: number
    sql: ${TABLE}.nib6669 ;;
  }

  dimension: nib6670 {
    type: number
    sql: ${TABLE}.nib6670 ;;
  }

  dimension: nib6671 {
    type: number
    sql: ${TABLE}.nib6671 ;;
  }

  dimension: nib6672 {
    type: number
    sql: ${TABLE}.nib6672 ;;
  }

  dimension: nib6673 {
    type: number
    sql: ${TABLE}.nib6673 ;;
  }

  dimension: nib6674 {
    type: number
    sql: ${TABLE}.nib6674 ;;
  }

  dimension: nib6675 {
    type: number
    sql: ${TABLE}.nib6675 ;;
  }

  dimension: nib6676 {
    type: number
    sql: ${TABLE}.nib6676 ;;
  }

  dimension: nib6677 {
    type: number
    sql: ${TABLE}.nib6677 ;;
  }

  dimension: nib6678 {
    type: number
    sql: ${TABLE}.nib6678 ;;
  }

  dimension: nib6679 {
    type: number
    sql: ${TABLE}.nib6679 ;;
  }

  dimension: nib6680 {
    type: number
    sql: ${TABLE}.nib6680 ;;
  }

  dimension: nib6681 {
    type: number
    sql: ${TABLE}.nib6681 ;;
  }

  dimension: nib6685 {
    type: string
    sql: ${TABLE}.nib6685 ;;
  }

  dimension: nib6686 {
    type: string
    sql: ${TABLE}.nib6686 ;;
  }

  dimension: nib6696 {
    type: string
    sql: ${TABLE}.nib6696 ;;
  }

  dimension: nib6697 {
    type: string
    sql: ${TABLE}.nib6697 ;;
  }

  dimension: nib6698 {
    type: string
    sql: ${TABLE}.nib6698 ;;
  }

  dimension: nib6699 {
    type: string
    sql: ${TABLE}.nib6699 ;;
  }

  dimension: nib6700 {
    type: string
    sql: ${TABLE}.nib6700 ;;
  }

  dimension: nib6701 {
    type: string
    sql: ${TABLE}.nib6701 ;;
  }

  dimension: nib6702 {
    type: string
    sql: ${TABLE}.nib6702 ;;
  }

  dimension: nib6703 {
    type: number
    sql: ${TABLE}.nib6703 ;;
  }

  dimension: nib6707 {
    type: string
    sql: ${TABLE}.nib6707 ;;
  }

  dimension: nib6708 {
    type: string
    sql: ${TABLE}.nib6708 ;;
  }

  dimension: nib6718 {
    type: string
    sql: ${TABLE}.nib6718 ;;
  }

  dimension: nib6719 {
    type: string
    sql: ${TABLE}.nib6719 ;;
  }

  dimension: nib6720 {
    type: string
    sql: ${TABLE}.nib6720 ;;
  }

  dimension: nib6721 {
    type: string
    sql: ${TABLE}.nib6721 ;;
  }

  dimension: nib6722 {
    type: string
    sql: ${TABLE}.nib6722 ;;
  }

  dimension: nib6723 {
    type: string
    sql: ${TABLE}.nib6723 ;;
  }

  dimension: nib6724 {
    type: string
    sql: ${TABLE}.nib6724 ;;
  }

  dimension: nib6726 {
    type: number
    sql: ${TABLE}.nib6726 ;;
  }

  dimension: nib6727 {
    type: number
    sql: ${TABLE}.nib6727 ;;
  }

  dimension: nib6728 {
    type: number
    sql: ${TABLE}.nib6728 ;;
  }

  dimension: nib6729 {
    type: number
    sql: ${TABLE}.nib6729 ;;
  }

  dimension: nib6730 {
    type: number
    sql: ${TABLE}.nib6730 ;;
  }

  dimension: nib6731 {
    type: number
    sql: ${TABLE}.nib6731 ;;
  }

  dimension: nib6732 {
    type: number
    sql: ${TABLE}.nib6732 ;;
  }

  dimension: nib6733 {
    type: number
    sql: ${TABLE}.nib6733 ;;
  }

  dimension: nib6734 {
    type: number
    sql: ${TABLE}.nib6734 ;;
  }

  dimension: nib6736 {
    type: number
    sql: ${TABLE}.nib6736 ;;
  }

  dimension: nib6737 {
    type: number
    sql: ${TABLE}.nib6737 ;;
  }

  dimension: nib6738 {
    type: number
    sql: ${TABLE}.nib6738 ;;
  }

  dimension: nib6739 {
    type: number
    sql: ${TABLE}.nib6739 ;;
  }

  dimension: nib6740 {
    type: number
    sql: ${TABLE}.nib6740 ;;
  }

  dimension: nib6741 {
    type: number
    sql: ${TABLE}.nib6741 ;;
  }

  dimension: nib6742 {
    type: number
    sql: ${TABLE}.nib6742 ;;
  }

  dimension: nib6743 {
    type: number
    sql: ${TABLE}.nib6743 ;;
  }

  dimension: nib6744 {
    type: number
    sql: ${TABLE}.nib6744 ;;
  }

  dimension: nib6745 {
    type: number
    sql: ${TABLE}.nib6745 ;;
  }

  dimension: nib6746 {
    type: number
    sql: ${TABLE}.nib6746 ;;
  }

  dimension: nib6748 {
    type: number
    sql: ${TABLE}.nib6748 ;;
  }

  dimension: nib6753 {
    type: number
    sql: ${TABLE}.nib6753 ;;
  }

  dimension: nib6754 {
    type: number
    sql: ${TABLE}.nib6754 ;;
  }

  dimension: nib6755 {
    type: number
    sql: ${TABLE}.nib6755 ;;
  }

  dimension: nib6756 {
    type: number
    sql: ${TABLE}.nib6756 ;;
  }

  dimension: nib6757 {
    type: number
    sql: ${TABLE}.nib6757 ;;
  }

  dimension: nib6758 {
    type: number
    sql: ${TABLE}.nib6758 ;;
  }

  dimension: nib6759 {
    type: number
    sql: ${TABLE}.nib6759 ;;
  }

  dimension: nib6760 {
    type: number
    sql: ${TABLE}.nib6760 ;;
  }

  dimension: nib6761 {
    type: number
    sql: ${TABLE}.nib6761 ;;
  }

  dimension: nib6762 {
    type: number
    sql: ${TABLE}.nib6762 ;;
  }

  dimension: nib6763 {
    type: number
    sql: ${TABLE}.nib6763 ;;
  }

  dimension: nib6764 {
    type: number
    sql: ${TABLE}.nib6764 ;;
  }

  dimension: nib6765 {
    type: number
    sql: ${TABLE}.nib6765 ;;
  }

  dimension: nib6766 {
    type: number
    sql: ${TABLE}.nib6766 ;;
  }

  dimension: nib6767 {
    type: number
    sql: ${TABLE}.nib6767 ;;
  }

  dimension: nib6768 {
    type: number
    sql: ${TABLE}.nib6768 ;;
  }

  dimension: nib6769 {
    type: number
    sql: ${TABLE}.nib6769 ;;
  }

  dimension: nib6770 {
    type: number
    sql: ${TABLE}.nib6770 ;;
  }

  dimension: nib6771 {
    type: number
    sql: ${TABLE}.nib6771 ;;
  }

  dimension: nib6772 {
    type: number
    sql: ${TABLE}.nib6772 ;;
  }

  dimension: nib6773 {
    type: number
    sql: ${TABLE}.nib6773 ;;
  }

  dimension: nib6774 {
    type: number
    sql: ${TABLE}.nib6774 ;;
  }

  dimension: nib6775 {
    type: number
    sql: ${TABLE}.nib6775 ;;
  }

  dimension: nib6776 {
    type: number
    sql: ${TABLE}.nib6776 ;;
  }

  dimension: nib6777 {
    type: number
    sql: ${TABLE}.nib6777 ;;
  }

  dimension: nib6778 {
    type: number
    sql: ${TABLE}.nib6778 ;;
  }

  dimension: nib6779 {
    type: number
    sql: ${TABLE}.nib6779 ;;
  }

  dimension: nib6780 {
    type: number
    sql: ${TABLE}.nib6780 ;;
  }

  dimension: nib6781 {
    type: number
    sql: ${TABLE}.nib6781 ;;
  }

  dimension: nib6782 {
    type: number
    sql: ${TABLE}.nib6782 ;;
  }

  dimension: nib6783 {
    type: number
    sql: ${TABLE}.nib6783 ;;
  }

  dimension: nib6784 {
    type: number
    sql: ${TABLE}.nib6784 ;;
  }

  dimension: nib6785 {
    type: number
    sql: ${TABLE}.nib6785 ;;
  }

  dimension: nib6786 {
    type: number
    sql: ${TABLE}.nib6786 ;;
  }

  dimension: nib6787 {
    type: number
    sql: ${TABLE}.nib6787 ;;
  }

  dimension: nib6788 {
    type: number
    sql: ${TABLE}.nib6788 ;;
  }

  dimension: nib6791 {
    type: number
    sql: ${TABLE}.nib6791 ;;
  }

  dimension: nib6792 {
    type: number
    sql: ${TABLE}.nib6792 ;;
  }

  dimension: nib6793 {
    type: number
    sql: ${TABLE}.nib6793 ;;
  }

  dimension: nib6794 {
    type: number
    sql: ${TABLE}.nib6794 ;;
  }

  dimension: nib6795 {
    type: number
    sql: ${TABLE}.nib6795 ;;
  }

  dimension: nib6796 {
    type: number
    sql: ${TABLE}.nib6796 ;;
  }

  dimension: nib6797 {
    type: number
    sql: ${TABLE}.nib6797 ;;
  }

  dimension: nib6798 {
    type: number
    sql: ${TABLE}.nib6798 ;;
  }

  dimension: nib6799 {
    type: number
    sql: ${TABLE}.nib6799 ;;
  }

  dimension: nib6801 {
    type: number
    sql: ${TABLE}.nib6801 ;;
  }

  dimension: nib6802 {
    type: number
    sql: ${TABLE}.nib6802 ;;
  }

  dimension: nib6803 {
    type: number
    sql: ${TABLE}.nib6803 ;;
  }

  dimension: nib6804 {
    type: number
    sql: ${TABLE}.nib6804 ;;
  }

  dimension: nib6805 {
    type: number
    sql: ${TABLE}.nib6805 ;;
  }

  dimension: nib6806 {
    type: number
    sql: ${TABLE}.nib6806 ;;
  }

  dimension: nib6809 {
    type: number
    sql: ${TABLE}.nib6809 ;;
  }

  dimension: nib6810 {
    type: number
    sql: ${TABLE}.nib6810 ;;
  }

  dimension: nib6811 {
    type: number
    sql: ${TABLE}.nib6811 ;;
  }

  dimension: nib6812 {
    type: number
    sql: ${TABLE}.nib6812 ;;
  }

  dimension: nib6813 {
    type: string
    sql: ${TABLE}.nib6813 ;;
  }

  dimension: nib6814 {
    type: string
    sql: ${TABLE}.nib6814 ;;
  }

  dimension: nib6815 {
    type: number
    sql: ${TABLE}.nib6815 ;;
  }

  dimension: nib6816 {
    type: number
    sql: ${TABLE}.nib6816 ;;
  }

  dimension: nib6817 {
    type: number
    sql: ${TABLE}.nib6817 ;;
  }

  dimension: nib6818 {
    type: number
    sql: ${TABLE}.nib6818 ;;
  }

  dimension: nib6819 {
    type: number
    sql: ${TABLE}.nib6819 ;;
  }

  dimension: nib6820 {
    type: number
    sql: ${TABLE}.nib6820 ;;
  }

  dimension: nib6821 {
    type: number
    sql: ${TABLE}.nib6821 ;;
  }

  dimension: nib6823 {
    type: number
    sql: ${TABLE}.nib6823 ;;
  }

  dimension: nib6824 {
    type: number
    sql: ${TABLE}.nib6824 ;;
  }

  dimension: nib6825 {
    type: number
    sql: ${TABLE}.nib6825 ;;
  }

  dimension: nib6826 {
    type: number
    sql: ${TABLE}.nib6826 ;;
  }

  dimension: nib6827 {
    type: number
    sql: ${TABLE}.nib6827 ;;
  }

  dimension: nib6828 {
    type: number
    sql: ${TABLE}.nib6828 ;;
  }

  dimension: nib6829 {
    type: number
    sql: ${TABLE}.nib6829 ;;
  }

  dimension: nib6830 {
    type: number
    sql: ${TABLE}.nib6830 ;;
  }

  dimension: nib6831 {
    type: number
    sql: ${TABLE}.nib6831 ;;
  }

  dimension: nib6832 {
    type: number
    sql: ${TABLE}.nib6832 ;;
  }

  dimension: nib6833 {
    type: number
    sql: ${TABLE}.nib6833 ;;
  }

  dimension: nib6834 {
    type: number
    sql: ${TABLE}.nib6834 ;;
  }

  dimension: nib6835 {
    type: number
    sql: ${TABLE}.nib6835 ;;
  }

  dimension: nib6836 {
    type: number
    sql: ${TABLE}.nib6836 ;;
  }

  dimension: nib6837 {
    type: number
    sql: ${TABLE}.nib6837 ;;
  }

  dimension: nib6838 {
    type: number
    sql: ${TABLE}.nib6838 ;;
  }

  dimension: nib6839 {
    type: number
    sql: ${TABLE}.nib6839 ;;
  }

  dimension: nib6840 {
    type: string
    sql: ${TABLE}.nib6840 ;;
  }

  dimension: nib6841 {
    type: string
    sql: ${TABLE}.nib6841 ;;
  }

  dimension: nib6842 {
    type: string
    sql: ${TABLE}.nib6842 ;;
  }

  dimension: nib6843 {
    type: string
    sql: ${TABLE}.nib6843 ;;
  }

  dimension: nib6844 {
    type: string
    sql: ${TABLE}.nib6844 ;;
  }

  dimension: nib6845 {
    type: string
    sql: ${TABLE}.nib6845 ;;
  }

  dimension: nib6846 {
    type: number
    sql: ${TABLE}.nib6846 ;;
  }

  dimension: nib6847 {
    type: number
    sql: ${TABLE}.nib6847 ;;
  }

  dimension: nib6848 {
    type: number
    sql: ${TABLE}.nib6848 ;;
  }

  dimension: nib6849 {
    type: number
    sql: ${TABLE}.nib6849 ;;
  }

  dimension: nib6850 {
    type: number
    sql: ${TABLE}.nib6850 ;;
  }

  dimension: nib6851 {
    type: number
    sql: ${TABLE}.nib6851 ;;
  }

  dimension: nib6852 {
    type: number
    sql: ${TABLE}.nib6852 ;;
  }

  dimension: nib6853 {
    type: string
    sql: ${TABLE}.nib6853 ;;
  }

  dimension: nib6854 {
    type: string
    sql: ${TABLE}.nib6854 ;;
  }

  dimension: nib6855 {
    type: string
    sql: ${TABLE}.nib6855 ;;
  }

  dimension: nib6856 {
    type: string
    sql: ${TABLE}.nib6856 ;;
  }

  dimension: nib6858 {
    type: string
    sql: ${TABLE}.nib6858 ;;
  }

  dimension: nib6859 {
    type: string
    sql: ${TABLE}.nib6859 ;;
  }

  dimension: nib6860 {
    type: string
    sql: ${TABLE}.nib6860 ;;
  }

  dimension: nib6861 {
    type: string
    sql: ${TABLE}.nib6861 ;;
  }

  dimension: nib6863 {
    type: string
    sql: ${TABLE}.nib6863 ;;
  }

  dimension: nib6864 {
    type: string
    sql: ${TABLE}.nib6864 ;;
  }

  dimension: nib6865 {
    type: string
    sql: ${TABLE}.nib6865 ;;
  }

  dimension: nib6866 {
    type: string
    sql: ${TABLE}.nib6866 ;;
  }

  dimension: nib6867 {
    type: string
    sql: ${TABLE}.nib6867 ;;
  }

  dimension: nib6868 {
    type: string
    sql: ${TABLE}.nib6868 ;;
  }

  dimension: nib6869 {
    type: string
    sql: ${TABLE}.nib6869 ;;
  }

  dimension: nib6870 {
    type: string
    sql: ${TABLE}.nib6870 ;;
  }

  dimension: nib6871 {
    type: string
    sql: ${TABLE}.nib6871 ;;
  }

  dimension: nib6872 {
    type: string
    sql: ${TABLE}.nib6872 ;;
  }

  dimension: nib6873 {
    type: string
    sql: ${TABLE}.nib6873 ;;
  }

  dimension: nib6874 {
    type: string
    sql: ${TABLE}.nib6874 ;;
  }

  dimension: nib6875 {
    type: string
    sql: ${TABLE}.nib6875 ;;
  }

  dimension: nib6878 {
    type: string
    sql: ${TABLE}.nib6878 ;;
  }

  dimension: nib6879 {
    type: string
    sql: ${TABLE}.nib6879 ;;
  }

  dimension: nib6880 {
    type: number
    sql: ${TABLE}.nib6880 ;;
  }

  dimension: nib6881 {
    type: number
    sql: ${TABLE}.nib6881 ;;
  }

  dimension: nib6882 {
    type: number
    sql: ${TABLE}.nib6882 ;;
  }

  dimension: nib6884 {
    type: number
    sql: ${TABLE}.nib6884 ;;
  }

  dimension: nib6885 {
    type: number
    sql: ${TABLE}.nib6885 ;;
  }

  dimension: nib6886 {
    type: number
    sql: ${TABLE}.nib6886 ;;
  }

  dimension: nib6887 {
    type: number
    sql: ${TABLE}.nib6887 ;;
  }

  dimension: nib6888 {
    type: number
    sql: ${TABLE}.nib6888 ;;
  }

  dimension: nib6889 {
    type: number
    sql: ${TABLE}.nib6889 ;;
  }

  dimension: nib6890 {
    type: number
    sql: ${TABLE}.nib6890 ;;
  }

  dimension: nib6891 {
    type: number
    sql: ${TABLE}.nib6891 ;;
  }

  dimension: nib6892 {
    type: number
    sql: ${TABLE}.nib6892 ;;
  }

  dimension: nib6893 {
    type: number
    sql: ${TABLE}.nib6893 ;;
  }

  dimension: nib6894 {
    type: number
    sql: ${TABLE}.nib6894 ;;
  }

  dimension: nib6895 {
    type: number
    sql: ${TABLE}.nib6895 ;;
  }

  dimension: nib6896 {
    type: number
    sql: ${TABLE}.nib6896 ;;
  }

  dimension: nib6897 {
    type: number
    sql: ${TABLE}.nib6897 ;;
  }

  dimension: nib6898 {
    type: number
    sql: ${TABLE}.nib6898 ;;
  }

  dimension: nib6899 {
    type: number
    sql: ${TABLE}.nib6899 ;;
  }

  dimension: nib7467 {
    type: number
    sql: ${TABLE}.nib7467 ;;
  }

  dimension: nib7468 {
    type: number
    sql: ${TABLE}.nib7468 ;;
  }

  dimension: nib7470 {
    type: number
    sql: ${TABLE}.nib7470 ;;
  }

  dimension: nib7473 {
    type: number
    sql: ${TABLE}.nib7473 ;;
  }

  dimension: nib7478 {
    type: number
    sql: ${TABLE}.nib7478 ;;
  }

  dimension: nib7600_01 {
    type: number
    sql: ${TABLE}.nib7600_01 ;;
  }

  dimension: nib7600_02 {
    type: number
    sql: ${TABLE}.nib7600_02 ;;
  }

  dimension: nib7600_03 {
    type: number
    sql: ${TABLE}.nib7600_03 ;;
  }

  dimension: nib7600_04 {
    type: number
    sql: ${TABLE}.nib7600_04 ;;
  }

  dimension: nib7600_05 {
    type: number
    sql: ${TABLE}.nib7600_05 ;;
  }

  dimension: nib7600_06 {
    type: number
    sql: ${TABLE}.nib7600_06 ;;
  }

  dimension: nib7600_07 {
    type: number
    sql: ${TABLE}.nib7600_07 ;;
  }

  dimension: nib7600_08 {
    type: number
    sql: ${TABLE}.nib7600_08 ;;
  }

  dimension: nib7600_09 {
    type: number
    sql: ${TABLE}.nib7600_09 ;;
  }

  dimension: nib7600_10 {
    type: number
    sql: ${TABLE}.nib7600_10 ;;
  }

  dimension: nib7600_11 {
    type: number
    sql: ${TABLE}.nib7600_11 ;;
  }

  dimension: nib7600_12 {
    type: number
    sql: ${TABLE}.nib7600_12 ;;
  }

  dimension: nib7600_13 {
    type: number
    sql: ${TABLE}.nib7600_13 ;;
  }

  dimension: nib7600_14 {
    type: number
    sql: ${TABLE}.nib7600_14 ;;
  }

  dimension: nib7600_15 {
    type: number
    sql: ${TABLE}.nib7600_15 ;;
  }

  dimension: nib7600_16 {
    type: number
    sql: ${TABLE}.nib7600_16 ;;
  }

  dimension: nib7600_17 {
    type: number
    sql: ${TABLE}.nib7600_17 ;;
  }

  dimension: nib7600_18 {
    type: number
    sql: ${TABLE}.nib7600_18 ;;
  }

  dimension: nib7600_18_24 {
    type: number
    sql: ${TABLE}.nib7600_18_24 ;;
  }

  dimension: nib7600_19 {
    type: number
    sql: ${TABLE}.nib7600_19 ;;
  }

  dimension: nib7600_20 {
    type: number
    sql: ${TABLE}.nib7600_20 ;;
  }

  dimension: nib7600_21 {
    type: number
    sql: ${TABLE}.nib7600_21 ;;
  }

  dimension: nib7600_25_34 {
    type: number
    sql: ${TABLE}.nib7600_25_34 ;;
  }

  dimension: nib7600_35_44 {
    type: number
    sql: ${TABLE}.nib7600_35_44 ;;
  }

  dimension: nib7600_45_54 {
    type: number
    sql: ${TABLE}.nib7600_45_54 ;;
  }

  dimension: nib7600_55_64 {
    type: number
    sql: ${TABLE}.nib7600_55_64 ;;
  }

  dimension: nib7600_65_74 {
    type: number
    sql: ${TABLE}.nib7600_65_74 ;;
  }

  dimension: nib7600_75_plus {
    type: number
    sql: ${TABLE}.nib7600_75_plus ;;
  }

  dimension: nib7601_00_02 {
    type: number
    sql: ${TABLE}.nib7601_00_02 ;;
  }

  dimension: nib7601_01 {
    type: number
    sql: ${TABLE}.nib7601_01 ;;
  }

  dimension: nib7601_02 {
    type: number
    sql: ${TABLE}.nib7601_02 ;;
  }

  dimension: nib7601_03 {
    type: number
    sql: ${TABLE}.nib7601_03 ;;
  }

  dimension: nib7601_03_05 {
    type: number
    sql: ${TABLE}.nib7601_03_05 ;;
  }

  dimension: nib7601_04 {
    type: number
    sql: ${TABLE}.nib7601_04 ;;
  }

  dimension: nib7601_05 {
    type: number
    sql: ${TABLE}.nib7601_05 ;;
  }

  dimension: nib7601_06 {
    type: number
    sql: ${TABLE}.nib7601_06 ;;
  }

  dimension: nib7601_06_10 {
    type: number
    sql: ${TABLE}.nib7601_06_10 ;;
  }

  dimension: nib7601_07 {
    type: number
    sql: ${TABLE}.nib7601_07 ;;
  }

  dimension: nib7601_08 {
    type: number
    sql: ${TABLE}.nib7601_08 ;;
  }

  dimension: nib7601_09 {
    type: number
    sql: ${TABLE}.nib7601_09 ;;
  }

  dimension: nib7601_10 {
    type: number
    sql: ${TABLE}.nib7601_10 ;;
  }

  dimension: nib7601_11 {
    type: number
    sql: ${TABLE}.nib7601_11 ;;
  }

  dimension: nib7601_11_15 {
    type: number
    sql: ${TABLE}.nib7601_11_15 ;;
  }

  dimension: nib7601_12 {
    type: number
    sql: ${TABLE}.nib7601_12 ;;
  }

  dimension: nib7601_13 {
    type: number
    sql: ${TABLE}.nib7601_13 ;;
  }

  dimension: nib7601_14 {
    type: number
    sql: ${TABLE}.nib7601_14 ;;
  }

  dimension: nib7601_15 {
    type: number
    sql: ${TABLE}.nib7601_15 ;;
  }

  dimension: nib7601_16_17 {
    type: number
    sql: ${TABLE}.nib7601_16_17 ;;
  }

  dimension: nib7602_01 {
    type: string
    sql: ${TABLE}.nib7602_01 ;;
  }

  dimension: nib7607_01 {
    type: string
    sql: ${TABLE}.nib7607_01 ;;
  }

  dimension: nib760900a_m {
    type: number
    sql: ${TABLE}.nib760900a_M ;;
  }

  dimension: nib760900a_s {
    type: number
    sql: ${TABLE}.nib760900a_S ;;
  }

  dimension: nib7616_01 {
    type: string
    sql: ${TABLE}.nib7616_01 ;;
  }

  dimension: nib7622_01 {
    type: number
    sql: ${TABLE}.nib7622_01 ;;
  }

  dimension: nib7628_01 {
    type: string
    sql: ${TABLE}.nib7628_01 ;;
  }

  dimension: nib7629_01 {
    type: string
    sql: ${TABLE}.nib7629_01 ;;
  }

  dimension: nib7719 {
    type: number
    sql: ${TABLE}.nib7719 ;;
  }

  dimension: nib7720 {
    type: number
    sql: ${TABLE}.nib7720 ;;
  }

  dimension: nib7721 {
    type: number
    sql: ${TABLE}.nib7721 ;;
  }

  dimension: nib7723 {
    type: number
    sql: ${TABLE}.nib7723 ;;
  }

  dimension: nib7724 {
    type: number
    sql: ${TABLE}.nib7724 ;;
  }

  dimension: nib7725 {
    type: number
    sql: ${TABLE}.nib7725 ;;
  }

  dimension: nib7726 {
    type: number
    sql: ${TABLE}.nib7726 ;;
  }

  dimension: nib7727 {
    type: number
    sql: ${TABLE}.nib7727 ;;
  }

  dimension: nib7728 {
    type: number
    sql: ${TABLE}.nib7728 ;;
  }

  dimension: nib7729 {
    type: number
    sql: ${TABLE}.nib7729 ;;
  }

  dimension: nib7730 {
    type: number
    sql: ${TABLE}.nib7730 ;;
  }

  dimension: nib7732 {
    type: number
    sql: ${TABLE}.nib7732 ;;
  }

  dimension: nib7733 {
    type: number
    sql: ${TABLE}.nib7733 ;;
  }

  dimension: nib7734 {
    type: number
    sql: ${TABLE}.nib7734 ;;
  }

  dimension: nib7735 {
    type: number
    sql: ${TABLE}.nib7735 ;;
  }

  dimension: nib7736 {
    type: number
    sql: ${TABLE}.nib7736 ;;
  }

  dimension: nib7737 {
    type: number
    sql: ${TABLE}.nib7737 ;;
  }

  dimension: nib7738 {
    type: number
    sql: ${TABLE}.nib7738 ;;
  }

  dimension: nib7739 {
    type: number
    sql: ${TABLE}.nib7739 ;;
  }

  dimension: nib7740 {
    type: number
    sql: ${TABLE}.nib7740 ;;
  }

  dimension: nib7741 {
    type: number
    sql: ${TABLE}.nib7741 ;;
  }

  dimension: nib7742 {
    type: number
    sql: ${TABLE}.nib7742 ;;
  }

  dimension: nib7743 {
    type: number
    sql: ${TABLE}.nib7743 ;;
  }

  dimension: nib7744 {
    type: number
    sql: ${TABLE}.nib7744 ;;
  }

  dimension: nib7746 {
    type: number
    sql: ${TABLE}.nib7746 ;;
  }

  dimension: nib7747 {
    type: number
    sql: ${TABLE}.nib7747 ;;
  }

  dimension: nib7748 {
    type: number
    sql: ${TABLE}.nib7748 ;;
  }

  dimension: nib7750 {
    type: number
    sql: ${TABLE}.nib7750 ;;
  }

  dimension: nib7751 {
    type: number
    sql: ${TABLE}.nib7751 ;;
  }

  dimension: nib7752 {
    type: number
    sql: ${TABLE}.nib7752 ;;
  }

  dimension: nib7753 {
    type: number
    sql: ${TABLE}.nib7753 ;;
  }

  dimension: nib7754 {
    type: number
    sql: ${TABLE}.nib7754 ;;
  }

  dimension: nib7755 {
    type: number
    sql: ${TABLE}.nib7755 ;;
  }

  dimension: nib7756 {
    type: number
    sql: ${TABLE}.nib7756 ;;
  }

  dimension: nib7757 {
    type: number
    sql: ${TABLE}.nib7757 ;;
  }

  dimension: nib7758 {
    type: number
    sql: ${TABLE}.nib7758 ;;
  }

  dimension: nib7759 {
    type: number
    sql: ${TABLE}.nib7759 ;;
  }

  dimension: nib7760 {
    type: number
    sql: ${TABLE}.nib7760 ;;
  }

  dimension: nib7761 {
    type: number
    sql: ${TABLE}.nib7761 ;;
  }

  dimension: nib7762 {
    type: number
    sql: ${TABLE}.nib7762 ;;
  }

  dimension: nib7763 {
    type: number
    sql: ${TABLE}.nib7763 ;;
  }

  dimension: nib7764 {
    type: number
    sql: ${TABLE}.nib7764 ;;
  }

  dimension: nib7766 {
    type: number
    sql: ${TABLE}.nib7766 ;;
  }

  dimension: nib7768 {
    type: number
    sql: ${TABLE}.nib7768 ;;
  }

  dimension: nib7770 {
    type: number
    sql: ${TABLE}.nib7770 ;;
  }

  dimension: nib7771 {
    type: number
    sql: ${TABLE}.nib7771 ;;
  }

  dimension: nib7772 {
    type: number
    sql: ${TABLE}.nib7772 ;;
  }

  dimension: nib7773 {
    type: number
    sql: ${TABLE}.nib7773 ;;
  }

  dimension: nib7774 {
    type: number
    sql: ${TABLE}.nib7774 ;;
  }

  dimension: nib7775 {
    type: number
    sql: ${TABLE}.nib7775 ;;
  }

  dimension: nib7777 {
    type: number
    sql: ${TABLE}.nib7777 ;;
  }

  dimension: nib7779 {
    type: number
    sql: ${TABLE}.nib7779 ;;
  }

  dimension: nib7780 {
    type: number
    sql: ${TABLE}.nib7780 ;;
  }

  dimension: nib7781 {
    type: number
    sql: ${TABLE}.nib7781 ;;
  }

  dimension: nib7782 {
    type: number
    sql: ${TABLE}.nib7782 ;;
  }

  dimension: nib7783 {
    type: number
    sql: ${TABLE}.nib7783 ;;
  }

  dimension: nib7784 {
    type: number
    sql: ${TABLE}.nib7784 ;;
  }

  dimension: nib7785 {
    type: number
    sql: ${TABLE}.nib7785 ;;
  }

  dimension: nib7786 {
    type: number
    sql: ${TABLE}.nib7786 ;;
  }

  dimension: nib7787 {
    type: number
    sql: ${TABLE}.nib7787 ;;
  }

  dimension: nib7788 {
    type: number
    sql: ${TABLE}.nib7788 ;;
  }

  dimension: nib7789 {
    type: number
    sql: ${TABLE}.nib7789 ;;
  }

  dimension: nib7790 {
    type: number
    sql: ${TABLE}.nib7790 ;;
  }

  dimension: nib7791 {
    type: number
    sql: ${TABLE}.nib7791 ;;
  }

  dimension: nib7792 {
    type: number
    sql: ${TABLE}.nib7792 ;;
  }

  dimension: nib7793 {
    type: number
    sql: ${TABLE}.nib7793 ;;
  }

  dimension: nib7794 {
    type: number
    sql: ${TABLE}.nib7794 ;;
  }

  dimension: nib7795 {
    type: number
    sql: ${TABLE}.nib7795 ;;
  }

  dimension: nib7796 {
    type: number
    sql: ${TABLE}.nib7796 ;;
  }

  dimension: nib7799 {
    type: number
    sql: ${TABLE}.nib7799 ;;
  }

  dimension: nib7801 {
    type: number
    sql: ${TABLE}.nib7801 ;;
  }

  dimension: nib7802 {
    type: number
    sql: ${TABLE}.nib7802 ;;
  }

  dimension: nib7803 {
    type: number
    sql: ${TABLE}.nib7803 ;;
  }

  dimension: nib7804 {
    type: number
    sql: ${TABLE}.nib7804 ;;
  }

  dimension: nib7805 {
    type: number
    sql: ${TABLE}.nib7805 ;;
  }

  dimension: nib7807 {
    type: number
    sql: ${TABLE}.nib7807 ;;
  }

  dimension: nib7808 {
    type: number
    sql: ${TABLE}.nib7808 ;;
  }

  dimension: nib7809 {
    type: number
    sql: ${TABLE}.nib7809 ;;
  }

  dimension: nib7810 {
    type: number
    sql: ${TABLE}.nib7810 ;;
  }

  dimension: nib7811 {
    type: number
    sql: ${TABLE}.nib7811 ;;
  }

  dimension: nib7812 {
    type: number
    sql: ${TABLE}.nib7812 ;;
  }

  dimension: nib7813 {
    type: number
    sql: ${TABLE}.nib7813 ;;
  }

  dimension: nib7814 {
    type: number
    sql: ${TABLE}.nib7814 ;;
  }

  dimension: nib7815 {
    type: number
    sql: ${TABLE}.nib7815 ;;
  }

  dimension: nib7816 {
    type: number
    sql: ${TABLE}.nib7816 ;;
  }

  dimension: nib7817 {
    type: number
    sql: ${TABLE}.nib7817 ;;
  }

  dimension: nib7821 {
    type: number
    sql: ${TABLE}.nib7821 ;;
  }

  dimension: nib7822 {
    type: number
    sql: ${TABLE}.nib7822 ;;
  }

  dimension: nib7823 {
    type: number
    sql: ${TABLE}.nib7823 ;;
  }

  dimension: nib7824 {
    type: number
    sql: ${TABLE}.nib7824 ;;
  }

  dimension: nib7825 {
    type: number
    sql: ${TABLE}.nib7825 ;;
  }

  dimension: nib7826 {
    type: number
    sql: ${TABLE}.nib7826 ;;
  }

  dimension: nib7827 {
    type: number
    sql: ${TABLE}.nib7827 ;;
  }

  dimension: nib7828 {
    type: number
    sql: ${TABLE}.nib7828 ;;
  }

  dimension: nib7829 {
    type: number
    sql: ${TABLE}.nib7829 ;;
  }

  dimension: nib7830 {
    type: number
    sql: ${TABLE}.nib7830 ;;
  }

  dimension: nib7831 {
    type: number
    sql: ${TABLE}.nib7831 ;;
  }

  dimension: nib7832 {
    type: number
    sql: ${TABLE}.nib7832 ;;
  }

  dimension: nib7841 {
    type: number
    sql: ${TABLE}.nib7841 ;;
  }

  dimension: nib7843 {
    type: number
    sql: ${TABLE}.nib7843 ;;
  }

  dimension: nib7844 {
    type: number
    sql: ${TABLE}.nib7844 ;;
  }

  dimension: nib7847 {
    type: number
    sql: ${TABLE}.nib7847 ;;
  }

  dimension: nib7848 {
    type: number
    sql: ${TABLE}.nib7848 ;;
  }

  dimension: nib7849 {
    type: number
    sql: ${TABLE}.nib7849 ;;
  }

  dimension: nib7851 {
    type: number
    sql: ${TABLE}.nib7851 ;;
  }

  dimension: nib8082 {
    type: number
    sql: ${TABLE}.nib8082 ;;
  }

  dimension: nib8165_01 {
    type: number
    sql: ${TABLE}.nib8165_01 ;;
  }

  dimension: nib8165_02 {
    type: number
    sql: ${TABLE}.nib8165_02 ;;
  }

  dimension: nib8165_03 {
    type: number
    sql: ${TABLE}.nib8165_03 ;;
  }

  dimension: nib8167_01 {
    type: number
    sql: ${TABLE}.nib8167_01 ;;
  }

  dimension: nib8167_02 {
    type: number
    sql: ${TABLE}.nib8167_02 ;;
  }

  dimension: nib8167_03 {
    type: number
    sql: ${TABLE}.nib8167_03 ;;
  }

  dimension: nib8167_04 {
    type: number
    sql: ${TABLE}.nib8167_04 ;;
  }

  dimension: nib8167_05 {
    type: number
    sql: ${TABLE}.nib8167_05 ;;
  }

  dimension: nib8167_06 {
    type: number
    sql: ${TABLE}.nib8167_06 ;;
  }

  dimension: nib8167_07 {
    type: number
    sql: ${TABLE}.nib8167_07 ;;
  }

  dimension: nib8167_08 {
    type: number
    sql: ${TABLE}.nib8167_08 ;;
  }

  dimension: nib8167_09 {
    type: number
    sql: ${TABLE}.nib8167_09 ;;
  }

  dimension: nib8167_10 {
    type: number
    sql: ${TABLE}.nib8167_10 ;;
  }

  dimension: nib8167_11 {
    type: number
    sql: ${TABLE}.nib8167_11 ;;
  }

  dimension: nib8167_12 {
    type: number
    sql: ${TABLE}.nib8167_12 ;;
  }

  dimension: nib8167_13 {
    type: number
    sql: ${TABLE}.nib8167_13 ;;
  }

  dimension: nib8167_14 {
    type: number
    sql: ${TABLE}.nib8167_14 ;;
  }

  dimension: nib8167_15 {
    type: number
    sql: ${TABLE}.nib8167_15 ;;
  }

  dimension: nib8167_16 {
    type: number
    sql: ${TABLE}.nib8167_16 ;;
  }

  dimension: nib8167_17 {
    type: number
    sql: ${TABLE}.nib8167_17 ;;
  }

  dimension: nib8167_18 {
    type: number
    sql: ${TABLE}.nib8167_18 ;;
  }

  dimension: nib8167_19 {
    type: number
    sql: ${TABLE}.nib8167_19 ;;
  }

  dimension: nib8167_20 {
    type: number
    sql: ${TABLE}.nib8167_20 ;;
  }

  dimension: nib8167_21 {
    type: number
    sql: ${TABLE}.nib8167_21 ;;
  }

  dimension: nib8167_22 {
    type: number
    sql: ${TABLE}.nib8167_22 ;;
  }

  dimension: nib8167_23 {
    type: number
    sql: ${TABLE}.nib8167_23 ;;
  }

  dimension: nib8167_24 {
    type: number
    sql: ${TABLE}.nib8167_24 ;;
  }

  dimension: nib8167_25 {
    type: number
    sql: ${TABLE}.nib8167_25 ;;
  }

  dimension: nib8167_26 {
    type: number
    sql: ${TABLE}.nib8167_26 ;;
  }

  dimension: nib8167_27 {
    type: number
    sql: ${TABLE}.nib8167_27 ;;
  }

  dimension: nib8167_28 {
    type: number
    sql: ${TABLE}.nib8167_28 ;;
  }

  dimension: nib8167_29 {
    type: number
    sql: ${TABLE}.nib8167_29 ;;
  }

  dimension: nib8167_30 {
    type: number
    sql: ${TABLE}.nib8167_30 ;;
  }

  dimension: nib8167_31 {
    type: number
    sql: ${TABLE}.nib8167_31 ;;
  }

  dimension: nib8177 {
    type: number
    sql: ${TABLE}.nib8177 ;;
  }

  dimension: nib8236 {
    type: number
    sql: ${TABLE}.nib8236 ;;
  }

  dimension: nib8257 {
    type: number
    sql: ${TABLE}.nib8257 ;;
  }

  dimension: nib8263 {
    type: number
    sql: ${TABLE}.nib8263 ;;
  }

  dimension: nib8271 {
    type: number
    sql: ${TABLE}.nib8271 ;;
  }

  dimension: nib8272 {
    type: number
    sql: ${TABLE}.nib8272 ;;
  }

  dimension: nib8274 {
    type: number
    sql: ${TABLE}.nib8274 ;;
  }

  dimension: nib8276 {
    type: number
    sql: ${TABLE}.nib8276 ;;
  }

  dimension: nib8277 {
    type: number
    sql: ${TABLE}.nib8277 ;;
  }

  dimension: nib8278 {
    type: number
    sql: ${TABLE}.nib8278 ;;
  }

  dimension: nib8279 {
    type: number
    sql: ${TABLE}.nib8279 ;;
  }

  dimension: nib8321 {
    type: number
    sql: ${TABLE}.nib8321 ;;
  }

  dimension: nib8322 {
    type: number
    sql: ${TABLE}.nib8322 ;;
  }

  dimension: nib8326 {
    type: number
    sql: ${TABLE}.nib8326 ;;
  }

  dimension: nib8337 {
    type: number
    sql: ${TABLE}.nib8337 ;;
  }

  dimension: nib8339 {
    type: number
    sql: ${TABLE}.nib8339 ;;
  }

  dimension: nib8433 {
    type: string
    sql: ${TABLE}.nib8433 ;;
  }

  dimension: nib8436 {
    type: number
    sql: ${TABLE}.nib8436 ;;
  }

  dimension: nib8438 {
    type: number
    sql: ${TABLE}.nib8438 ;;
  }

  dimension: nib8439 {
    type: number
    sql: ${TABLE}.nib8439 ;;
  }

  dimension: nib8440 {
    type: number
    sql: ${TABLE}.nib8440 ;;
  }

  dimension: nib8441 {
    type: number
    sql: ${TABLE}.nib8441 ;;
  }

  dimension: nib8442 {
    type: string
    sql: ${TABLE}.nib8442 ;;
  }

  dimension: nib8443_b {
    type: number
    sql: ${TABLE}.nib8443_B ;;
  }

  dimension: nib8443_c {
    type: number
    sql: ${TABLE}.nib8443_C ;;
  }

  dimension: nib8443_h {
    type: number
    sql: ${TABLE}.nib8443_H ;;
  }

  dimension: nib8444_01 {
    type: number
    sql: ${TABLE}.nib8444_01 ;;
  }

  dimension: nib8444_02 {
    type: number
    sql: ${TABLE}.nib8444_02 ;;
  }

  dimension: nib8444_03 {
    type: number
    sql: ${TABLE}.nib8444_03 ;;
  }

  dimension: nib8444_04 {
    type: number
    sql: ${TABLE}.nib8444_04 ;;
  }

  dimension: nib8444_05 {
    type: number
    sql: ${TABLE}.nib8444_05 ;;
  }

  dimension: nib8444_06 {
    type: number
    sql: ${TABLE}.nib8444_06 ;;
  }

  dimension: nib8444_07 {
    type: number
    sql: ${TABLE}.nib8444_07 ;;
  }

  dimension: nib8444_08 {
    type: number
    sql: ${TABLE}.nib8444_08 ;;
  }

  dimension: nib8444_09 {
    type: number
    sql: ${TABLE}.nib8444_09 ;;
  }

  dimension: nib8444_10 {
    type: number
    sql: ${TABLE}.nib8444_10 ;;
  }

  dimension: nib8444_11 {
    type: number
    sql: ${TABLE}.nib8444_11 ;;
  }

  dimension: nib8444_12 {
    type: number
    sql: ${TABLE}.nib8444_12 ;;
  }

  dimension: nib8444_13 {
    type: number
    sql: ${TABLE}.nib8444_13 ;;
  }

  dimension: nib8444_14 {
    type: number
    sql: ${TABLE}.nib8444_14 ;;
  }

  dimension: nib8444_15 {
    type: number
    sql: ${TABLE}.nib8444_15 ;;
  }

  dimension: nib8444_16 {
    type: number
    sql: ${TABLE}.nib8444_16 ;;
  }

  dimension: nib8444_17 {
    type: number
    sql: ${TABLE}.nib8444_17 ;;
  }

  dimension: nib8444_18 {
    type: number
    sql: ${TABLE}.nib8444_18 ;;
  }

  dimension: nib8444_19 {
    type: number
    sql: ${TABLE}.nib8444_19 ;;
  }

  dimension: nib8444_20 {
    type: number
    sql: ${TABLE}.nib8444_20 ;;
  }

  dimension: nib8444_21 {
    type: number
    sql: ${TABLE}.nib8444_21 ;;
  }

  dimension: nib8444_22 {
    type: number
    sql: ${TABLE}.nib8444_22 ;;
  }

  dimension: nib8444_23 {
    type: number
    sql: ${TABLE}.nib8444_23 ;;
  }

  dimension: nib8444_24 {
    type: number
    sql: ${TABLE}.nib8444_24 ;;
  }

  dimension: nib8444_25 {
    type: number
    sql: ${TABLE}.nib8444_25 ;;
  }

  dimension: nib8444_26 {
    type: number
    sql: ${TABLE}.nib8444_26 ;;
  }

  dimension: nib8444_27 {
    type: number
    sql: ${TABLE}.nib8444_27 ;;
  }

  dimension: nib8444_28 {
    type: number
    sql: ${TABLE}.nib8444_28 ;;
  }

  dimension: nib8444_29 {
    type: number
    sql: ${TABLE}.nib8444_29 ;;
  }

  dimension: nib8444_30 {
    type: number
    sql: ${TABLE}.nib8444_30 ;;
  }

  dimension: nib8444_31 {
    type: number
    sql: ${TABLE}.nib8444_31 ;;
  }

  dimension: nib8444_32 {
    type: number
    sql: ${TABLE}.nib8444_32 ;;
  }

  dimension: nib8444_33 {
    type: number
    sql: ${TABLE}.nib8444_33 ;;
  }

  dimension: nib8444_34 {
    type: number
    sql: ${TABLE}.nib8444_34 ;;
  }

  dimension: nib8444_35 {
    type: number
    sql: ${TABLE}.nib8444_35 ;;
  }

  dimension: nib8444_36 {
    type: number
    sql: ${TABLE}.nib8444_36 ;;
  }

  dimension: nib8444_37 {
    type: number
    sql: ${TABLE}.nib8444_37 ;;
  }

  dimension: nib8444_38 {
    type: number
    sql: ${TABLE}.nib8444_38 ;;
  }

  dimension: nib8444_39 {
    type: number
    sql: ${TABLE}.nib8444_39 ;;
  }

  dimension: nib8444_40 {
    type: number
    sql: ${TABLE}.nib8444_40 ;;
  }

  dimension: nib8444_41 {
    type: number
    sql: ${TABLE}.nib8444_41 ;;
  }

  dimension: nib8444_42 {
    type: number
    sql: ${TABLE}.nib8444_42 ;;
  }

  dimension: nib8444_43 {
    type: number
    sql: ${TABLE}.nib8444_43 ;;
  }

  dimension: nib8444_44 {
    type: number
    sql: ${TABLE}.nib8444_44 ;;
  }

  dimension: nib8444_45 {
    type: number
    sql: ${TABLE}.nib8444_45 ;;
  }

  dimension: nib8444_46 {
    type: number
    sql: ${TABLE}.nib8444_46 ;;
  }

  dimension: nib8444_47 {
    type: number
    sql: ${TABLE}.nib8444_47 ;;
  }

  dimension: nib8444_48 {
    type: number
    sql: ${TABLE}.nib8444_48 ;;
  }

  dimension: nib8444_49 {
    type: number
    sql: ${TABLE}.nib8444_49 ;;
  }

  dimension: nib8444_50 {
    type: number
    sql: ${TABLE}.nib8444_50 ;;
  }

  dimension: nib8444_51 {
    type: number
    sql: ${TABLE}.nib8444_51 ;;
  }

  dimension: nib8444_52 {
    type: number
    sql: ${TABLE}.nib8444_52 ;;
  }

  dimension: nib8444_53 {
    type: number
    sql: ${TABLE}.nib8444_53 ;;
  }

  dimension: nib8444_54 {
    type: number
    sql: ${TABLE}.nib8444_54 ;;
  }

  dimension: nib8444_55 {
    type: number
    sql: ${TABLE}.nib8444_55 ;;
  }

  dimension: nib8444_56 {
    type: number
    sql: ${TABLE}.nib8444_56 ;;
  }

  dimension: nib8444_57 {
    type: number
    sql: ${TABLE}.nib8444_57 ;;
  }

  dimension: nib8444_59 {
    type: number
    sql: ${TABLE}.nib8444_59 ;;
  }

  dimension: nib8444_60 {
    type: number
    sql: ${TABLE}.nib8444_60 ;;
  }

  dimension: nib8444_61 {
    type: number
    sql: ${TABLE}.nib8444_61 ;;
  }

  dimension: nib8444_62 {
    type: number
    sql: ${TABLE}.nib8444_62 ;;
  }

  dimension: nib8444_63 {
    type: number
    sql: ${TABLE}.nib8444_63 ;;
  }

  dimension: nib8444_64 {
    type: number
    sql: ${TABLE}.nib8444_64 ;;
  }

  dimension: nib8444_65 {
    type: number
    sql: ${TABLE}.nib8444_65 ;;
  }

  dimension: nib8444_66 {
    type: number
    sql: ${TABLE}.nib8444_66 ;;
  }

  dimension: nib8444_67 {
    type: number
    sql: ${TABLE}.nib8444_67 ;;
  }

  dimension: nib8444_68 {
    type: number
    sql: ${TABLE}.nib8444_68 ;;
  }

  dimension: nib8444_69 {
    type: number
    sql: ${TABLE}.nib8444_69 ;;
  }

  dimension: nib8444_70 {
    type: number
    sql: ${TABLE}.nib8444_70 ;;
  }

  dimension: nib8444_71 {
    type: number
    sql: ${TABLE}.nib8444_71 ;;
  }

  dimension: nib8444_72 {
    type: number
    sql: ${TABLE}.nib8444_72 ;;
  }

  dimension: nib8444_73 {
    type: number
    sql: ${TABLE}.nib8444_73 ;;
  }

  dimension: nib8444_74 {
    type: number
    sql: ${TABLE}.nib8444_74 ;;
  }

  dimension: nib8444_75 {
    type: number
    sql: ${TABLE}.nib8444_75 ;;
  }

  dimension: nib8444_76 {
    type: number
    sql: ${TABLE}.nib8444_76 ;;
  }

  dimension: nib8444_77 {
    type: number
    sql: ${TABLE}.nib8444_77 ;;
  }

  dimension: nib8444_78 {
    type: number
    sql: ${TABLE}.nib8444_78 ;;
  }

  dimension: nib8444_79 {
    type: number
    sql: ${TABLE}.nib8444_79 ;;
  }

  dimension: nib8444_80 {
    type: number
    sql: ${TABLE}.nib8444_80 ;;
  }

  dimension: nib8444_81 {
    type: number
    sql: ${TABLE}.nib8444_81 ;;
  }

  dimension: nib8444_82 {
    type: number
    sql: ${TABLE}.nib8444_82 ;;
  }

  dimension: nib8444_83 {
    type: number
    sql: ${TABLE}.nib8444_83 ;;
  }

  dimension: nib8444_84 {
    type: number
    sql: ${TABLE}.nib8444_84 ;;
  }

  dimension: nib8444_85 {
    type: number
    sql: ${TABLE}.nib8444_85 ;;
  }

  dimension: nib8444_86 {
    type: number
    sql: ${TABLE}.nib8444_86 ;;
  }

  dimension: nib8444_87 {
    type: number
    sql: ${TABLE}.nib8444_87 ;;
  }

  dimension: nib8444_88 {
    type: number
    sql: ${TABLE}.nib8444_88 ;;
  }

  dimension: nib8444_89 {
    type: number
    sql: ${TABLE}.nib8444_89 ;;
  }

  dimension: nib8444_90 {
    type: number
    sql: ${TABLE}.nib8444_90 ;;
  }

  dimension: nib8444_91 {
    type: number
    sql: ${TABLE}.nib8444_91 ;;
  }

  dimension: nib8444_92 {
    type: number
    sql: ${TABLE}.nib8444_92 ;;
  }

  dimension: nib8444_93 {
    type: number
    sql: ${TABLE}.nib8444_93 ;;
  }

  dimension: nib8445_01 {
    type: number
    sql: ${TABLE}.nib8445_01 ;;
  }

  dimension: nib8445_02 {
    type: number
    sql: ${TABLE}.nib8445_02 ;;
  }

  dimension: nib8445_03 {
    type: number
    sql: ${TABLE}.nib8445_03 ;;
  }

  dimension: nib8445_04 {
    type: number
    sql: ${TABLE}.nib8445_04 ;;
  }

  dimension: nib8445_05 {
    type: number
    sql: ${TABLE}.nib8445_05 ;;
  }

  dimension: nib8445_06 {
    type: number
    sql: ${TABLE}.nib8445_06 ;;
  }

  dimension: nib8445_07 {
    type: number
    sql: ${TABLE}.nib8445_07 ;;
  }

  dimension: nib8445_08 {
    type: number
    sql: ${TABLE}.nib8445_08 ;;
  }

  dimension: nib8445_09 {
    type: number
    sql: ${TABLE}.nib8445_09 ;;
  }

  dimension: nib8445_10 {
    type: number
    sql: ${TABLE}.nib8445_10 ;;
  }

  dimension: nib8445_11 {
    type: number
    sql: ${TABLE}.nib8445_11 ;;
  }

  dimension: nib8445_12 {
    type: number
    sql: ${TABLE}.nib8445_12 ;;
  }

  dimension: nib8445_13 {
    type: number
    sql: ${TABLE}.nib8445_13 ;;
  }

  dimension: nib8445_14 {
    type: number
    sql: ${TABLE}.nib8445_14 ;;
  }

  dimension: nib8445_15 {
    type: number
    sql: ${TABLE}.nib8445_15 ;;
  }

  dimension: nib8445_16 {
    type: number
    sql: ${TABLE}.nib8445_16 ;;
  }

  dimension: nib8445_17 {
    type: number
    sql: ${TABLE}.nib8445_17 ;;
  }

  dimension: nib8445_18 {
    type: number
    sql: ${TABLE}.nib8445_18 ;;
  }

  dimension: nib8445_19 {
    type: number
    sql: ${TABLE}.nib8445_19 ;;
  }

  dimension: nib8445_20 {
    type: number
    sql: ${TABLE}.nib8445_20 ;;
  }

  dimension: nib8445_21 {
    type: number
    sql: ${TABLE}.nib8445_21 ;;
  }

  dimension: nib8445_22 {
    type: number
    sql: ${TABLE}.nib8445_22 ;;
  }

  dimension: nib8445_23 {
    type: number
    sql: ${TABLE}.nib8445_23 ;;
  }

  dimension: nib8445_24 {
    type: number
    sql: ${TABLE}.nib8445_24 ;;
  }

  dimension: nib8445_25 {
    type: number
    sql: ${TABLE}.nib8445_25 ;;
  }

  dimension: nib8487_d {
    type: number
    sql: ${TABLE}.nib8487_D ;;
  }

  dimension: nib8487_i {
    type: number
    sql: ${TABLE}.nib8487_I ;;
  }

  dimension: nib8487_r {
    type: number
    sql: ${TABLE}.nib8487_R ;;
  }

  dimension: nib8487_v {
    type: number
    sql: ${TABLE}.nib8487_V ;;
  }

  dimension: nib8496_d {
    type: number
    sql: ${TABLE}.nib8496_D ;;
  }

  dimension: nib8496_i {
    type: number
    sql: ${TABLE}.nib8496_I ;;
  }

  dimension: nib8496_r {
    type: number
    sql: ${TABLE}.nib8496_R ;;
  }

  dimension: nib8496_v {
    type: number
    sql: ${TABLE}.nib8496_V ;;
  }

  dimension: nib8505_d {
    type: number
    sql: ${TABLE}.nib8505_D ;;
  }

  dimension: nib8505_i {
    type: number
    sql: ${TABLE}.nib8505_I ;;
  }

  dimension: nib8505_r {
    type: number
    sql: ${TABLE}.nib8505_R ;;
  }

  dimension: nib8505_v {
    type: number
    sql: ${TABLE}.nib8505_V ;;
  }

  dimension: nib8514_d {
    type: number
    sql: ${TABLE}.nib8514_D ;;
  }

  dimension: nib8514_i {
    type: number
    sql: ${TABLE}.nib8514_I ;;
  }

  dimension: nib8514_r {
    type: number
    sql: ${TABLE}.nib8514_R ;;
  }

  dimension: nib8514_v {
    type: number
    sql: ${TABLE}.nib8514_V ;;
  }

  dimension: nib8523_d {
    type: number
    sql: ${TABLE}.nib8523_D ;;
  }

  dimension: nib8523_i {
    type: number
    sql: ${TABLE}.nib8523_I ;;
  }

  dimension: nib8523_r {
    type: number
    sql: ${TABLE}.nib8523_R ;;
  }

  dimension: nib8523_v {
    type: number
    sql: ${TABLE}.nib8523_V ;;
  }

  dimension: nib8531_d {
    type: number
    sql: ${TABLE}.nib8531_D ;;
  }

  dimension: nib8531_i {
    type: number
    sql: ${TABLE}.nib8531_I ;;
  }

  dimension: nib8531_r {
    type: number
    sql: ${TABLE}.nib8531_R ;;
  }

  dimension: nib8531_v {
    type: number
    sql: ${TABLE}.nib8531_V ;;
  }

  dimension: nib8555_c {
    type: number
    sql: ${TABLE}.nib8555_C ;;
  }

  dimension: nib8555_e {
    type: number
    sql: ${TABLE}.nib8555_E ;;
  }

  dimension: nib8555_h {
    type: number
    sql: ${TABLE}.nib8555_H ;;
  }

  dimension: nib8555_i {
    type: number
    sql: ${TABLE}.nib8555_I ;;
  }

  dimension: nib8555_o {
    type: number
    sql: ${TABLE}.nib8555_O ;;
  }

  dimension: nib8556 {
    type: number
    sql: ${TABLE}.nib8556 ;;
  }

  dimension: nib8560_01 {
    type: number
    sql: ${TABLE}.nib8560_01 ;;
  }

  dimension: nib8560_02 {
    type: number
    sql: ${TABLE}.nib8560_02 ;;
  }

  dimension: nib8560_03 {
    type: number
    sql: ${TABLE}.nib8560_03 ;;
  }

  dimension: nib8560_04 {
    type: number
    sql: ${TABLE}.nib8560_04 ;;
  }

  dimension: nib8560_05 {
    type: number
    sql: ${TABLE}.nib8560_05 ;;
  }

  dimension: nib8560_06 {
    type: number
    sql: ${TABLE}.nib8560_06 ;;
  }

  dimension: nib8560_07 {
    type: number
    sql: ${TABLE}.nib8560_07 ;;
  }

  dimension: nib8560_08 {
    type: number
    sql: ${TABLE}.nib8560_08 ;;
  }

  dimension: nib8560_09 {
    type: number
    sql: ${TABLE}.nib8560_09 ;;
  }

  dimension: nib8560_10 {
    type: number
    sql: ${TABLE}.nib8560_10 ;;
  }

  dimension: nib8560_11 {
    type: number
    sql: ${TABLE}.nib8560_11 ;;
  }

  dimension: nib8560_12 {
    type: number
    sql: ${TABLE}.nib8560_12 ;;
  }

  dimension: nib8560_13 {
    type: number
    sql: ${TABLE}.nib8560_13 ;;
  }

  dimension: nib8560_14 {
    type: number
    sql: ${TABLE}.nib8560_14 ;;
  }

  dimension: nib8560_15 {
    type: number
    sql: ${TABLE}.nib8560_15 ;;
  }

  dimension: nib8560_16 {
    type: number
    sql: ${TABLE}.nib8560_16 ;;
  }

  dimension: nib8560_17 {
    type: number
    sql: ${TABLE}.nib8560_17 ;;
  }

  dimension: nib8560_18 {
    type: number
    sql: ${TABLE}.nib8560_18 ;;
  }

  dimension: nib8560_19 {
    type: number
    sql: ${TABLE}.nib8560_19 ;;
  }

  dimension: nib8570_c {
    type: number
    sql: ${TABLE}.nib8570_C ;;
  }

  dimension: nib8570_f {
    type: number
    sql: ${TABLE}.nib8570_F ;;
  }

  dimension: nib8570_i {
    type: number
    sql: ${TABLE}.nib8570_I ;;
  }

  dimension: nib8570_r {
    type: number
    sql: ${TABLE}.nib8570_R ;;
  }

  dimension: nib8570_v {
    type: number
    sql: ${TABLE}.nib8570_V ;;
  }

  dimension: nib8571_c {
    type: number
    sql: ${TABLE}.nib8571_C ;;
  }

  dimension: nib8571_f {
    type: number
    sql: ${TABLE}.nib8571_F ;;
  }

  dimension: nib8571_i {
    type: number
    sql: ${TABLE}.nib8571_I ;;
  }

  dimension: nib8571_r {
    type: number
    sql: ${TABLE}.nib8571_R ;;
  }

  dimension: nib8571_v {
    type: number
    sql: ${TABLE}.nib8571_V ;;
  }

  dimension: nib8572_f {
    type: number
    sql: ${TABLE}.nib8572_F ;;
  }

  dimension: nib8572_g {
    type: number
    sql: ${TABLE}.nib8572_G ;;
  }

  dimension: nib8572_v {
    type: number
    sql: ${TABLE}.nib8572_V ;;
  }

  dimension: nib8573_f {
    type: number
    sql: ${TABLE}.nib8573_F ;;
  }

  dimension: nib8573_g {
    type: number
    sql: ${TABLE}.nib8573_G ;;
  }

  dimension: nib8573_v {
    type: number
    sql: ${TABLE}.nib8573_V ;;
  }

  dimension: nib8574_f {
    type: number
    sql: ${TABLE}.nib8574_F ;;
  }

  dimension: nib8574_g {
    type: number
    sql: ${TABLE}.nib8574_G ;;
  }

  dimension: nib8574_v {
    type: number
    sql: ${TABLE}.nib8574_V ;;
  }

  dimension: nib8575_c {
    type: number
    sql: ${TABLE}.nib8575_C ;;
  }

  dimension: nib8575_e {
    type: number
    sql: ${TABLE}.nib8575_E ;;
  }

  dimension: nib8575_l {
    type: number
    sql: ${TABLE}.nib8575_L ;;
  }

  dimension: nib8575_p {
    type: number
    sql: ${TABLE}.nib8575_P ;;
  }

  dimension: nib8575_r {
    type: number
    sql: ${TABLE}.nib8575_R ;;
  }

  dimension: nib8575_s {
    type: number
    sql: ${TABLE}.nib8575_S ;;
  }

  dimension: nib8575_t {
    type: number
    sql: ${TABLE}.nib8575_T ;;
  }

  dimension: nib8576_c {
    type: number
    sql: ${TABLE}.nib8576_C ;;
  }

  dimension: nib8576_e {
    type: number
    sql: ${TABLE}.nib8576_E ;;
  }

  dimension: nib8576_l {
    type: number
    sql: ${TABLE}.nib8576_L ;;
  }

  dimension: nib8576_r {
    type: number
    sql: ${TABLE}.nib8576_R ;;
  }

  dimension: nib8576_s {
    type: number
    sql: ${TABLE}.nib8576_S ;;
  }

  dimension: nib8576_t {
    type: number
    sql: ${TABLE}.nib8576_T ;;
  }

  dimension: nib8578 {
    type: number
    sql: ${TABLE}.nib8578 ;;
  }

  dimension: nib8581_a {
    type: number
    sql: ${TABLE}.nib8581_A ;;
  }

  dimension: nib8581_b {
    type: number
    sql: ${TABLE}.nib8581_B ;;
  }

  dimension: nib8581_c {
    type: number
    sql: ${TABLE}.nib8581_C ;;
  }

  dimension: nib8581_d {
    type: number
    sql: ${TABLE}.nib8581_D ;;
  }

  dimension: nib8581_e {
    type: number
    sql: ${TABLE}.nib8581_E ;;
  }

  dimension: nib8581_g {
    type: number
    sql: ${TABLE}.nib8581_G ;;
  }

  dimension: nib8581_m {
    type: number
    sql: ${TABLE}.nib8581_M ;;
  }

  dimension: nib8581_t {
    type: number
    sql: ${TABLE}.nib8581_T ;;
  }

  dimension: nib8582 {
    type: string
    sql: ${TABLE}.nib8582 ;;
  }

  dimension: nib8587 {
    type: number
    sql: ${TABLE}.nib8587 ;;
  }

  dimension: nib8588 {
    type: string
    sql: ${TABLE}.nib8588 ;;
  }

  dimension: nib8589 {
    type: string
    sql: ${TABLE}.nib8589 ;;
  }

  dimension: nib8590_02_01 {
    type: number
    sql: ${TABLE}.nib8590_02_01 ;;
  }

  dimension: nib8590_02_02 {
    type: number
    sql: ${TABLE}.nib8590_02_02 ;;
  }

  dimension: nib8590_02_03 {
    type: number
    sql: ${TABLE}.nib8590_02_03 ;;
  }

  dimension: nib8590_02_04 {
    type: number
    sql: ${TABLE}.nib8590_02_04 ;;
  }

  dimension: nib8590_02_05 {
    type: number
    sql: ${TABLE}.nib8590_02_05 ;;
  }

  dimension: nib8590_02_06 {
    type: number
    sql: ${TABLE}.nib8590_02_06 ;;
  }

  dimension: nib8590_02_07 {
    type: number
    sql: ${TABLE}.nib8590_02_07 ;;
  }

  dimension: nib8590_02_08 {
    type: number
    sql: ${TABLE}.nib8590_02_08 ;;
  }

  dimension: nib8590_02_09 {
    type: number
    sql: ${TABLE}.nib8590_02_09 ;;
  }

  dimension: nib8590_02_10 {
    type: number
    sql: ${TABLE}.nib8590_02_10 ;;
  }

  dimension: nib8590_02_11 {
    type: number
    sql: ${TABLE}.nib8590_02_11 ;;
  }

  dimension: nib8590_02_12 {
    type: number
    sql: ${TABLE}.nib8590_02_12 ;;
  }

  dimension: nib8591 {
    type: number
    sql: ${TABLE}.nib8591 ;;
  }

  dimension: nib8592 {
    type: string
    sql: ${TABLE}.nib8592 ;;
  }

  dimension: nib8597 {
    type: string
    sql: ${TABLE}.nib8597 ;;
  }

  dimension: nib8600_01 {
    type: number
    sql: ${TABLE}.nib8600_01 ;;
  }

  dimension: nib8600_02 {
    type: number
    sql: ${TABLE}.nib8600_02 ;;
  }

  dimension: nib8600_03 {
    type: number
    sql: ${TABLE}.nib8600_03 ;;
  }

  dimension: nib8600_04 {
    type: number
    sql: ${TABLE}.nib8600_04 ;;
  }

  dimension: nib8600_05 {
    type: number
    sql: ${TABLE}.nib8600_05 ;;
  }

  dimension: nib8600_06 {
    type: number
    sql: ${TABLE}.nib8600_06 ;;
  }

  dimension: nib8600_07 {
    type: number
    sql: ${TABLE}.nib8600_07 ;;
  }

  dimension: nib8600_08 {
    type: number
    sql: ${TABLE}.nib8600_08 ;;
  }

  dimension: nib8600_09 {
    type: number
    sql: ${TABLE}.nib8600_09 ;;
  }

  dimension: nib8600_10 {
    type: number
    sql: ${TABLE}.nib8600_10 ;;
  }

  dimension: nib8600_11 {
    type: number
    sql: ${TABLE}.nib8600_11 ;;
  }

  dimension: nib8600_12 {
    type: number
    sql: ${TABLE}.nib8600_12 ;;
  }

  dimension: nib8600_13 {
    type: number
    sql: ${TABLE}.nib8600_13 ;;
  }

  dimension: nib8600_14 {
    type: number
    sql: ${TABLE}.nib8600_14 ;;
  }

  dimension: nib8600_15 {
    type: number
    sql: ${TABLE}.nib8600_15 ;;
  }

  dimension: nib8600_16 {
    type: number
    sql: ${TABLE}.nib8600_16 ;;
  }

  dimension: nib8600_17 {
    type: number
    sql: ${TABLE}.nib8600_17 ;;
  }

  dimension: nib8600_18 {
    type: number
    sql: ${TABLE}.nib8600_18 ;;
  }

  dimension: nib8600_18_24 {
    type: number
    sql: ${TABLE}.nib8600_18_24 ;;
  }

  dimension: nib8600_19 {
    type: number
    sql: ${TABLE}.nib8600_19 ;;
  }

  dimension: nib8600_20 {
    type: number
    sql: ${TABLE}.nib8600_20 ;;
  }

  dimension: nib8600_21 {
    type: number
    sql: ${TABLE}.nib8600_21 ;;
  }

  dimension: nib8600_25_34 {
    type: number
    sql: ${TABLE}.nib8600_25_34 ;;
  }

  dimension: nib8600_35_44 {
    type: number
    sql: ${TABLE}.nib8600_35_44 ;;
  }

  dimension: nib8600_45_54 {
    type: number
    sql: ${TABLE}.nib8600_45_54 ;;
  }

  dimension: nib8600_55_64 {
    type: number
    sql: ${TABLE}.nib8600_55_64 ;;
  }

  dimension: nib8600_65_74 {
    type: number
    sql: ${TABLE}.nib8600_65_74 ;;
  }

  dimension: nib8600_75_plus {
    type: number
    sql: ${TABLE}.nib8600_75_plus ;;
  }

  dimension: nib8601_00_02 {
    type: number
    sql: ${TABLE}.nib8601_00_02 ;;
  }

  dimension: nib8601_01 {
    type: number
    sql: ${TABLE}.nib8601_01 ;;
  }

  dimension: nib8601_02 {
    type: number
    sql: ${TABLE}.nib8601_02 ;;
  }

  dimension: nib8601_03 {
    type: number
    sql: ${TABLE}.nib8601_03 ;;
  }

  dimension: nib8601_03_05 {
    type: number
    sql: ${TABLE}.nib8601_03_05 ;;
  }

  dimension: nib8601_04 {
    type: number
    sql: ${TABLE}.nib8601_04 ;;
  }

  dimension: nib8601_05 {
    type: number
    sql: ${TABLE}.nib8601_05 ;;
  }

  dimension: nib8601_06 {
    type: number
    sql: ${TABLE}.nib8601_06 ;;
  }

  dimension: nib8601_06_10 {
    type: number
    sql: ${TABLE}.nib8601_06_10 ;;
  }

  dimension: nib8601_07 {
    type: number
    sql: ${TABLE}.nib8601_07 ;;
  }

  dimension: nib8601_08 {
    type: number
    sql: ${TABLE}.nib8601_08 ;;
  }

  dimension: nib8601_09 {
    type: number
    sql: ${TABLE}.nib8601_09 ;;
  }

  dimension: nib8601_10 {
    type: number
    sql: ${TABLE}.nib8601_10 ;;
  }

  dimension: nib8601_11 {
    type: number
    sql: ${TABLE}.nib8601_11 ;;
  }

  dimension: nib8601_11_15 {
    type: number
    sql: ${TABLE}.nib8601_11_15 ;;
  }

  dimension: nib8601_12 {
    type: number
    sql: ${TABLE}.nib8601_12 ;;
  }

  dimension: nib8601_13 {
    type: number
    sql: ${TABLE}.nib8601_13 ;;
  }

  dimension: nib8601_14 {
    type: number
    sql: ${TABLE}.nib8601_14 ;;
  }

  dimension: nib8601_15 {
    type: number
    sql: ${TABLE}.nib8601_15 ;;
  }

  dimension: nib8601_16_17 {
    type: number
    sql: ${TABLE}.nib8601_16_17 ;;
  }

  dimension: nib8602 {
    type: string
    sql: ${TABLE}.nib8602 ;;
  }

  dimension: nib8603_01 {
    type: number
    sql: ${TABLE}.nib8603_01 ;;
  }

  dimension: nib8603_02 {
    type: number
    sql: ${TABLE}.nib8603_02 ;;
  }

  dimension: nib8603_03 {
    type: number
    sql: ${TABLE}.nib8603_03 ;;
  }

  dimension: nib8603_04 {
    type: number
    sql: ${TABLE}.nib8603_04 ;;
  }

  dimension: nib8603_05 {
    type: number
    sql: ${TABLE}.nib8603_05 ;;
  }

  dimension: nib8603_06 {
    type: number
    sql: ${TABLE}.nib8603_06 ;;
  }

  dimension: nib8603_07 {
    type: number
    sql: ${TABLE}.nib8603_07 ;;
  }

  dimension: nib8603_08 {
    type: number
    sql: ${TABLE}.nib8603_08 ;;
  }

  dimension: nib8603_09 {
    type: number
    sql: ${TABLE}.nib8603_09 ;;
  }

  dimension: nib8603_10 {
    type: number
    sql: ${TABLE}.nib8603_10 ;;
  }

  dimension: nib8603_11 {
    type: number
    sql: ${TABLE}.nib8603_11 ;;
  }

  dimension: nib8603_12 {
    type: number
    sql: ${TABLE}.nib8603_12 ;;
  }

  dimension: nib8603_13 {
    type: number
    sql: ${TABLE}.nib8603_13 ;;
  }

  dimension: nib8603_14 {
    type: number
    sql: ${TABLE}.nib8603_14 ;;
  }

  dimension: nib8603_15 {
    type: number
    sql: ${TABLE}.nib8603_15 ;;
  }

  dimension: nib8603_16 {
    type: number
    sql: ${TABLE}.nib8603_16 ;;
  }

  dimension: nib8603_17 {
    type: number
    sql: ${TABLE}.nib8603_17 ;;
  }

  dimension: nib8603_18 {
    type: number
    sql: ${TABLE}.nib8603_18 ;;
  }

  dimension: nib8603_19 {
    type: number
    sql: ${TABLE}.nib8603_19 ;;
  }

  dimension: nib8604_1 {
    type: number
    sql: ${TABLE}.nib8604_1 ;;
  }

  dimension: nib8604_2 {
    type: number
    sql: ${TABLE}.nib8604_2 ;;
  }

  dimension: nib8604_3 {
    type: number
    sql: ${TABLE}.nib8604_3 ;;
  }

  dimension: nib8604_4 {
    type: number
    sql: ${TABLE}.nib8604_4 ;;
  }

  dimension: nib8604_5 {
    type: number
    sql: ${TABLE}.nib8604_5 ;;
  }

  dimension: nib8604_6 {
    type: number
    sql: ${TABLE}.nib8604_6 ;;
  }

  dimension: nib8604_7 {
    type: number
    sql: ${TABLE}.nib8604_7 ;;
  }

  dimension: nib8604_8 {
    type: number
    sql: ${TABLE}.nib8604_8 ;;
  }

  dimension: nib8604_9 {
    type: number
    sql: ${TABLE}.nib8604_9 ;;
  }

  dimension: nib8604_a {
    type: number
    sql: ${TABLE}.nib8604_A ;;
  }

  dimension: nib8604_b {
    type: number
    sql: ${TABLE}.nib8604_B ;;
  }

  dimension: nib8604_c {
    type: number
    sql: ${TABLE}.nib8604_C ;;
  }

  dimension: nib8604_d {
    type: number
    sql: ${TABLE}.nib8604_D ;;
  }

  dimension: nib8604_e {
    type: number
    sql: ${TABLE}.nib8604_E ;;
  }

  dimension: nib8604_f {
    type: number
    sql: ${TABLE}.nib8604_F ;;
  }

  dimension: nib8604_g {
    type: number
    sql: ${TABLE}.nib8604_G ;;
  }

  dimension: nib8604_h {
    type: number
    sql: ${TABLE}.nib8604_H ;;
  }

  dimension: nib8604_i {
    type: number
    sql: ${TABLE}.nib8604_I ;;
  }

  dimension: nib8604_j {
    type: number
    sql: ${TABLE}.nib8604_J ;;
  }

  dimension: nib8604_k {
    type: number
    sql: ${TABLE}.nib8604_K ;;
  }

  dimension: nib8604_l {
    type: number
    sql: ${TABLE}.nib8604_L ;;
  }

  dimension: nib8604_v {
    type: number
    sql: ${TABLE}.nib8604_V ;;
  }

  dimension: nib8604_w {
    type: number
    sql: ${TABLE}.nib8604_W ;;
  }

  dimension: nib8604_x {
    type: number
    sql: ${TABLE}.nib8604_X ;;
  }

  dimension: nib8604_y {
    type: number
    sql: ${TABLE}.nib8604_Y ;;
  }

  dimension: nib8604_z {
    type: number
    sql: ${TABLE}.nib8604_Z ;;
  }

  dimension: nib8605_1 {
    type: number
    sql: ${TABLE}.nib8605_1 ;;
  }

  dimension: nib8605_2 {
    type: number
    sql: ${TABLE}.nib8605_2 ;;
  }

  dimension: nib8605_3 {
    type: number
    sql: ${TABLE}.nib8605_3 ;;
  }

  dimension: nib8605_4 {
    type: number
    sql: ${TABLE}.nib8605_4 ;;
  }

  dimension: nib8605_5 {
    type: number
    sql: ${TABLE}.nib8605_5 ;;
  }

  dimension: nib8605_6 {
    type: number
    sql: ${TABLE}.nib8605_6 ;;
  }

  dimension: nib8605_7 {
    type: number
    sql: ${TABLE}.nib8605_7 ;;
  }

  dimension: nib8605_8 {
    type: number
    sql: ${TABLE}.nib8605_8 ;;
  }

  dimension: nib8605_9 {
    type: number
    sql: ${TABLE}.nib8605_9 ;;
  }

  dimension: nib8605_a {
    type: number
    sql: ${TABLE}.nib8605_A ;;
  }

  dimension: nib8605_b {
    type: number
    sql: ${TABLE}.nib8605_B ;;
  }

  dimension: nib8605_c {
    type: number
    sql: ${TABLE}.nib8605_C ;;
  }

  dimension: nib8605_d {
    type: number
    sql: ${TABLE}.nib8605_D ;;
  }

  dimension: nib8605_e {
    type: number
    sql: ${TABLE}.nib8605_E ;;
  }

  dimension: nib8605_f {
    type: number
    sql: ${TABLE}.nib8605_F ;;
  }

  dimension: nib8605_g {
    type: number
    sql: ${TABLE}.nib8605_G ;;
  }

  dimension: nib8605_h {
    type: number
    sql: ${TABLE}.nib8605_H ;;
  }

  dimension: nib8605_i {
    type: number
    sql: ${TABLE}.nib8605_I ;;
  }

  dimension: nib8605_j {
    type: number
    sql: ${TABLE}.nib8605_J ;;
  }

  dimension: nib8605_k {
    type: number
    sql: ${TABLE}.nib8605_K ;;
  }

  dimension: nib8605_l {
    type: number
    sql: ${TABLE}.nib8605_L ;;
  }

  dimension: nib8605_v {
    type: number
    sql: ${TABLE}.nib8605_V ;;
  }

  dimension: nib8605_w {
    type: number
    sql: ${TABLE}.nib8605_W ;;
  }

  dimension: nib8605_x {
    type: number
    sql: ${TABLE}.nib8605_X ;;
  }

  dimension: nib8605_y {
    type: number
    sql: ${TABLE}.nib8605_Y ;;
  }

  dimension: nib8605_z {
    type: number
    sql: ${TABLE}.nib8605_Z ;;
  }

  dimension: nib8606_o {
    type: number
    sql: ${TABLE}.nib8606_O ;;
  }

  dimension: nib8606_r {
    type: number
    sql: ${TABLE}.nib8606_R ;;
  }

  dimension: nib8607 {
    type: string
    sql: ${TABLE}.nib8607 ;;
  }

  dimension: nib8608_m {
    type: number
    sql: ${TABLE}.nib8608_M ;;
  }

  dimension: nib8608_s {
    type: number
    sql: ${TABLE}.nib8608_S ;;
  }

  dimension: nib8609_a {
    type: number
    sql: ${TABLE}.nib8609_A ;;
  }

  dimension: nib8609_b {
    type: number
    sql: ${TABLE}.nib8609_B ;;
  }

  dimension: nib8609_m {
    type: number
    sql: ${TABLE}.nib8609_M ;;
  }

  dimension: nib8609_s {
    type: number
    sql: ${TABLE}.nib8609_S ;;
  }

  dimension: nib8609a_m {
    type: number
    sql: ${TABLE}.nib8609a_M ;;
  }

  dimension: nib8609a_s {
    type: number
    sql: ${TABLE}.nib8609a_S ;;
  }

  dimension: nib8615 {
    type: number
    sql: ${TABLE}.nib8615 ;;
  }

  dimension: nib8616 {
    type: string
    sql: ${TABLE}.nib8616 ;;
  }

  dimension: nib8617 {
    type: string
    sql: ${TABLE}.nib8617 ;;
  }

  dimension: nib8619 {
    type: number
    sql: ${TABLE}.nib8619 ;;
  }

  dimension: nib8620 {
    type: number
    sql: ${TABLE}.nib8620 ;;
  }

  dimension: nib8621_01 {
    type: number
    sql: ${TABLE}.nib8621_01 ;;
  }

  dimension: nib8621_02 {
    type: number
    sql: ${TABLE}.nib8621_02 ;;
  }

  dimension: nib8621_03 {
    type: number
    sql: ${TABLE}.nib8621_03 ;;
  }

  dimension: nib8621_04 {
    type: number
    sql: ${TABLE}.nib8621_04 ;;
  }

  dimension: nib8621_05 {
    type: number
    sql: ${TABLE}.nib8621_05 ;;
  }

  dimension: nib8621_06 {
    type: number
    sql: ${TABLE}.nib8621_06 ;;
  }

  dimension: nib8622_n {
    type: number
    sql: ${TABLE}.nib8622_N ;;
  }

  dimension: nib8622_y {
    type: number
    sql: ${TABLE}.nib8622_Y ;;
  }

  dimension: nib8625_a {
    type: number
    sql: ${TABLE}.nib8625_A ;;
  }

  dimension: nib8625_b {
    type: number
    sql: ${TABLE}.nib8625_B ;;
  }

  dimension: nib8625_c {
    type: number
    sql: ${TABLE}.nib8625_C ;;
  }

  dimension: nib8628 {
    type: string
    sql: ${TABLE}.nib8628 ;;
  }

  dimension: nib8629 {
    type: string
    sql: ${TABLE}.nib8629 ;;
  }

  dimension: nib8630 {
    type: number
    sql: ${TABLE}.nib8630 ;;
  }

  dimension: nib8637_ {
    type: number
    sql: ${TABLE}.nib8637_ ;;
  }

  dimension: nib8637_1 {
    type: number
    sql: ${TABLE}.nib8637_1 ;;
  }

  dimension: nib8637_2 {
    type: number
    sql: ${TABLE}.nib8637_2 ;;
  }

  dimension: nib8637_3 {
    type: number
    sql: ${TABLE}.nib8637_3 ;;
  }

  dimension: nib8637_4 {
    type: number
    sql: ${TABLE}.nib8637_4 ;;
  }

  dimension: nib8637_5 {
    type: number
    sql: ${TABLE}.nib8637_5 ;;
  }

  dimension: nib8637_6 {
    type: number
    sql: ${TABLE}.nib8637_6 ;;
  }

  dimension: nib8637_7 {
    type: number
    sql: ${TABLE}.nib8637_7 ;;
  }

  dimension: nib8637_8 {
    type: number
    sql: ${TABLE}.nib8637_8 ;;
  }

  dimension: nib8637_9 {
    type: number
    sql: ${TABLE}.nib8637_9 ;;
  }

  dimension: nib8637_a {
    type: number
    sql: ${TABLE}.nib8637_A ;;
  }

  dimension: nib8637_b {
    type: number
    sql: ${TABLE}.nib8637_B ;;
  }

  dimension: nib8637_c {
    type: number
    sql: ${TABLE}.nib8637_C ;;
  }

  dimension: nib8637_d {
    type: number
    sql: ${TABLE}.nib8637_D ;;
  }

  dimension: nib8637_e {
    type: number
    sql: ${TABLE}.nib8637_E ;;
  }

  dimension: nib8637_f {
    type: number
    sql: ${TABLE}.nib8637_F ;;
  }

  dimension: nib8637_g {
    type: number
    sql: ${TABLE}.nib8637_G ;;
  }

  dimension: nib8637_h {
    type: number
    sql: ${TABLE}.nib8637_H ;;
  }

  dimension: nib8637_i {
    type: number
    sql: ${TABLE}.nib8637_I ;;
  }

  dimension: nib8637_j {
    type: number
    sql: ${TABLE}.nib8637_J ;;
  }

  dimension: nib8637_k {
    type: number
    sql: ${TABLE}.nib8637_K ;;
  }

  dimension: nib8637_l {
    type: number
    sql: ${TABLE}.nib8637_L ;;
  }

  dimension: nib8637_v {
    type: number
    sql: ${TABLE}.nib8637_V ;;
  }

  dimension: nib8637_w {
    type: number
    sql: ${TABLE}.nib8637_W ;;
  }

  dimension: nib8637_x {
    type: number
    sql: ${TABLE}.nib8637_X ;;
  }

  dimension: nib8637_y {
    type: number
    sql: ${TABLE}.nib8637_Y ;;
  }

  dimension: nib8637_z {
    type: number
    sql: ${TABLE}.nib8637_Z ;;
  }

  dimension: nib8645_01 {
    type: number
    sql: ${TABLE}.nib8645_01 ;;
  }

  dimension: nib8645_02 {
    type: number
    sql: ${TABLE}.nib8645_02 ;;
  }

  dimension: nib8645_03 {
    type: number
    sql: ${TABLE}.nib8645_03 ;;
  }

  dimension: nib8645_04 {
    type: number
    sql: ${TABLE}.nib8645_04 ;;
  }

  dimension: nib8645_05 {
    type: number
    sql: ${TABLE}.nib8645_05 ;;
  }

  dimension: nib8645_06 {
    type: number
    sql: ${TABLE}.nib8645_06 ;;
  }

  dimension: nib8645_07 {
    type: number
    sql: ${TABLE}.nib8645_07 ;;
  }

  dimension: nib8645_08 {
    type: number
    sql: ${TABLE}.nib8645_08 ;;
  }

  dimension: nib8645_09 {
    type: number
    sql: ${TABLE}.nib8645_09 ;;
  }

  dimension: nib8645_10 {
    type: number
    sql: ${TABLE}.nib8645_10 ;;
  }

  dimension: nib8645_11 {
    type: number
    sql: ${TABLE}.nib8645_11 ;;
  }

  dimension: nib8645_12 {
    type: number
    sql: ${TABLE}.nib8645_12 ;;
  }

  dimension: nib8646 {
    type: number
    sql: ${TABLE}.nib8646 ;;
  }

  dimension: nib8647_1 {
    type: number
    sql: ${TABLE}.nib8647_1 ;;
  }

  dimension: nib8647_2 {
    type: number
    sql: ${TABLE}.nib8647_2 ;;
  }

  dimension: nib8647_3 {
    type: number
    sql: ${TABLE}.nib8647_3 ;;
  }

  dimension: nib8653 {
    type: number
    sql: ${TABLE}.nib8653 ;;
  }

  dimension: nib8667_1 {
    type: number
    sql: ${TABLE}.nib8667_1 ;;
  }

  dimension: nib8667_2 {
    type: number
    sql: ${TABLE}.nib8667_2 ;;
  }

  dimension: nib8667_3 {
    type: number
    sql: ${TABLE}.nib8667_3 ;;
  }

  dimension: nib8667_4 {
    type: number
    sql: ${TABLE}.nib8667_4 ;;
  }

  dimension: nib8667_5 {
    type: number
    sql: ${TABLE}.nib8667_5 ;;
  }

  dimension: nib8667_6 {
    type: number
    sql: ${TABLE}.nib8667_6 ;;
  }

  dimension: nib8667_7 {
    type: number
    sql: ${TABLE}.nib8667_7 ;;
  }

  dimension: nib8667_8 {
    type: number
    sql: ${TABLE}.nib8667_8 ;;
  }

  dimension: nib8667_9 {
    type: number
    sql: ${TABLE}.nib8667_9 ;;
  }

  dimension: nib8667_a {
    type: number
    sql: ${TABLE}.nib8667_A ;;
  }

  dimension: nib8667_b {
    type: number
    sql: ${TABLE}.nib8667_B ;;
  }

  dimension: nib8667_c {
    type: number
    sql: ${TABLE}.nib8667_C ;;
  }

  dimension: nib8667_d {
    type: number
    sql: ${TABLE}.nib8667_D ;;
  }

  dimension: nib8667_e {
    type: number
    sql: ${TABLE}.nib8667_E ;;
  }

  dimension: nib8667_f {
    type: number
    sql: ${TABLE}.nib8667_F ;;
  }

  dimension: nib8667_g {
    type: number
    sql: ${TABLE}.nib8667_G ;;
  }

  dimension: nib8667_h {
    type: number
    sql: ${TABLE}.nib8667_H ;;
  }

  dimension: nib8667_i {
    type: number
    sql: ${TABLE}.nib8667_I ;;
  }

  dimension: nib8667_j {
    type: number
    sql: ${TABLE}.nib8667_J ;;
  }

  dimension: nib8667_k {
    type: number
    sql: ${TABLE}.nib8667_K ;;
  }

  dimension: nib8667_l {
    type: number
    sql: ${TABLE}.nib8667_L ;;
  }

  dimension: nib8667_v {
    type: number
    sql: ${TABLE}.nib8667_V ;;
  }

  dimension: nib8667_w {
    type: number
    sql: ${TABLE}.nib8667_W ;;
  }

  dimension: nib8667_x {
    type: number
    sql: ${TABLE}.nib8667_X ;;
  }

  dimension: nib8667_y {
    type: number
    sql: ${TABLE}.nib8667_Y ;;
  }

  dimension: nib8667_z {
    type: number
    sql: ${TABLE}.nib8667_Z ;;
  }

  dimension: nib8668_1 {
    type: number
    sql: ${TABLE}.nib8668_1 ;;
  }

  dimension: nib8668_2 {
    type: number
    sql: ${TABLE}.nib8668_2 ;;
  }

  dimension: nib8668_3 {
    type: number
    sql: ${TABLE}.nib8668_3 ;;
  }

  dimension: nib8668_4 {
    type: number
    sql: ${TABLE}.nib8668_4 ;;
  }

  dimension: nib8668_5 {
    type: number
    sql: ${TABLE}.nib8668_5 ;;
  }

  dimension: nib8668_6 {
    type: number
    sql: ${TABLE}.nib8668_6 ;;
  }

  dimension: nib8668_7 {
    type: number
    sql: ${TABLE}.nib8668_7 ;;
  }

  dimension: nib8668_8 {
    type: number
    sql: ${TABLE}.nib8668_8 ;;
  }

  dimension: nib8668_9 {
    type: number
    sql: ${TABLE}.nib8668_9 ;;
  }

  dimension: nib8668_a {
    type: number
    sql: ${TABLE}.nib8668_A ;;
  }

  dimension: nib8668_b {
    type: number
    sql: ${TABLE}.nib8668_B ;;
  }

  dimension: nib8668_c {
    type: number
    sql: ${TABLE}.nib8668_C ;;
  }

  dimension: nib8668_d {
    type: number
    sql: ${TABLE}.nib8668_D ;;
  }

  dimension: nib8668_e {
    type: number
    sql: ${TABLE}.nib8668_E ;;
  }

  dimension: nib8668_f {
    type: number
    sql: ${TABLE}.nib8668_F ;;
  }

  dimension: nib8668_g {
    type: number
    sql: ${TABLE}.nib8668_G ;;
  }

  dimension: nib8668_h {
    type: number
    sql: ${TABLE}.nib8668_H ;;
  }

  dimension: nib8668_i {
    type: number
    sql: ${TABLE}.nib8668_I ;;
  }

  dimension: nib8668_j {
    type: number
    sql: ${TABLE}.nib8668_J ;;
  }

  dimension: nib8668_k {
    type: number
    sql: ${TABLE}.nib8668_K ;;
  }

  dimension: nib8668_l {
    type: number
    sql: ${TABLE}.nib8668_L ;;
  }

  dimension: nib8668_v {
    type: number
    sql: ${TABLE}.nib8668_V ;;
  }

  dimension: nib8668_w {
    type: number
    sql: ${TABLE}.nib8668_W ;;
  }

  dimension: nib8668_x {
    type: number
    sql: ${TABLE}.nib8668_X ;;
  }

  dimension: nib8668_y {
    type: number
    sql: ${TABLE}.nib8668_Y ;;
  }

  dimension: nib8668_z {
    type: number
    sql: ${TABLE}.nib8668_Z ;;
  }

  dimension: nib8669_1 {
    type: number
    sql: ${TABLE}.nib8669_1 ;;
  }

  dimension: nib8669_2 {
    type: number
    sql: ${TABLE}.nib8669_2 ;;
  }

  dimension: nib8669_3 {
    type: number
    sql: ${TABLE}.nib8669_3 ;;
  }

  dimension: nib8669_4 {
    type: number
    sql: ${TABLE}.nib8669_4 ;;
  }

  dimension: nib8669_5 {
    type: number
    sql: ${TABLE}.nib8669_5 ;;
  }

  dimension: nib8669_6 {
    type: number
    sql: ${TABLE}.nib8669_6 ;;
  }

  dimension: nib8669_7 {
    type: number
    sql: ${TABLE}.nib8669_7 ;;
  }

  dimension: nib8669_8 {
    type: number
    sql: ${TABLE}.nib8669_8 ;;
  }

  dimension: nib8669_9 {
    type: number
    sql: ${TABLE}.nib8669_9 ;;
  }

  dimension: nib8669_a {
    type: number
    sql: ${TABLE}.nib8669_A ;;
  }

  dimension: nib8669_b {
    type: number
    sql: ${TABLE}.nib8669_B ;;
  }

  dimension: nib8669_c {
    type: number
    sql: ${TABLE}.nib8669_C ;;
  }

  dimension: nib8669_d {
    type: number
    sql: ${TABLE}.nib8669_D ;;
  }

  dimension: nib8669_e {
    type: number
    sql: ${TABLE}.nib8669_E ;;
  }

  dimension: nib8669_f {
    type: number
    sql: ${TABLE}.nib8669_F ;;
  }

  dimension: nib8669_g {
    type: number
    sql: ${TABLE}.nib8669_G ;;
  }

  dimension: nib8669_h {
    type: number
    sql: ${TABLE}.nib8669_H ;;
  }

  dimension: nib8669_i {
    type: number
    sql: ${TABLE}.nib8669_I ;;
  }

  dimension: nib8669_j {
    type: number
    sql: ${TABLE}.nib8669_J ;;
  }

  dimension: nib8669_k {
    type: number
    sql: ${TABLE}.nib8669_K ;;
  }

  dimension: nib8669_l {
    type: number
    sql: ${TABLE}.nib8669_L ;;
  }

  dimension: nib8669_v {
    type: number
    sql: ${TABLE}.nib8669_V ;;
  }

  dimension: nib8669_w {
    type: number
    sql: ${TABLE}.nib8669_W ;;
  }

  dimension: nib8669_x {
    type: number
    sql: ${TABLE}.nib8669_X ;;
  }

  dimension: nib8669_y {
    type: number
    sql: ${TABLE}.nib8669_Y ;;
  }

  dimension: nib8669_z {
    type: number
    sql: ${TABLE}.nib8669_Z ;;
  }

  dimension: nib8680 {
    type: number
    sql: ${TABLE}.nib8680 ;;
  }

  dimension: nib8682 {
    type: string
    sql: ${TABLE}.nib8682 ;;
  }

  dimension: nib8686 {
    type: string
    sql: ${TABLE}.nib8686 ;;
  }

  dimension: nib8688_f {
    type: number
    sql: ${TABLE}.nib8688_F ;;
  }

  dimension: nib8688_m {
    type: number
    sql: ${TABLE}.nib8688_M ;;
  }

  dimension: nib8690 {
    type: string
    sql: ${TABLE}.nib8690 ;;
  }

  dimension: nib8692 {
    type: number
    sql: ${TABLE}.nib8692 ;;
  }

  dimension: nib8693 {
    type: number
    sql: ${TABLE}.nib8693 ;;
  }

  dimension: nib8701_g {
    type: number
    sql: ${TABLE}.nib8701_G ;;
  }

  dimension: nib8701_m {
    type: number
    sql: ${TABLE}.nib8701_M ;;
  }

  dimension: nib8701_r {
    type: number
    sql: ${TABLE}.nib8701_R ;;
  }

  dimension: nib8701_t {
    type: number
    sql: ${TABLE}.nib8701_T ;;
  }

  dimension: nib8702 {
    type: string
    sql: ${TABLE}.nib8702 ;;
  }

  dimension: nib8703_c {
    type: number
    sql: ${TABLE}.nib8703_C ;;
  }

  dimension: nib8703_e {
    type: number
    sql: ${TABLE}.nib8703_E ;;
  }

  dimension: nib8703_l {
    type: number
    sql: ${TABLE}.nib8703_L ;;
  }

  dimension: nib8703_r {
    type: number
    sql: ${TABLE}.nib8703_R ;;
  }

  dimension: nib8703_s {
    type: number
    sql: ${TABLE}.nib8703_S ;;
  }

  dimension: nib8703_t {
    type: number
    sql: ${TABLE}.nib8703_T ;;
  }

  dimension: nib8704 {
    type: string
    sql: ${TABLE}.nib8704 ;;
  }

  dimension: nib8705 {
    type: string
    sql: ${TABLE}.nib8705 ;;
  }

  dimension: nib8706 {
    type: string
    sql: ${TABLE}.nib8706 ;;
  }

  dimension: nib8707 {
    type: string
    sql: ${TABLE}.nib8707 ;;
  }

  dimension: nib8708 {
    type: string
    sql: ${TABLE}.nib8708 ;;
  }

  dimension: nib8713 {
    type: string
    sql: ${TABLE}.nib8713 ;;
  }

  dimension: nib8717 {
    type: string
    sql: ${TABLE}.nib8717 ;;
  }

  dimension: nib8718 {
    type: string
    sql: ${TABLE}.nib8718 ;;
  }

  dimension: nib8727 {
    type: string
    sql: ${TABLE}.nib8727 ;;
  }

  dimension: nib8728 {
    type: string
    sql: ${TABLE}.nib8728 ;;
  }

  dimension: nib8729 {
    type: string
    sql: ${TABLE}.nib8729 ;;
  }

  dimension: nib8747 {
    type: string
    sql: ${TABLE}.nib8747 ;;
  }

  dimension: nib8748 {
    type: string
    sql: ${TABLE}.nib8748 ;;
  }

  dimension: nib8749_c {
    type: number
    sql: ${TABLE}.nib8749_C ;;
  }

  dimension: nib8749_i {
    type: number
    sql: ${TABLE}.nib8749_I ;;
  }

  dimension: nib8749_p {
    type: number
    sql: ${TABLE}.nib8749_P ;;
  }

  dimension: nib8763 {
    type: number
    sql: ${TABLE}.nib8763 ;;
  }

  dimension: nib8808 {
    type: number
    sql: ${TABLE}.nib8808 ;;
  }

  dimension: nib8815 {
    type: number
    sql: ${TABLE}.nib8815 ;;
  }

  dimension: nib8847 {
    type: number
    sql: ${TABLE}.nib8847 ;;
  }

  dimension: nib8848 {
    type: number
    sql: ${TABLE}.nib8848 ;;
  }

  dimension: nib9040_01 {
    type: number
    sql: ${TABLE}.nib9040_01 ;;
  }

  dimension: nib9040_03 {
    type: number
    sql: ${TABLE}.nib9040_03 ;;
  }

  dimension: nib9040_05 {
    type: number
    sql: ${TABLE}.nib9040_05 ;;
  }

  dimension: nib9040_07 {
    type: number
    sql: ${TABLE}.nib9040_07 ;;
  }

  dimension: nib9040_09 {
    type: number
    sql: ${TABLE}.nib9040_09 ;;
  }

  dimension: nib9040_11 {
    type: number
    sql: ${TABLE}.nib9040_11 ;;
  }

  dimension: nib9040_13 {
    type: number
    sql: ${TABLE}.nib9040_13 ;;
  }

  dimension: nib9040_15 {
    type: number
    sql: ${TABLE}.nib9040_15 ;;
  }

  dimension: nib9040_17 {
    type: number
    sql: ${TABLE}.nib9040_17 ;;
  }

  dimension: nib9040_19 {
    type: number
    sql: ${TABLE}.nib9040_19 ;;
  }

  dimension: nib9040_21 {
    type: number
    sql: ${TABLE}.nib9040_21 ;;
  }

  dimension: nib9040_23 {
    type: number
    sql: ${TABLE}.nib9040_23 ;;
  }

  dimension: nib9040_25 {
    type: number
    sql: ${TABLE}.nib9040_25 ;;
  }

  dimension: nib9040_26 {
    type: number
    sql: ${TABLE}.nib9040_26 ;;
  }

  dimension: nib9040_27 {
    type: number
    sql: ${TABLE}.nib9040_27 ;;
  }

  dimension: nib9040_29 {
    type: number
    sql: ${TABLE}.nib9040_29 ;;
  }

  dimension: nib9040_31 {
    type: number
    sql: ${TABLE}.nib9040_31 ;;
  }

  dimension: nib9040_33 {
    type: number
    sql: ${TABLE}.nib9040_33 ;;
  }

  dimension: nib9040_35 {
    type: number
    sql: ${TABLE}.nib9040_35 ;;
  }

  dimension: nib9040_37 {
    type: number
    sql: ${TABLE}.nib9040_37 ;;
  }

  dimension: nib9040_39 {
    type: number
    sql: ${TABLE}.nib9040_39 ;;
  }

  dimension: nib9040_41 {
    type: number
    sql: ${TABLE}.nib9040_41 ;;
  }

  dimension: nib9040_43 {
    type: number
    sql: ${TABLE}.nib9040_43 ;;
  }

  dimension: nib9040_45 {
    type: number
    sql: ${TABLE}.nib9040_45 ;;
  }

  dimension: nib9040_47 {
    type: number
    sql: ${TABLE}.nib9040_47 ;;
  }

  dimension: nib9040_49 {
    type: number
    sql: ${TABLE}.nib9040_49 ;;
  }

  dimension: nib9040_51 {
    type: number
    sql: ${TABLE}.nib9040_51 ;;
  }

  dimension: nib9040_53 {
    type: number
    sql: ${TABLE}.nib9040_53 ;;
  }

  dimension: nib9040_55 {
    type: number
    sql: ${TABLE}.nib9040_55 ;;
  }

  dimension: nib9040_57 {
    type: number
    sql: ${TABLE}.nib9040_57 ;;
  }

  dimension: nib9040_59 {
    type: number
    sql: ${TABLE}.nib9040_59 ;;
  }

  dimension: nib9040_61 {
    type: number
    sql: ${TABLE}.nib9040_61 ;;
  }

  dimension: nib9040_63 {
    type: number
    sql: ${TABLE}.nib9040_63 ;;
  }

  dimension: nib9040_65 {
    type: number
    sql: ${TABLE}.nib9040_65 ;;
  }

  dimension: nib9040_67 {
    type: number
    sql: ${TABLE}.nib9040_67 ;;
  }

  dimension: nib9040_69 {
    type: number
    sql: ${TABLE}.nib9040_69 ;;
  }

  dimension: nib9040_71 {
    type: number
    sql: ${TABLE}.nib9040_71 ;;
  }

  dimension: nib9040_73 {
    type: number
    sql: ${TABLE}.nib9040_73 ;;
  }

  dimension: nib9040_75 {
    type: number
    sql: ${TABLE}.nib9040_75 ;;
  }

  dimension: nib9040_77 {
    type: number
    sql: ${TABLE}.nib9040_77 ;;
  }

  dimension: nib9040_79 {
    type: number
    sql: ${TABLE}.nib9040_79 ;;
  }

  dimension: nib9040_81 {
    type: number
    sql: ${TABLE}.nib9040_81 ;;
  }

  dimension: nib9040_83 {
    type: number
    sql: ${TABLE}.nib9040_83 ;;
  }

  dimension: nib9040_84 {
    type: number
    sql: ${TABLE}.nib9040_84 ;;
  }

  dimension: nib9040_85 {
    type: number
    sql: ${TABLE}.nib9040_85 ;;
  }

  dimension: nib9040_87 {
    type: number
    sql: ${TABLE}.nib9040_87 ;;
  }

  dimension: nib9040_89 {
    type: number
    sql: ${TABLE}.nib9040_89 ;;
  }

  dimension: nib9040_91 {
    type: number
    sql: ${TABLE}.nib9040_91 ;;
  }

  dimension: nib9040_93 {
    type: number
    sql: ${TABLE}.nib9040_93 ;;
  }

  dimension: nib9040_95 {
    type: number
    sql: ${TABLE}.nib9040_95 ;;
  }

  dimension: nib9042 {
    type: string
    sql: ${TABLE}.nib9042 ;;
  }

  dimension: nib9050_01 {
    type: number
    sql: ${TABLE}.nib9050_01 ;;
  }

  dimension: nib9050_03 {
    type: number
    sql: ${TABLE}.nib9050_03 ;;
  }

  dimension: nib9050_05 {
    type: number
    sql: ${TABLE}.nib9050_05 ;;
  }

  dimension: nib9050_07 {
    type: number
    sql: ${TABLE}.nib9050_07 ;;
  }

  dimension: nib9050_09 {
    type: number
    sql: ${TABLE}.nib9050_09 ;;
  }

  dimension: nib9050_11 {
    type: number
    sql: ${TABLE}.nib9050_11 ;;
  }

  dimension: nib9050_13 {
    type: number
    sql: ${TABLE}.nib9050_13 ;;
  }

  dimension: nib9050_15 {
    type: number
    sql: ${TABLE}.nib9050_15 ;;
  }

  dimension: nib9050_17 {
    type: number
    sql: ${TABLE}.nib9050_17 ;;
  }

  dimension: nib9050_19 {
    type: number
    sql: ${TABLE}.nib9050_19 ;;
  }

  dimension: nib9050_21 {
    type: number
    sql: ${TABLE}.nib9050_21 ;;
  }

  dimension: nib9050_23 {
    type: number
    sql: ${TABLE}.nib9050_23 ;;
  }

  dimension: nib9050_25 {
    type: number
    sql: ${TABLE}.nib9050_25 ;;
  }

  dimension: nib9050_26 {
    type: number
    sql: ${TABLE}.nib9050_26 ;;
  }

  dimension: nib9050_27 {
    type: number
    sql: ${TABLE}.nib9050_27 ;;
  }

  dimension: nib9050_29 {
    type: number
    sql: ${TABLE}.nib9050_29 ;;
  }

  dimension: nib9050_31 {
    type: number
    sql: ${TABLE}.nib9050_31 ;;
  }

  dimension: nib9050_33 {
    type: number
    sql: ${TABLE}.nib9050_33 ;;
  }

  dimension: nib9050_35 {
    type: number
    sql: ${TABLE}.nib9050_35 ;;
  }

  dimension: nib9050_37 {
    type: number
    sql: ${TABLE}.nib9050_37 ;;
  }

  dimension: nib9050_39 {
    type: number
    sql: ${TABLE}.nib9050_39 ;;
  }

  dimension: nib9050_41 {
    type: number
    sql: ${TABLE}.nib9050_41 ;;
  }

  dimension: nib9050_43 {
    type: number
    sql: ${TABLE}.nib9050_43 ;;
  }

  dimension: nib9050_45 {
    type: number
    sql: ${TABLE}.nib9050_45 ;;
  }

  dimension: nib9050_47 {
    type: number
    sql: ${TABLE}.nib9050_47 ;;
  }

  dimension: nib9050_49 {
    type: number
    sql: ${TABLE}.nib9050_49 ;;
  }

  dimension: nib9050_51 {
    type: number
    sql: ${TABLE}.nib9050_51 ;;
  }

  dimension: nib9050_53 {
    type: number
    sql: ${TABLE}.nib9050_53 ;;
  }

  dimension: nib9050_55 {
    type: number
    sql: ${TABLE}.nib9050_55 ;;
  }

  dimension: nib9050_57 {
    type: number
    sql: ${TABLE}.nib9050_57 ;;
  }

  dimension: nib9050_59 {
    type: number
    sql: ${TABLE}.nib9050_59 ;;
  }

  dimension: nib9050_61 {
    type: number
    sql: ${TABLE}.nib9050_61 ;;
  }

  dimension: nib9050_63 {
    type: number
    sql: ${TABLE}.nib9050_63 ;;
  }

  dimension: nib9050_65 {
    type: number
    sql: ${TABLE}.nib9050_65 ;;
  }

  dimension: nib9050_67 {
    type: number
    sql: ${TABLE}.nib9050_67 ;;
  }

  dimension: nib9050_69 {
    type: number
    sql: ${TABLE}.nib9050_69 ;;
  }

  dimension: nib9050_71 {
    type: number
    sql: ${TABLE}.nib9050_71 ;;
  }

  dimension: nib9050_73 {
    type: number
    sql: ${TABLE}.nib9050_73 ;;
  }

  dimension: nib9050_75 {
    type: number
    sql: ${TABLE}.nib9050_75 ;;
  }

  dimension: nib9050_77 {
    type: number
    sql: ${TABLE}.nib9050_77 ;;
  }

  dimension: nib9050_79 {
    type: number
    sql: ${TABLE}.nib9050_79 ;;
  }

  dimension: nib9050_81 {
    type: number
    sql: ${TABLE}.nib9050_81 ;;
  }

  dimension: nib9050_83 {
    type: number
    sql: ${TABLE}.nib9050_83 ;;
  }

  dimension: nib9050_84 {
    type: number
    sql: ${TABLE}.nib9050_84 ;;
  }

  dimension: nib9050_85 {
    type: number
    sql: ${TABLE}.nib9050_85 ;;
  }

  dimension: nib9050_87 {
    type: number
    sql: ${TABLE}.nib9050_87 ;;
  }

  dimension: nib9050_89 {
    type: number
    sql: ${TABLE}.nib9050_89 ;;
  }

  dimension: nib9050_91 {
    type: number
    sql: ${TABLE}.nib9050_91 ;;
  }

  dimension: nib9050_93 {
    type: number
    sql: ${TABLE}.nib9050_93 ;;
  }

  dimension: nib9050_95 {
    type: number
    sql: ${TABLE}.nib9050_95 ;;
  }

  dimension: nib9052 {
    type: string
    sql: ${TABLE}.nib9052 ;;
  }

  dimension: nib9100 {
    type: number
    sql: ${TABLE}.nib9100 ;;
  }

  dimension: nib9150_01 {
    type: string
    sql: ${TABLE}.nib9150_01 ;;
  }

  dimension: nib9150_02 {
    type: string
    sql: ${TABLE}.nib9150_02 ;;
  }

  dimension: nib9150_03 {
    type: string
    sql: ${TABLE}.nib9150_03 ;;
  }

  dimension: nib9150_04 {
    type: string
    sql: ${TABLE}.nib9150_04 ;;
  }

  dimension: nib9150_05 {
    type: string
    sql: ${TABLE}.nib9150_05 ;;
  }

  dimension: nib9150_06 {
    type: string
    sql: ${TABLE}.nib9150_06 ;;
  }

  dimension: nib9150_07 {
    type: string
    sql: ${TABLE}.nib9150_07 ;;
  }

  dimension: nib9153_01 {
    type: number
    sql: ${TABLE}.nib9153_01 ;;
  }

  dimension: nib9153_02 {
    type: number
    sql: ${TABLE}.nib9153_02 ;;
  }

  dimension: nib9153_03 {
    type: number
    sql: ${TABLE}.nib9153_03 ;;
  }

  dimension: nib9153_04 {
    type: number
    sql: ${TABLE}.nib9153_04 ;;
  }

  dimension: nib9153_05 {
    type: number
    sql: ${TABLE}.nib9153_05 ;;
  }

  dimension: nib9153_06 {
    type: number
    sql: ${TABLE}.nib9153_06 ;;
  }

  dimension: nib9153_07 {
    type: number
    sql: ${TABLE}.nib9153_07 ;;
  }

  dimension: nib9153_08 {
    type: number
    sql: ${TABLE}.nib9153_08 ;;
  }

  dimension: nib9153_09 {
    type: number
    sql: ${TABLE}.nib9153_09 ;;
  }

  dimension: nib9153_10 {
    type: number
    sql: ${TABLE}.nib9153_10 ;;
  }

  dimension: nib9153_11 {
    type: number
    sql: ${TABLE}.nib9153_11 ;;
  }

  dimension: nib9153_12 {
    type: number
    sql: ${TABLE}.nib9153_12 ;;
  }

  dimension: nib9153_13 {
    type: number
    sql: ${TABLE}.nib9153_13 ;;
  }

  dimension: nib9153_14 {
    type: number
    sql: ${TABLE}.nib9153_14 ;;
  }

  dimension: nib9153_15 {
    type: number
    sql: ${TABLE}.nib9153_15 ;;
  }

  dimension: nib9153_16 {
    type: number
    sql: ${TABLE}.nib9153_16 ;;
  }

  dimension: nib9153_17 {
    type: number
    sql: ${TABLE}.nib9153_17 ;;
  }

  dimension: nib9153_18 {
    type: number
    sql: ${TABLE}.nib9153_18 ;;
  }

  dimension: nib9153_19 {
    type: number
    sql: ${TABLE}.nib9153_19 ;;
  }

  dimension: nib9153_20 {
    type: number
    sql: ${TABLE}.nib9153_20 ;;
  }

  dimension: nib9153_21 {
    type: number
    sql: ${TABLE}.nib9153_21 ;;
  }

  dimension: nib9154_a1 {
    type: number
    sql: ${TABLE}.nib9154_A1 ;;
  }

  dimension: nib9154_a2 {
    type: number
    sql: ${TABLE}.nib9154_A2 ;;
  }

  dimension: nib9154_a3 {
    type: number
    sql: ${TABLE}.nib9154_A3 ;;
  }

  dimension: nib9154_a4 {
    type: number
    sql: ${TABLE}.nib9154_A4 ;;
  }

  dimension: nib9154_a5 {
    type: number
    sql: ${TABLE}.nib9154_A5 ;;
  }

  dimension: nib9154_b1 {
    type: number
    sql: ${TABLE}.nib9154_B1 ;;
  }

  dimension: nib9154_b2 {
    type: number
    sql: ${TABLE}.nib9154_B2 ;;
  }

  dimension: nib9154_b3 {
    type: number
    sql: ${TABLE}.nib9154_B3 ;;
  }

  dimension: nib9154_b4 {
    type: number
    sql: ${TABLE}.nib9154_B4 ;;
  }

  dimension: nib9154_b5 {
    type: number
    sql: ${TABLE}.nib9154_B5 ;;
  }

  dimension: nib9154_b6 {
    type: number
    sql: ${TABLE}.nib9154_B6 ;;
  }

  dimension: nib9154_b7 {
    type: number
    sql: ${TABLE}.nib9154_B7 ;;
  }

  dimension: nib9154_c1 {
    type: number
    sql: ${TABLE}.nib9154_C1 ;;
  }

  dimension: nib9154_d1 {
    type: number
    sql: ${TABLE}.nib9154_D1 ;;
  }

  dimension: nib9154_e1 {
    type: number
    sql: ${TABLE}.nib9154_E1 ;;
  }

  dimension: nib9154_f1 {
    type: number
    sql: ${TABLE}.nib9154_F1 ;;
  }

  dimension: nib9154_g1 {
    type: number
    sql: ${TABLE}.nib9154_G1 ;;
  }

  dimension: nib9154_h1 {
    type: number
    sql: ${TABLE}.nib9154_H1 ;;
  }

  dimension: nib9154_h2 {
    type: number
    sql: ${TABLE}.nib9154_H2 ;;
  }

  dimension: nib9154_h3 {
    type: number
    sql: ${TABLE}.nib9154_H3 ;;
  }

  dimension: nib9154_h4 {
    type: number
    sql: ${TABLE}.nib9154_H4 ;;
  }

  dimension: nib9156_02_a1 {
    type: number
    sql: ${TABLE}.nib9156_02_A1 ;;
  }

  dimension: nib9156_02_a2 {
    type: number
    sql: ${TABLE}.nib9156_02_A2 ;;
  }

  dimension: nib9156_02_a3 {
    type: number
    sql: ${TABLE}.nib9156_02_A3 ;;
  }

  dimension: nib9156_02_a4 {
    type: number
    sql: ${TABLE}.nib9156_02_A4 ;;
  }

  dimension: nib9156_02_a5 {
    type: number
    sql: ${TABLE}.nib9156_02_A5 ;;
  }

  dimension: nib9156_02_b1 {
    type: number
    sql: ${TABLE}.nib9156_02_B1 ;;
  }

  dimension: nib9156_02_b2 {
    type: number
    sql: ${TABLE}.nib9156_02_B2 ;;
  }

  dimension: nib9156_02_b3 {
    type: number
    sql: ${TABLE}.nib9156_02_B3 ;;
  }

  dimension: nib9156_02_b4 {
    type: number
    sql: ${TABLE}.nib9156_02_B4 ;;
  }

  dimension: nib9156_02_b5 {
    type: number
    sql: ${TABLE}.nib9156_02_B5 ;;
  }

  dimension: nib9156_02_b6 {
    type: number
    sql: ${TABLE}.nib9156_02_B6 ;;
  }

  dimension: nib9156_02_b7 {
    type: number
    sql: ${TABLE}.nib9156_02_B7 ;;
  }

  dimension: nib9156_02_c1 {
    type: number
    sql: ${TABLE}.nib9156_02_C1 ;;
  }

  dimension: nib9156_02_d1 {
    type: number
    sql: ${TABLE}.nib9156_02_D1 ;;
  }

  dimension: nib9156_02_e1 {
    type: number
    sql: ${TABLE}.nib9156_02_E1 ;;
  }

  dimension: nib9156_02_f1 {
    type: number
    sql: ${TABLE}.nib9156_02_F1 ;;
  }

  dimension: nib9156_02_g1 {
    type: number
    sql: ${TABLE}.nib9156_02_G1 ;;
  }

  dimension: nib9156_02_h1 {
    type: number
    sql: ${TABLE}.nib9156_02_H1 ;;
  }

  dimension: nib9156_02_h2 {
    type: number
    sql: ${TABLE}.nib9156_02_H2 ;;
  }

  dimension: nib9156_02_h3 {
    type: number
    sql: ${TABLE}.nib9156_02_H3 ;;
  }

  dimension: nib9156_02_h4 {
    type: number
    sql: ${TABLE}.nib9156_02_H4 ;;
  }

  dimension: nib9157_02_a1 {
    type: number
    sql: ${TABLE}.nib9157_02_A1 ;;
  }

  dimension: nib9157_02_a2 {
    type: number
    sql: ${TABLE}.nib9157_02_A2 ;;
  }

  dimension: nib9157_02_a3 {
    type: number
    sql: ${TABLE}.nib9157_02_A3 ;;
  }

  dimension: nib9157_02_a4 {
    type: number
    sql: ${TABLE}.nib9157_02_A4 ;;
  }

  dimension: nib9157_02_a5 {
    type: number
    sql: ${TABLE}.nib9157_02_A5 ;;
  }

  dimension: nib9157_02_b1 {
    type: number
    sql: ${TABLE}.nib9157_02_B1 ;;
  }

  dimension: nib9157_02_b2 {
    type: number
    sql: ${TABLE}.nib9157_02_B2 ;;
  }

  dimension: nib9157_02_b3 {
    type: number
    sql: ${TABLE}.nib9157_02_B3 ;;
  }

  dimension: nib9157_02_b4 {
    type: number
    sql: ${TABLE}.nib9157_02_B4 ;;
  }

  dimension: nib9157_02_b5 {
    type: number
    sql: ${TABLE}.nib9157_02_B5 ;;
  }

  dimension: nib9157_02_b6 {
    type: number
    sql: ${TABLE}.nib9157_02_B6 ;;
  }

  dimension: nib9157_02_b7 {
    type: number
    sql: ${TABLE}.nib9157_02_B7 ;;
  }

  dimension: nib9157_02_c1 {
    type: number
    sql: ${TABLE}.nib9157_02_C1 ;;
  }

  dimension: nib9157_02_d1 {
    type: number
    sql: ${TABLE}.nib9157_02_D1 ;;
  }

  dimension: nib9157_02_e1 {
    type: number
    sql: ${TABLE}.nib9157_02_E1 ;;
  }

  dimension: nib9157_02_f1 {
    type: number
    sql: ${TABLE}.nib9157_02_F1 ;;
  }

  dimension: nib9157_02_g1 {
    type: number
    sql: ${TABLE}.nib9157_02_G1 ;;
  }

  dimension: nib9157_02_h1 {
    type: number
    sql: ${TABLE}.nib9157_02_H1 ;;
  }

  dimension: nib9157_02_h2 {
    type: number
    sql: ${TABLE}.nib9157_02_H2 ;;
  }

  dimension: nib9157_02_h3 {
    type: number
    sql: ${TABLE}.nib9157_02_H3 ;;
  }

  dimension: nib9157_02_h4 {
    type: number
    sql: ${TABLE}.nib9157_02_H4 ;;
  }

  dimension: nib9158_02_a1 {
    type: number
    sql: ${TABLE}.nib9158_02_A1 ;;
  }

  dimension: nib9158_02_a2 {
    type: number
    sql: ${TABLE}.nib9158_02_A2 ;;
  }

  dimension: nib9158_02_a3 {
    type: number
    sql: ${TABLE}.nib9158_02_A3 ;;
  }

  dimension: nib9158_02_a4 {
    type: number
    sql: ${TABLE}.nib9158_02_A4 ;;
  }

  dimension: nib9158_02_a5 {
    type: number
    sql: ${TABLE}.nib9158_02_A5 ;;
  }

  dimension: nib9158_02_b1 {
    type: number
    sql: ${TABLE}.nib9158_02_B1 ;;
  }

  dimension: nib9158_02_b2 {
    type: number
    sql: ${TABLE}.nib9158_02_B2 ;;
  }

  dimension: nib9158_02_b3 {
    type: number
    sql: ${TABLE}.nib9158_02_B3 ;;
  }

  dimension: nib9158_02_b4 {
    type: number
    sql: ${TABLE}.nib9158_02_B4 ;;
  }

  dimension: nib9158_02_b5 {
    type: number
    sql: ${TABLE}.nib9158_02_B5 ;;
  }

  dimension: nib9158_02_b6 {
    type: number
    sql: ${TABLE}.nib9158_02_B6 ;;
  }

  dimension: nib9158_02_b7 {
    type: number
    sql: ${TABLE}.nib9158_02_B7 ;;
  }

  dimension: nib9158_02_c1 {
    type: number
    sql: ${TABLE}.nib9158_02_C1 ;;
  }

  dimension: nib9158_02_d1 {
    type: number
    sql: ${TABLE}.nib9158_02_D1 ;;
  }

  dimension: nib9158_02_e1 {
    type: number
    sql: ${TABLE}.nib9158_02_E1 ;;
  }

  dimension: nib9158_02_f1 {
    type: number
    sql: ${TABLE}.nib9158_02_F1 ;;
  }

  dimension: nib9158_02_g1 {
    type: number
    sql: ${TABLE}.nib9158_02_G1 ;;
  }

  dimension: nib9158_02_h1 {
    type: number
    sql: ${TABLE}.nib9158_02_H1 ;;
  }

  dimension: nib9158_02_h2 {
    type: number
    sql: ${TABLE}.nib9158_02_H2 ;;
  }

  dimension: nib9158_02_h3 {
    type: number
    sql: ${TABLE}.nib9158_02_H3 ;;
  }

  dimension: nib9158_02_h4 {
    type: number
    sql: ${TABLE}.nib9158_02_H4 ;;
  }

  dimension: nib9159_02_a1 {
    type: number
    sql: ${TABLE}.nib9159_02_A1 ;;
  }

  dimension: nib9159_02_a2 {
    type: number
    sql: ${TABLE}.nib9159_02_A2 ;;
  }

  dimension: nib9159_02_a3 {
    type: number
    sql: ${TABLE}.nib9159_02_A3 ;;
  }

  dimension: nib9159_02_a4 {
    type: number
    sql: ${TABLE}.nib9159_02_A4 ;;
  }

  dimension: nib9159_02_a5 {
    type: number
    sql: ${TABLE}.nib9159_02_A5 ;;
  }

  dimension: nib9159_02_b1 {
    type: number
    sql: ${TABLE}.nib9159_02_B1 ;;
  }

  dimension: nib9159_02_b2 {
    type: number
    sql: ${TABLE}.nib9159_02_B2 ;;
  }

  dimension: nib9159_02_b3 {
    type: number
    sql: ${TABLE}.nib9159_02_B3 ;;
  }

  dimension: nib9159_02_b4 {
    type: number
    sql: ${TABLE}.nib9159_02_B4 ;;
  }

  dimension: nib9159_02_b5 {
    type: number
    sql: ${TABLE}.nib9159_02_B5 ;;
  }

  dimension: nib9159_02_b6 {
    type: number
    sql: ${TABLE}.nib9159_02_B6 ;;
  }

  dimension: nib9159_02_b7 {
    type: number
    sql: ${TABLE}.nib9159_02_B7 ;;
  }

  dimension: nib9159_02_c1 {
    type: number
    sql: ${TABLE}.nib9159_02_C1 ;;
  }

  dimension: nib9159_02_d1 {
    type: number
    sql: ${TABLE}.nib9159_02_D1 ;;
  }

  dimension: nib9159_02_e1 {
    type: number
    sql: ${TABLE}.nib9159_02_E1 ;;
  }

  dimension: nib9159_02_f1 {
    type: number
    sql: ${TABLE}.nib9159_02_F1 ;;
  }

  dimension: nib9159_02_g1 {
    type: number
    sql: ${TABLE}.nib9159_02_G1 ;;
  }

  dimension: nib9159_02_h1 {
    type: number
    sql: ${TABLE}.nib9159_02_H1 ;;
  }

  dimension: nib9159_02_h2 {
    type: number
    sql: ${TABLE}.nib9159_02_H2 ;;
  }

  dimension: nib9159_02_h3 {
    type: number
    sql: ${TABLE}.nib9159_02_H3 ;;
  }

  dimension: nib9159_02_h4 {
    type: number
    sql: ${TABLE}.nib9159_02_H4 ;;
  }

  dimension: nib9160_02_a1 {
    type: number
    sql: ${TABLE}.nib9160_02_A1 ;;
  }

  dimension: nib9160_02_a2 {
    type: number
    sql: ${TABLE}.nib9160_02_A2 ;;
  }

  dimension: nib9160_02_a3 {
    type: number
    sql: ${TABLE}.nib9160_02_A3 ;;
  }

  dimension: nib9160_02_a4 {
    type: number
    sql: ${TABLE}.nib9160_02_A4 ;;
  }

  dimension: nib9160_02_a5 {
    type: number
    sql: ${TABLE}.nib9160_02_A5 ;;
  }

  dimension: nib9160_02_b1 {
    type: number
    sql: ${TABLE}.nib9160_02_B1 ;;
  }

  dimension: nib9160_02_b2 {
    type: number
    sql: ${TABLE}.nib9160_02_B2 ;;
  }

  dimension: nib9160_02_b3 {
    type: number
    sql: ${TABLE}.nib9160_02_B3 ;;
  }

  dimension: nib9160_02_b4 {
    type: number
    sql: ${TABLE}.nib9160_02_B4 ;;
  }

  dimension: nib9160_02_b5 {
    type: number
    sql: ${TABLE}.nib9160_02_B5 ;;
  }

  dimension: nib9160_02_b6 {
    type: number
    sql: ${TABLE}.nib9160_02_B6 ;;
  }

  dimension: nib9160_02_b7 {
    type: number
    sql: ${TABLE}.nib9160_02_B7 ;;
  }

  dimension: nib9160_02_c1 {
    type: number
    sql: ${TABLE}.nib9160_02_C1 ;;
  }

  dimension: nib9160_02_d1 {
    type: number
    sql: ${TABLE}.nib9160_02_D1 ;;
  }

  dimension: nib9160_02_e1 {
    type: number
    sql: ${TABLE}.nib9160_02_E1 ;;
  }

  dimension: nib9160_02_f1 {
    type: number
    sql: ${TABLE}.nib9160_02_F1 ;;
  }

  dimension: nib9160_02_g1 {
    type: number
    sql: ${TABLE}.nib9160_02_G1 ;;
  }

  dimension: nib9160_02_h1 {
    type: number
    sql: ${TABLE}.nib9160_02_H1 ;;
  }

  dimension: nib9160_02_h2 {
    type: number
    sql: ${TABLE}.nib9160_02_H2 ;;
  }

  dimension: nib9160_02_h3 {
    type: number
    sql: ${TABLE}.nib9160_02_H3 ;;
  }

  dimension: nib9160_02_h4 {
    type: number
    sql: ${TABLE}.nib9160_02_H4 ;;
  }

  dimension: nib9180_c1 {
    type: number
    sql: ${TABLE}.nib9180_C1 ;;
  }

  dimension: nib9180_c4 {
    type: number
    sql: ${TABLE}.nib9180_C4 ;;
  }

  dimension: nib9180_f4 {
    type: number
    sql: ${TABLE}.nib9180_F4 ;;
  }

  dimension: nib9180_l1 {
    type: number
    sql: ${TABLE}.nib9180_L1 ;;
  }

  dimension: nib9180_l2 {
    type: number
    sql: ${TABLE}.nib9180_L2 ;;
  }

  dimension: nib9180_l3 {
    type: number
    sql: ${TABLE}.nib9180_L3 ;;
  }

  dimension: nib9180_l4 {
    type: number
    sql: ${TABLE}.nib9180_L4 ;;
  }

  dimension: nib9180_m1 {
    type: number
    sql: ${TABLE}.nib9180_M1 ;;
  }

  dimension: nib9180_m4 {
    type: number
    sql: ${TABLE}.nib9180_M4 ;;
  }

  dimension: nib9180_p1 {
    type: number
    sql: ${TABLE}.nib9180_P1 ;;
  }

  dimension: nib9180_p2 {
    type: number
    sql: ${TABLE}.nib9180_P2 ;;
  }

  dimension: nib9180_p3 {
    type: number
    sql: ${TABLE}.nib9180_P3 ;;
  }

  dimension: nib9180_p4 {
    type: number
    sql: ${TABLE}.nib9180_P4 ;;
  }

  dimension: nib9180_s1 {
    type: number
    sql: ${TABLE}.nib9180_S1 ;;
  }

  dimension: nib9180_s4 {
    type: number
    sql: ${TABLE}.nib9180_S4 ;;
  }

  dimension: nib9180_u1 {
    type: number
    sql: ${TABLE}.nib9180_U1 ;;
  }

  dimension: nib9180_u2 {
    type: number
    sql: ${TABLE}.nib9180_U2 ;;
  }

  dimension: nib9180_u3 {
    type: number
    sql: ${TABLE}.nib9180_U3 ;;
  }

  dimension: nib9180_u4 {
    type: number
    sql: ${TABLE}.nib9180_U4 ;;
  }

  dimension: nib9180_v1 {
    type: number
    sql: ${TABLE}.nib9180_V1 ;;
  }

  dimension: nib9180_v3 {
    type: number
    sql: ${TABLE}.nib9180_V3 ;;
  }

  dimension: nib9181_c1 {
    type: number
    sql: ${TABLE}.nib9181_C1 ;;
  }

  dimension: nib9181_c4 {
    type: number
    sql: ${TABLE}.nib9181_C4 ;;
  }

  dimension: nib9181_f4 {
    type: number
    sql: ${TABLE}.nib9181_F4 ;;
  }

  dimension: nib9181_l1 {
    type: number
    sql: ${TABLE}.nib9181_L1 ;;
  }

  dimension: nib9181_l2 {
    type: number
    sql: ${TABLE}.nib9181_L2 ;;
  }

  dimension: nib9181_l3 {
    type: number
    sql: ${TABLE}.nib9181_L3 ;;
  }

  dimension: nib9181_l4 {
    type: number
    sql: ${TABLE}.nib9181_L4 ;;
  }

  dimension: nib9181_m1 {
    type: number
    sql: ${TABLE}.nib9181_M1 ;;
  }

  dimension: nib9181_m4 {
    type: number
    sql: ${TABLE}.nib9181_M4 ;;
  }

  dimension: nib9181_p1 {
    type: number
    sql: ${TABLE}.nib9181_P1 ;;
  }

  dimension: nib9181_p2 {
    type: number
    sql: ${TABLE}.nib9181_P2 ;;
  }

  dimension: nib9181_p3 {
    type: number
    sql: ${TABLE}.nib9181_P3 ;;
  }

  dimension: nib9181_p4 {
    type: number
    sql: ${TABLE}.nib9181_P4 ;;
  }

  dimension: nib9181_s1 {
    type: number
    sql: ${TABLE}.nib9181_S1 ;;
  }

  dimension: nib9181_s4 {
    type: number
    sql: ${TABLE}.nib9181_S4 ;;
  }

  dimension: nib9181_u1 {
    type: number
    sql: ${TABLE}.nib9181_U1 ;;
  }

  dimension: nib9181_u2 {
    type: number
    sql: ${TABLE}.nib9181_U2 ;;
  }

  dimension: nib9181_u3 {
    type: number
    sql: ${TABLE}.nib9181_U3 ;;
  }

  dimension: nib9181_u4 {
    type: number
    sql: ${TABLE}.nib9181_U4 ;;
  }

  dimension: nib9181_v1 {
    type: number
    sql: ${TABLE}.nib9181_V1 ;;
  }

  dimension: nib9181_v3 {
    type: number
    sql: ${TABLE}.nib9181_V3 ;;
  }

  dimension: nib9358 {
    type: string
    sql: ${TABLE}.nib9358 ;;
  }

  dimension: nib9509_1 {
    type: number
    sql: ${TABLE}.nib9509_1 ;;
  }

  dimension: nib9509_2 {
    type: number
    sql: ${TABLE}.nib9509_2 ;;
  }

  dimension: nib9509_3 {
    type: number
    sql: ${TABLE}.nib9509_3 ;;
  }

  dimension: nib9509_4 {
    type: number
    sql: ${TABLE}.nib9509_4 ;;
  }

  dimension: nib9510_1 {
    type: number
    sql: ${TABLE}.nib9510_1 ;;
  }

  dimension: nib9510_2 {
    type: number
    sql: ${TABLE}.nib9510_2 ;;
  }

  dimension: nib9510_3 {
    type: number
    sql: ${TABLE}.nib9510_3 ;;
  }

  dimension: nib9510_4 {
    type: number
    sql: ${TABLE}.nib9510_4 ;;
  }

  dimension: nib9511_1 {
    type: number
    sql: ${TABLE}.nib9511_1 ;;
  }

  dimension: nib9511_2 {
    type: number
    sql: ${TABLE}.nib9511_2 ;;
  }

  dimension: nib9511_3 {
    type: number
    sql: ${TABLE}.nib9511_3 ;;
  }

  dimension: nib9511_4 {
    type: number
    sql: ${TABLE}.nib9511_4 ;;
  }

  dimension: nib9512_1 {
    type: number
    sql: ${TABLE}.nib9512_1 ;;
  }

  dimension: nib9512_2 {
    type: number
    sql: ${TABLE}.nib9512_2 ;;
  }

  dimension: nib9512_3 {
    type: number
    sql: ${TABLE}.nib9512_3 ;;
  }

  dimension: nib9512_4 {
    type: number
    sql: ${TABLE}.nib9512_4 ;;
  }

  dimension: nib9513_1 {
    type: number
    sql: ${TABLE}.nib9513_1 ;;
  }

  dimension: nib9513_2 {
    type: number
    sql: ${TABLE}.nib9513_2 ;;
  }

  dimension: nib9513_3 {
    type: number
    sql: ${TABLE}.nib9513_3 ;;
  }

  dimension: nib9513_4 {
    type: number
    sql: ${TABLE}.nib9513_4 ;;
  }

  dimension: nib9514_1 {
    type: number
    sql: ${TABLE}.nib9514_1 ;;
  }

  dimension: nib9514_2 {
    type: number
    sql: ${TABLE}.nib9514_2 ;;
  }

  dimension: nib9514_3 {
    type: number
    sql: ${TABLE}.nib9514_3 ;;
  }

  dimension: nib9514_4 {
    type: number
    sql: ${TABLE}.nib9514_4 ;;
  }

  dimension: nib9515_f {
    type: number
    sql: ${TABLE}.nib9515_F ;;
  }

  dimension: nib9515_m {
    type: number
    sql: ${TABLE}.nib9515_M ;;
  }

  dimension: nib9516_f {
    type: number
    sql: ${TABLE}.nib9516_F ;;
  }

  dimension: nib9516_m {
    type: number
    sql: ${TABLE}.nib9516_M ;;
  }

  dimension: nib9517_f {
    type: number
    sql: ${TABLE}.nib9517_F ;;
  }

  dimension: nib9517_m {
    type: number
    sql: ${TABLE}.nib9517_M ;;
  }

  dimension: nib9518_f {
    type: number
    sql: ${TABLE}.nib9518_F ;;
  }

  dimension: nib9518_m {
    type: number
    sql: ${TABLE}.nib9518_M ;;
  }

  dimension: nib9519_f {
    type: number
    sql: ${TABLE}.nib9519_F ;;
  }

  dimension: nib9519_m {
    type: number
    sql: ${TABLE}.nib9519_M ;;
  }

  dimension: nib9528_a {
    type: number
    sql: ${TABLE}.nib9528_A ;;
  }

  dimension: nib9528_b {
    type: number
    sql: ${TABLE}.nib9528_B ;;
  }

  dimension: nib9528_c {
    type: number
    sql: ${TABLE}.nib9528_C ;;
  }

  dimension: nib9528_h {
    type: number
    sql: ${TABLE}.nib9528_H ;;
  }

  dimension: nib9528_i {
    type: number
    sql: ${TABLE}.nib9528_I ;;
  }

  dimension: nib9528_n {
    type: number
    sql: ${TABLE}.nib9528_N ;;
  }

  dimension: nib9528_o {
    type: number
    sql: ${TABLE}.nib9528_O ;;
  }

  dimension: nib9528_p {
    type: number
    sql: ${TABLE}.nib9528_P ;;
  }

  dimension: nib9528_w {
    type: number
    sql: ${TABLE}.nib9528_W ;;
  }

  dimension: nib9529_a {
    type: number
    sql: ${TABLE}.nib9529_A ;;
  }

  dimension: nib9529_b {
    type: number
    sql: ${TABLE}.nib9529_B ;;
  }

  dimension: nib9529_c {
    type: number
    sql: ${TABLE}.nib9529_C ;;
  }

  dimension: nib9529_h {
    type: number
    sql: ${TABLE}.nib9529_H ;;
  }

  dimension: nib9529_i {
    type: number
    sql: ${TABLE}.nib9529_I ;;
  }

  dimension: nib9529_n {
    type: number
    sql: ${TABLE}.nib9529_N ;;
  }

  dimension: nib9529_o {
    type: number
    sql: ${TABLE}.nib9529_O ;;
  }

  dimension: nib9529_p {
    type: number
    sql: ${TABLE}.nib9529_P ;;
  }

  dimension: nib9529_w {
    type: number
    sql: ${TABLE}.nib9529_W ;;
  }

  dimension: nib9530_a {
    type: number
    sql: ${TABLE}.nib9530_A ;;
  }

  dimension: nib9530_b {
    type: number
    sql: ${TABLE}.nib9530_B ;;
  }

  dimension: nib9530_c {
    type: number
    sql: ${TABLE}.nib9530_C ;;
  }

  dimension: nib9530_h {
    type: number
    sql: ${TABLE}.nib9530_H ;;
  }

  dimension: nib9530_i {
    type: number
    sql: ${TABLE}.nib9530_I ;;
  }

  dimension: nib9530_n {
    type: number
    sql: ${TABLE}.nib9530_N ;;
  }

  dimension: nib9530_o {
    type: number
    sql: ${TABLE}.nib9530_O ;;
  }

  dimension: nib9530_p {
    type: number
    sql: ${TABLE}.nib9530_P ;;
  }

  dimension: nib9530_w {
    type: number
    sql: ${TABLE}.nib9530_W ;;
  }

  dimension: nib9531_a {
    type: number
    sql: ${TABLE}.nib9531_A ;;
  }

  dimension: nib9531_b {
    type: number
    sql: ${TABLE}.nib9531_B ;;
  }

  dimension: nib9531_c {
    type: number
    sql: ${TABLE}.nib9531_C ;;
  }

  dimension: nib9531_h {
    type: number
    sql: ${TABLE}.nib9531_H ;;
  }

  dimension: nib9531_i {
    type: number
    sql: ${TABLE}.nib9531_I ;;
  }

  dimension: nib9531_n {
    type: number
    sql: ${TABLE}.nib9531_N ;;
  }

  dimension: nib9531_o {
    type: number
    sql: ${TABLE}.nib9531_O ;;
  }

  dimension: nib9531_p {
    type: number
    sql: ${TABLE}.nib9531_P ;;
  }

  dimension: nib9531_w {
    type: number
    sql: ${TABLE}.nib9531_W ;;
  }

  dimension: nib9532_a {
    type: number
    sql: ${TABLE}.nib9532_A ;;
  }

  dimension: nib9532_b {
    type: number
    sql: ${TABLE}.nib9532_B ;;
  }

  dimension: nib9532_c {
    type: number
    sql: ${TABLE}.nib9532_C ;;
  }

  dimension: nib9532_h {
    type: number
    sql: ${TABLE}.nib9532_H ;;
  }

  dimension: nib9532_i {
    type: number
    sql: ${TABLE}.nib9532_I ;;
  }

  dimension: nib9532_n {
    type: number
    sql: ${TABLE}.nib9532_N ;;
  }

  dimension: nib9532_o {
    type: number
    sql: ${TABLE}.nib9532_O ;;
  }

  dimension: nib9532_p {
    type: number
    sql: ${TABLE}.nib9532_P ;;
  }

  dimension: nib9532_w {
    type: number
    sql: ${TABLE}.nib9532_W ;;
  }

  dimension: nib9533_a {
    type: number
    sql: ${TABLE}.nib9533_A ;;
  }

  dimension: nib9533_b {
    type: number
    sql: ${TABLE}.nib9533_B ;;
  }

  dimension: nib9533_c {
    type: number
    sql: ${TABLE}.nib9533_C ;;
  }

  dimension: nib9533_h {
    type: number
    sql: ${TABLE}.nib9533_H ;;
  }

  dimension: nib9533_i {
    type: number
    sql: ${TABLE}.nib9533_I ;;
  }

  dimension: nib9533_n {
    type: number
    sql: ${TABLE}.nib9533_N ;;
  }

  dimension: nib9533_o {
    type: number
    sql: ${TABLE}.nib9533_O ;;
  }

  dimension: nib9533_p {
    type: number
    sql: ${TABLE}.nib9533_P ;;
  }

  dimension: nib9533_w {
    type: number
    sql: ${TABLE}.nib9533_W ;;
  }

  dimension: nib9557 {
    type: number
    sql: ${TABLE}.nib9557 ;;
  }

  dimension: nib9567 {
    type: number
    sql: ${TABLE}.nib9567 ;;
  }

  dimension: nib9569 {
    type: number
    sql: ${TABLE}.nib9569 ;;
  }

  dimension: nib9588_01 {
    type: number
    sql: ${TABLE}.nib9588_01 ;;
  }

  dimension: nib9588_02 {
    type: number
    sql: ${TABLE}.nib9588_02 ;;
  }

  dimension: nib9588_03 {
    type: number
    sql: ${TABLE}.nib9588_03 ;;
  }

  dimension: nib9588_04 {
    type: number
    sql: ${TABLE}.nib9588_04 ;;
  }

  dimension: nib9588_05 {
    type: number
    sql: ${TABLE}.nib9588_05 ;;
  }

  dimension: nib9588_06 {
    type: number
    sql: ${TABLE}.nib9588_06 ;;
  }

  dimension: nib9588_07 {
    type: number
    sql: ${TABLE}.nib9588_07 ;;
  }

  dimension: nib9588_08 {
    type: number
    sql: ${TABLE}.nib9588_08 ;;
  }

  dimension: nib9588_09 {
    type: number
    sql: ${TABLE}.nib9588_09 ;;
  }

  dimension: nib9588_10 {
    type: number
    sql: ${TABLE}.nib9588_10 ;;
  }

  dimension: nib9588_11 {
    type: number
    sql: ${TABLE}.nib9588_11 ;;
  }

  dimension: nib9588_12 {
    type: number
    sql: ${TABLE}.nib9588_12 ;;
  }

  dimension: nib9750 {
    type: string
    sql: ${TABLE}.nib9750 ;;
  }

  dimension: nib9751 {
    type: string
    sql: ${TABLE}.nib9751 ;;
  }

  dimension: nib9752_c {
    type: number
    sql: ${TABLE}.nib9752_C ;;
  }

  dimension: nib9752_f {
    type: number
    sql: ${TABLE}.nib9752_F ;;
  }

  dimension: nib9752_i {
    type: number
    sql: ${TABLE}.nib9752_I ;;
  }

  dimension: nib9752_r {
    type: number
    sql: ${TABLE}.nib9752_R ;;
  }

  dimension: nib9752_v {
    type: number
    sql: ${TABLE}.nib9752_V ;;
  }

  dimension: nib9780 {
    type: number
    sql: ${TABLE}.nib9780 ;;
  }

  dimension: rando {
    type: number
    sql: ${TABLE}.rando ;;
  }

  dimension: zip_code_3043 {
    type: string
    sql: ${TABLE}.ZIP_CODE_3043 ;;
  }

}
