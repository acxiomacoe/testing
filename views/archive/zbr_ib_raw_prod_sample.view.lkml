view: zbr_ib_raw_prod_sample {
  sql_table_name: `landing.zbr_ib_raw_prod_sample`
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

  measure: percent_of_total_target {
    type: percent_of_total
    sql: ${target_distinct_count} ;;
  }

  measure: percent_of_total_reference {
    type: percent_of_total
    sql: ${reference_distinct_count} ;;
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

  dimension: target_flg {
    type: number
    sql: ${TABLE}.target_flg ;;
  }




  dimension: area_lat {
    type: number
    sql: ${TABLE}.area_lat ;;
  }

  dimension: area_lon {
    type: number
    sql: ${TABLE}.area_lon ;;
  }

  # dimension: cbsa_code_3005 {
  #   type: string
  #   sql: ${TABLE}.CBSA_CODE_3005 ;;
  # }

  # dimension: census_block_code_1003 {
  #   type: string
  #   sql: ${TABLE}.CENSUS_BLOCK_CODE_1003 ;;
  # }

  # dimension: census_block_group_3004 {
  #   type: string
  #   sql: ${TABLE}.CENSUS_BLOCK_GROUP_3004 ;;
  # }

  # dimension: census_tract_code_3006 {
  #   type: string
  #   sql: ${TABLE}.CENSUS_TRACT_CODE_3006 ;;
  # }

  dimension: dma_code_3010 {
    type: string
    sql: ${TABLE}.DMA_CODE_3010 ;;
  }

  dimension: fips_county_code_3007 {
    type: string
    sql: ${TABLE}.FIPS_COUNTY_CODE_3007 ;;
  }

  dimension: fips_mcd_code_3023 {
    type: string
    sql: ${TABLE}.FIPS_MCD_CODE_3023 ;;
  }

  dimension: fips_state_code_3016 {
    type: string
    sql: ${TABLE}.FIPS_STATE_CODE_3016 ;;
  }

  dimension: geo_match_level_code_3018 {
    type: string
    sql: ${TABLE}.GEO_MATCH_LEVEL_CODE_3018 ;;
  }

  # dimension: ibe1273_01 {
  #   type: string
  #   sql: ${TABLE}.IBE1273_01 ;;
  # }

  # dimension: ibe1273_02 {
  #   type: string
  #   sql: ${TABLE}.IBE1273_02 ;;
  # }

  # dimension: ibe1802 {
  #   type: string
  #   sql: ${TABLE}.IBE1802 ;;
  # }

  # dimension: ibe1806 {
  #   type: string
  #   sql: ${TABLE}.IBE1806 ;;
  # }

  # dimension: ibe2000 {
  #   type: string
  #   sql: ${TABLE}.IBE2000 ;;
  # }

  # dimension: ibe2001 {
  #   type: string
  #   sql: ${TABLE}.IBE2001 ;;
  # }

  # dimension: ibe2002 {
  #   type: string
  #   sql: ${TABLE}.IBE2002 ;;
  # }

  # dimension: ibe2003 {
  #   type: string
  #   sql: ${TABLE}.IBE2003 ;;
  # }

  # dimension: ibe2004 {
  #   type: string
  #   sql: ${TABLE}.IBE2004 ;;
  # }

  # dimension: ibe2005 {
  #   type: string
  #   sql: ${TABLE}.IBE2005 ;;
  # }

  # dimension: ibe2006 {
  #   type: string
  #   sql: ${TABLE}.IBE2006 ;;
  # }

  # dimension: ibe2007 {
  #   type: string
  #   sql: ${TABLE}.IBE2007 ;;
  # }

  # dimension: ibe2008 {
  #   type: string
  #   sql: ${TABLE}.IBE2008 ;;
  # }

  # dimension: ibe2009 {
  #   type: string
  #   sql: ${TABLE}.IBE2009 ;;
  # }

  # dimension: ibe2010 {
  #   type: string
  #   sql: ${TABLE}.IBE2010 ;;
  # }

  # dimension: ibe2011 {
  #   type: string
  #   sql: ${TABLE}.IBE2011 ;;
  # }

  # dimension: ibe2012 {
  #   type: string
  #   sql: ${TABLE}.IBE2012 ;;
  # }

  # dimension: ibe2013 {
  #   type: string
  #   sql: ${TABLE}.IBE2013 ;;
  # }

  # dimension: ibe2014 {
  #   type: string
  #   sql: ${TABLE}.IBE2014 ;;
  # }

  # dimension: ibe2015 {
  #   type: string
  #   sql: ${TABLE}.IBE2015 ;;
  # }

  # dimension: ibe2016 {
  #   type: string
  #   sql: ${TABLE}.IBE2016 ;;
  # }

  # dimension: ibe2017 {
  #   type: string
  #   sql: ${TABLE}.IBE2017 ;;
  # }

  # dimension: ibe2018 {
  #   type: string
  #   sql: ${TABLE}.IBE2018 ;;
  # }

  # dimension: ibe2019 {
  #   type: string
  #   sql: ${TABLE}.IBE2019 ;;
  # }

  # dimension: ibe2020 {
  #   type: string
  #   sql: ${TABLE}.IBE2020 ;;
  # }

  # dimension: ibe2021 {
  #   type: string
  #   sql: ${TABLE}.IBE2021 ;;
  # }

  # dimension: ibe2022 {
  #   type: string
  #   sql: ${TABLE}.IBE2022 ;;
  # }

  # dimension: ibe2023 {
  #   type: string
  #   sql: ${TABLE}.IBE2023 ;;
  # }

  # dimension: ibe2024 {
  #   type: string
  #   sql: ${TABLE}.IBE2024 ;;
  # }

  # dimension: ibe2025 {
  #   type: string
  #   sql: ${TABLE}.IBE2025 ;;
  # }

  # dimension: ibe2026 {
  #   type: string
  #   sql: ${TABLE}.IBE2026 ;;
  # }

  # dimension: ibe2029 {
  #   type: string
  #   sql: ${TABLE}.IBE2029 ;;
  # }

  # dimension: ibe2030 {
  #   type: string
  #   sql: ${TABLE}.IBE2030 ;;
  # }

  # dimension: ibe2031 {
  #   type: string
  #   sql: ${TABLE}.IBE2031 ;;
  # }

  # dimension: ibe2032 {
  #   type: string
  #   sql: ${TABLE}.IBE2032 ;;
  # }

  # dimension: ibe2033 {
  #   type: string
  #   sql: ${TABLE}.IBE2033 ;;
  # }

  # dimension: ibe2058_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2058_01 ;;
  # }

  # dimension: ibe2058_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2058_02 ;;
  # }

  # dimension: ibe2059_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2059_01 ;;
  # }

  # dimension: ibe2059_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2059_02 ;;
  # }

  # dimension: ibe2060_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2060_01 ;;
  # }

  # dimension: ibe2060_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2060_02 ;;
  # }

  # dimension: ibe2061_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2061_01 ;;
  # }

  # dimension: ibe2061_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2061_02 ;;
  # }

  # dimension: ibe2062_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2062_01 ;;
  # }

  # dimension: ibe2062_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2062_02 ;;
  # }

  # dimension: ibe2076_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_01 ;;
  # }

  # dimension: ibe2076_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_02 ;;
  # }

  # dimension: ibe2076_03 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_03 ;;
  # }

  # dimension: ibe2076_04 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_04 ;;
  # }

  # dimension: ibe2076_05 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_05 ;;
  # }

  # dimension: ibe2076_06 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_06 ;;
  # }

  # dimension: ibe2076_07 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_07 ;;
  # }

  # dimension: ibe2076_08 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_08 ;;
  # }

  # dimension: ibe2076_09 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_09 ;;
  # }

  # dimension: ibe2076_10 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_10 ;;
  # }

  # dimension: ibe2076_11 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_11 ;;
  # }

  # dimension: ibe2076_12 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_12 ;;
  # }

  # dimension: ibe2076_13 {
  #   type: string
  #   sql: ${TABLE}.IBE2076_13 ;;
  # }

  # dimension: ibe2077 {
  #   type: string
  #   sql: ${TABLE}.IBE2077 ;;
  # }

  # dimension: ibe2080 {
  #   type: string
  #   sql: ${TABLE}.IBE2080 ;;
  # }

  # dimension: ibe2081 {
  #   type: string
  #   sql: ${TABLE}.IBE2081 ;;
  # }

  # dimension: ibe2082 {
  #   type: string
  #   sql: ${TABLE}.IBE2082 ;;
  # }

  # dimension: ibe2083 {
  #   type: string
  #   sql: ${TABLE}.IBE2083 ;;
  # }

  # dimension: ibe2084 {
  #   type: string
  #   sql: ${TABLE}.IBE2084 ;;
  # }

  # dimension: ibe2085 {
  #   type: string
  #   sql: ${TABLE}.IBE2085 ;;
  # }

  # dimension: ibe2086 {
  #   type: string
  #   sql: ${TABLE}.IBE2086 ;;
  # }

  # dimension: ibe2087 {
  #   type: string
  #   sql: ${TABLE}.IBE2087 ;;
  # }

  # dimension: ibe2088 {
  #   type: string
  #   sql: ${TABLE}.IBE2088 ;;
  # }

  # dimension: ibe2089 {
  #   type: string
  #   sql: ${TABLE}.IBE2089 ;;
  # }

  # dimension: ibe2090 {
  #   type: string
  #   sql: ${TABLE}.IBE2090 ;;
  # }

  # dimension: ibe2091 {
  #   type: string
  #   sql: ${TABLE}.IBE2091 ;;
  # }

  # dimension: ibe2092 {
  #   type: string
  #   sql: ${TABLE}.IBE2092 ;;
  # }

  # dimension: ibe2093 {
  #   type: string
  #   sql: ${TABLE}.IBE2093 ;;
  # }

  # dimension: ibe2094 {
  #   type: string
  #   sql: ${TABLE}.IBE2094 ;;
  # }

  # dimension: ibe2095 {
  #   type: string
  #   sql: ${TABLE}.IBE2095 ;;
  # }

  # dimension: ibe2096 {
  #   type: string
  #   sql: ${TABLE}.IBE2096 ;;
  # }

  # dimension: ibe2097 {
  #   type: string
  #   sql: ${TABLE}.IBE2097 ;;
  # }

  # dimension: ibe2098 {
  #   type: string
  #   sql: ${TABLE}.IBE2098 ;;
  # }

  # dimension: ibe2144 {
  #   type: string
  #   sql: ${TABLE}.IBE2144 ;;
  # }

  # dimension: ibe2145 {
  #   type: string
  #   sql: ${TABLE}.IBE2145 ;;
  # }

  # dimension: ibe2146 {
  #   type: string
  #   sql: ${TABLE}.IBE2146 ;;
  # }

  # dimension: ibe2147 {
  #   type: string
  #   sql: ${TABLE}.IBE2147 ;;
  # }

  # dimension: ibe2148 {
  #   type: string
  #   sql: ${TABLE}.IBE2148 ;;
  # }

  # dimension: ibe2149 {
  #   type: string
  #   sql: ${TABLE}.IBE2149 ;;
  # }

  # dimension: ibe2150 {
  #   type: string
  #   sql: ${TABLE}.IBE2150 ;;
  # }

  # dimension: ibe2151 {
  #   type: string
  #   sql: ${TABLE}.IBE2151 ;;
  # }

  # dimension: ibe2152 {
  #   type: string
  #   sql: ${TABLE}.IBE2152 ;;
  # }

  # dimension: ibe2153 {
  #   type: string
  #   sql: ${TABLE}.IBE2153 ;;
  # }

  # dimension: ibe2154 {
  #   type: string
  #   sql: ${TABLE}.IBE2154 ;;
  # }

  # dimension: ibe2155 {
  #   type: string
  #   sql: ${TABLE}.IBE2155 ;;
  # }

  # dimension: ibe2156 {
  #   type: string
  #   sql: ${TABLE}.IBE2156 ;;
  # }

  # dimension: ibe2157 {
  #   type: string
  #   sql: ${TABLE}.IBE2157 ;;
  # }

  # dimension: ibe2158 {
  #   type: string
  #   sql: ${TABLE}.IBE2158 ;;
  # }

  # dimension: ibe2159 {
  #   type: string
  #   sql: ${TABLE}.IBE2159 ;;
  # }

  # dimension: ibe2160 {
  #   type: string
  #   sql: ${TABLE}.IBE2160 ;;
  # }

  # dimension: ibe2161 {
  #   type: string
  #   sql: ${TABLE}.IBE2161 ;;
  # }

  # dimension: ibe2162 {
  #   type: string
  #   sql: ${TABLE}.IBE2162 ;;
  # }

  # dimension: ibe2163 {
  #   type: string
  #   sql: ${TABLE}.IBE2163 ;;
  # }

  # dimension: ibe2164 {
  #   type: string
  #   sql: ${TABLE}.IBE2164 ;;
  # }

  # dimension: ibe2165 {
  #   type: string
  #   sql: ${TABLE}.IBE2165 ;;
  # }

  # dimension: ibe2166 {
  #   type: string
  #   sql: ${TABLE}.IBE2166 ;;
  # }

  # dimension: ibe2167 {
  #   type: string
  #   sql: ${TABLE}.IBE2167 ;;
  # }

  # dimension: ibe2168 {
  #   type: string
  #   sql: ${TABLE}.IBE2168 ;;
  # }

  # dimension: ibe2169 {
  #   type: string
  #   sql: ${TABLE}.IBE2169 ;;
  # }

  # dimension: ibe2170 {
  #   type: string
  #   sql: ${TABLE}.IBE2170 ;;
  # }

  # dimension: ibe2171 {
  #   type: string
  #   sql: ${TABLE}.IBE2171 ;;
  # }

  # dimension: ibe2172 {
  #   type: string
  #   sql: ${TABLE}.IBE2172 ;;
  # }

  # dimension: ibe2173 {
  #   type: string
  #   sql: ${TABLE}.IBE2173 ;;
  # }

  # dimension: ibe2174 {
  #   type: string
  #   sql: ${TABLE}.IBE2174 ;;
  # }

  # dimension: ibe2175 {
  #   type: string
  #   sql: ${TABLE}.IBE2175 ;;
  # }

  # dimension: ibe2176 {
  #   type: string
  #   sql: ${TABLE}.IBE2176 ;;
  # }

  # dimension: ibe2177 {
  #   type: string
  #   sql: ${TABLE}.IBE2177 ;;
  # }

  # dimension: ibe2178 {
  #   type: string
  #   sql: ${TABLE}.IBE2178 ;;
  # }

  # dimension: ibe2179 {
  #   type: string
  #   sql: ${TABLE}.IBE2179 ;;
  # }

  # dimension: ibe2180 {
  #   type: string
  #   sql: ${TABLE}.IBE2180 ;;
  # }

  # dimension: ibe2181 {
  #   type: string
  #   sql: ${TABLE}.IBE2181 ;;
  # }

  # dimension: ibe2182 {
  #   type: string
  #   sql: ${TABLE}.IBE2182 ;;
  # }

  # dimension: ibe2183 {
  #   type: string
  #   sql: ${TABLE}.IBE2183 ;;
  # }

  # dimension: ibe2184 {
  #   type: string
  #   sql: ${TABLE}.IBE2184 ;;
  # }

  # dimension: ibe2185 {
  #   type: string
  #   sql: ${TABLE}.IBE2185 ;;
  # }

  # dimension: ibe2186 {
  #   type: string
  #   sql: ${TABLE}.IBE2186 ;;
  # }

  # dimension: ibe2187 {
  #   type: string
  #   sql: ${TABLE}.IBE2187 ;;
  # }

  # dimension: ibe2188 {
  #   type: string
  #   sql: ${TABLE}.IBE2188 ;;
  # }

  # dimension: ibe2189 {
  #   type: string
  #   sql: ${TABLE}.IBE2189 ;;
  # }

  # dimension: ibe2190 {
  #   type: string
  #   sql: ${TABLE}.IBE2190 ;;
  # }

  # dimension: ibe2191 {
  #   type: string
  #   sql: ${TABLE}.IBE2191 ;;
  # }

  # dimension: ibe2192 {
  #   type: string
  #   sql: ${TABLE}.IBE2192 ;;
  # }

  # dimension: ibe2193 {
  #   type: string
  #   sql: ${TABLE}.IBE2193 ;;
  # }

  # dimension: ibe2194 {
  #   type: string
  #   sql: ${TABLE}.IBE2194 ;;
  # }

  # dimension: ibe2195 {
  #   type: string
  #   sql: ${TABLE}.IBE2195 ;;
  # }

  # dimension: ibe2205 {
  #   type: string
  #   sql: ${TABLE}.IBE2205 ;;
  # }

  # dimension: ibe2206 {
  #   type: string
  #   sql: ${TABLE}.IBE2206 ;;
  # }

  # dimension: ibe2208 {
  #   type: string
  #   sql: ${TABLE}.IBE2208 ;;
  # }

  # dimension: ibe2350 {
  #   type: string
  #   sql: ${TABLE}.IBE2350 ;;
  # }

  # dimension: ibe2351 {
  #   type: string
  #   sql: ${TABLE}.IBE2351 ;;
  # }

  # dimension: ibe2354 {
  #   type: string
  #   sql: ${TABLE}.IBE2354 ;;
  # }

  # dimension: ibe2356 {
  #   type: string
  #   sql: ${TABLE}.IBE2356 ;;
  # }

  # dimension: ibe2360 {
  #   type: string
  #   sql: ${TABLE}.IBE2360 ;;
  # }

  # dimension: ibe2361 {
  #   type: string
  #   sql: ${TABLE}.IBE2361 ;;
  # }

  # dimension: ibe2362 {
  #   type: string
  #   sql: ${TABLE}.IBE2362 ;;
  # }

  # dimension: ibe2363 {
  #   type: string
  #   sql: ${TABLE}.IBE2363 ;;
  # }

  # dimension: ibe2364 {
  #   type: string
  #   sql: ${TABLE}.IBE2364 ;;
  # }

  # dimension: ibe2365 {
  #   type: string
  #   sql: ${TABLE}.IBE2365 ;;
  # }

  # dimension: ibe2366 {
  #   type: string
  #   sql: ${TABLE}.IBE2366 ;;
  # }

  # dimension: ibe2367 {
  #   type: string
  #   sql: ${TABLE}.IBE2367 ;;
  # }

  # dimension: ibe2368 {
  #   type: string
  #   sql: ${TABLE}.IBE2368 ;;
  # }

  # dimension: ibe2369 {
  #   type: string
  #   sql: ${TABLE}.IBE2369 ;;
  # }

  # dimension: ibe2370 {
  #   type: string
  #   sql: ${TABLE}.IBE2370 ;;
  # }

  # dimension: ibe2371 {
  #   type: string
  #   sql: ${TABLE}.IBE2371 ;;
  # }

  # dimension: ibe2372 {
  #   type: string
  #   sql: ${TABLE}.IBE2372 ;;
  # }

  # dimension: ibe2373 {
  #   type: string
  #   sql: ${TABLE}.IBE2373 ;;
  # }

  # dimension: ibe2403_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2403_01 ;;
  # }

  # dimension: ibe2507_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2507_01 ;;
  # }

  # dimension: ibe2507_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2507_02 ;;
  # }

  # dimension: ibe2508 {
  #   type: string
  #   sql: ${TABLE}.IBE2508 ;;
  # }

  # dimension: ibe2509 {
  #   type: string
  #   sql: ${TABLE}.IBE2509 ;;
  # }

  # dimension: ibe2510 {
  #   type: string
  #   sql: ${TABLE}.IBE2510 ;;
  # }

  # dimension: ibe2522_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2522_01 ;;
  # }

  # dimension: ibe2522_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2522_02 ;;
  # }

  # dimension: ibe2524_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2524_01 ;;
  # }

  # dimension: ibe2524_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2524_02 ;;
  # }

  # dimension: ibe2526 {
  #   type: string
  #   sql: ${TABLE}.IBE2526 ;;
  # }

  # dimension: ibe2527 {
  #   type: string
  #   sql: ${TABLE}.IBE2527 ;;
  # }

  # dimension: ibe2529 {
  #   type: string
  #   sql: ${TABLE}.IBE2529 ;;
  # }

  # dimension: ibe2531_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2531_01 ;;
  # }

  # dimension: ibe2531_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2531_02 ;;
  # }

  # dimension: ibe2532_01 {
  #   type: string
  #   sql: ${TABLE}.IBE2532_01 ;;
  # }

  # dimension: ibe2532_02 {
  #   type: string
  #   sql: ${TABLE}.IBE2532_02 ;;
  # }

  # dimension: ibe2751 {
  #   type: string
  #   sql: ${TABLE}.IBE2751 ;;
  # }

  # dimension: ibe2752 {
  #   type: string
  #   sql: ${TABLE}.IBE2752 ;;
  # }

  # dimension: ibe2753 {
  #   type: string
  #   sql: ${TABLE}.IBE2753 ;;
  # }

  # dimension: ibe2754 {
  #   type: string
  #   sql: ${TABLE}.IBE2754 ;;
  # }

  # dimension: ibe2755 {
  #   type: string
  #   sql: ${TABLE}.IBE2755 ;;
  # }

  # dimension: ibe2756 {
  #   type: string
  #   sql: ${TABLE}.IBE2756 ;;
  # }

  # dimension: ibe2757 {
  #   type: string
  #   sql: ${TABLE}.IBE2757 ;;
  # }

  # dimension: ibe2758 {
  #   type: string
  #   sql: ${TABLE}.IBE2758 ;;
  # }

  # dimension: ibe2759 {
  #   type: string
  #   sql: ${TABLE}.IBE2759 ;;
  # }

  # dimension: ibe2760 {
  #   type: string
  #   sql: ${TABLE}.IBE2760 ;;
  # }

  # dimension: ibe2761 {
  #   type: string
  #   sql: ${TABLE}.IBE2761 ;;
  # }

  # dimension: ibe2762 {
  #   type: string
  #   sql: ${TABLE}.IBE2762 ;;
  # }

  # dimension: ibe2763 {
  #   type: string
  #   sql: ${TABLE}.IBE2763 ;;
  # }

  # dimension: ibe2764 {
  #   type: string
  #   sql: ${TABLE}.IBE2764 ;;
  # }

  # dimension: ibe2765 {
  #   type: string
  #   sql: ${TABLE}.IBE2765 ;;
  # }

  # dimension: ibe2766 {
  #   type: string
  #   sql: ${TABLE}.IBE2766 ;;
  # }

  # dimension: ibe2767 {
  #   type: string
  #   sql: ${TABLE}.IBE2767 ;;
  # }

  # dimension: ibe2768 {
  #   type: string
  #   sql: ${TABLE}.IBE2768 ;;
  # }

  # dimension: ibe2769 {
  #   type: string
  #   sql: ${TABLE}.IBE2769 ;;
  # }

  # dimension: ibe2770 {
  #   type: string
  #   sql: ${TABLE}.IBE2770 ;;
  # }

  # dimension: ibe2771 {
  #   type: string
  #   sql: ${TABLE}.IBE2771 ;;
  # }

  # dimension: ibe2772 {
  #   type: string
  #   sql: ${TABLE}.IBE2772 ;;
  # }

  # dimension: ibe2773 {
  #   type: string
  #   sql: ${TABLE}.IBE2773 ;;
  # }

  # dimension: ibe2774 {
  #   type: string
  #   sql: ${TABLE}.IBE2774 ;;
  # }

  # dimension: ibe2776 {
  #   type: string
  #   sql: ${TABLE}.IBE2776 ;;
  # }

  # dimension: ibe2778 {
  #   type: string
  #   sql: ${TABLE}.IBE2778 ;;
  # }

  # dimension: ibe2779 {
  #   type: string
  #   sql: ${TABLE}.IBE2779 ;;
  # }

  # dimension: ibe2780 {
  #   type: string
  #   sql: ${TABLE}.IBE2780 ;;
  # }

  # dimension: ibe2781 {
  #   type: string
  #   sql: ${TABLE}.IBE2781 ;;
  # }

  # dimension: ibe2800 {
  #   type: string
  #   sql: ${TABLE}.IBE2800 ;;
  # }

  # dimension: ibe2807 {
  #   type: string
  #   sql: ${TABLE}.IBE2807 ;;
  # }

  # dimension: ibe2810 {
  #   type: string
  #   sql: ${TABLE}.IBE2810 ;;
  # }

  # dimension: ibe2860 {
  #   type: string
  #   sql: ${TABLE}.IBE2860 ;;
  # }

  # dimension: ibe2861 {
  #   type: string
  #   sql: ${TABLE}.IBE2861 ;;
  # }

  # dimension: ibe2862 {
  #   type: string
  #   sql: ${TABLE}.IBE2862 ;;
  # }

  # dimension: ibe2863 {
  #   type: string
  #   sql: ${TABLE}.IBE2863 ;;
  # }

  # dimension: ibe2864 {
  #   type: string
  #   sql: ${TABLE}.IBE2864 ;;
  # }

  # dimension: ibe2865 {
  #   type: string
  #   sql: ${TABLE}.IBE2865 ;;
  # }

  # dimension: ibe2866 {
  #   type: string
  #   sql: ${TABLE}.IBE2866 ;;
  # }

  # dimension: ibe2867 {
  #   type: string
  #   sql: ${TABLE}.IBE2867 ;;
  # }

  # dimension: ibe2868 {
  #   type: string
  #   sql: ${TABLE}.IBE2868 ;;
  # }

  # dimension: ibe2869 {
  #   type: string
  #   sql: ${TABLE}.IBE2869 ;;
  # }

  # dimension: ibe2870 {
  #   type: string
  #   sql: ${TABLE}.IBE2870 ;;
  # }

  # dimension: ibe2871 {
  #   type: string
  #   sql: ${TABLE}.IBE2871 ;;
  # }

  # dimension: ibe2872 {
  #   type: string
  #   sql: ${TABLE}.IBE2872 ;;
  # }

  # dimension: ibe2873 {
  #   type: string
  #   sql: ${TABLE}.IBE2873 ;;
  # }

  # dimension: ibe2874 {
  #   type: string
  #   sql: ${TABLE}.IBE2874 ;;
  # }

  # dimension: ibe2875 {
  #   type: string
  #   sql: ${TABLE}.IBE2875 ;;
  # }

  # dimension: ibe2876 {
  #   type: string
  #   sql: ${TABLE}.IBE2876 ;;
  # }

  # dimension: ibe2877 {
  #   type: string
  #   sql: ${TABLE}.IBE2877 ;;
  # }

  # dimension: ibe2878 {
  #   type: string
  #   sql: ${TABLE}.IBE2878 ;;
  # }

  # dimension: ibe2879 {
  #   type: string
  #   sql: ${TABLE}.IBE2879 ;;
  # }

  # dimension: ibe2880 {
  #   type: string
  #   sql: ${TABLE}.IBE2880 ;;
  # }

  # dimension: ibe2881 {
  #   type: string
  #   sql: ${TABLE}.IBE2881 ;;
  # }

  # dimension: ibe2882 {
  #   type: string
  #   sql: ${TABLE}.IBE2882 ;;
  # }

  # dimension: ibe2883 {
  #   type: string
  #   sql: ${TABLE}.IBE2883 ;;
  # }

  # dimension: ibe2884 {
  #   type: string
  #   sql: ${TABLE}.IBE2884 ;;
  # }

  # dimension: ibe2885 {
  #   type: string
  #   sql: ${TABLE}.IBE2885 ;;
  # }

  # dimension: ibe2886 {
  #   type: string
  #   sql: ${TABLE}.IBE2886 ;;
  # }

  # dimension: ibe2887 {
  #   type: string
  #   sql: ${TABLE}.IBE2887 ;;
  # }

  # dimension: ibe2888 {
  #   type: string
  #   sql: ${TABLE}.IBE2888 ;;
  # }

  # dimension: ibe2889 {
  #   type: string
  #   sql: ${TABLE}.IBE2889 ;;
  # }

  # dimension: ibe2890 {
  #   type: string
  #   sql: ${TABLE}.IBE2890 ;;
  # }

  # dimension: ibe2891 {
  #   type: string
  #   sql: ${TABLE}.IBE2891 ;;
  # }

  # dimension: ibe2892 {
  #   type: string
  #   sql: ${TABLE}.IBE2892 ;;
  # }

  # dimension: ibe2897 {
  #   type: string
  #   sql: ${TABLE}.IBE2897 ;;
  # }

  # dimension: ibe3101 {
  #   type: string
  #   sql: ${TABLE}.IBE3101 ;;
  # }

  # dimension: ibe3102 {
  #   type: string
  #   sql: ${TABLE}.IBE3102 ;;
  # }

  # dimension: ibe3103 {
  #   type: string
  #   sql: ${TABLE}.IBE3103 ;;
  # }

  # dimension: ibe3446 {
  #   type: string
  #   sql: ${TABLE}.IBE3446 ;;
  # }

  # dimension: ibe3447 {
  #   type: string
  #   sql: ${TABLE}.IBE3447 ;;
  # }

  # dimension: ibe3448 {
  #   type: string
  #   sql: ${TABLE}.IBE3448 ;;
  # }

  # dimension: ibe3587 {
  #   type: string
  #   sql: ${TABLE}.IBE3587 ;;
  # }

  # dimension: ibe3588 {
  #   type: string
  #   sql: ${TABLE}.IBE3588 ;;
  # }

  # dimension: ibe3589 {
  #   type: string
  #   sql: ${TABLE}.IBE3589 ;;
  # }

  # dimension: ibe3590 {
  #   type: string
  #   sql: ${TABLE}.IBE3590 ;;
  # }

  # dimension: ibe3591 {
  #   type: string
  #   sql: ${TABLE}.IBE3591 ;;
  # }

  # dimension: ibe3592 {
  #   type: string
  #   sql: ${TABLE}.IBE3592 ;;
  # }

  # dimension: ibe3593 {
  #   type: string
  #   sql: ${TABLE}.IBE3593 ;;
  # }

  # dimension: ibe3594 {
  #   type: string
  #   sql: ${TABLE}.IBE3594 ;;
  # }

  # dimension: ibe3595 {
  #   type: string
  #   sql: ${TABLE}.IBE3595 ;;
  # }

  # dimension: ibe4000 {
  #   type: string
  #   sql: ${TABLE}.IBE4000 ;;
  # }

  # dimension: ibe6102 {
  #   type: string
  #   sql: ${TABLE}.IBE6102 ;;
  # }

  # dimension: ibe6103 {
  #   type: string
  #   sql: ${TABLE}.IBE6103 ;;
  # }

  # dimension: ibe6104 {
  #   type: string
  #   sql: ${TABLE}.IBE6104 ;;
  # }

  # dimension: ibe6105 {
  #   type: string
  #   sql: ${TABLE}.IBE6105 ;;
  # }

  # dimension: ibe6106 {
  #   type: string
  #   sql: ${TABLE}.IBE6106 ;;
  # }

  # dimension: ibe6107 {
  #   type: string
  #   sql: ${TABLE}.IBE6107 ;;
  # }

  # dimension: ibe6108 {
  #   type: string
  #   sql: ${TABLE}.IBE6108 ;;
  # }

  # dimension: ibe6109 {
  #   type: string
  #   sql: ${TABLE}.IBE6109 ;;
  # }

  # dimension: ibe6110 {
  #   type: string
  #   sql: ${TABLE}.IBE6110 ;;
  # }

  # dimension: ibe6111 {
  #   type: string
  #   sql: ${TABLE}.IBE6111 ;;
  # }

  # dimension: ibe6112 {
  #   type: string
  #   sql: ${TABLE}.IBE6112 ;;
  # }

  # dimension: ibe6113 {
  #   type: string
  #   sql: ${TABLE}.IBE6113 ;;
  # }

  # dimension: ibe6114 {
  #   type: string
  #   sql: ${TABLE}.IBE6114 ;;
  # }

  # dimension: ibe6115 {
  #   type: string
  #   sql: ${TABLE}.IBE6115 ;;
  # }

  # dimension: ibe6116 {
  #   type: string
  #   sql: ${TABLE}.IBE6116 ;;
  # }

  # dimension: ibe6117 {
  #   type: string
  #   sql: ${TABLE}.IBE6117 ;;
  # }

  # dimension: ibe6118 {
  #   type: string
  #   sql: ${TABLE}.IBE6118 ;;
  # }

  # dimension: ibe6119 {
  #   type: string
  #   sql: ${TABLE}.IBE6119 ;;
  # }

  # dimension: ibe6121 {
  #   type: string
  #   sql: ${TABLE}.IBE6121 ;;
  # }

  # dimension: ibe6122 {
  #   type: string
  #   sql: ${TABLE}.IBE6122 ;;
  # }

  # dimension: ibe6123 {
  #   type: string
  #   sql: ${TABLE}.IBE6123 ;;
  # }

  # dimension: ibe6124 {
  #   type: string
  #   sql: ${TABLE}.IBE6124 ;;
  # }

  # dimension: ibe6125 {
  #   type: string
  #   sql: ${TABLE}.IBE6125 ;;
  # }

  # dimension: ibe6126 {
  #   type: string
  #   sql: ${TABLE}.IBE6126 ;;
  # }

  # dimension: ibe6127 {
  #   type: string
  #   sql: ${TABLE}.IBE6127 ;;
  # }

  # dimension: ibe6128 {
  #   type: string
  #   sql: ${TABLE}.IBE6128 ;;
  # }

  # dimension: ibe6129 {
  #   type: string
  #   sql: ${TABLE}.IBE6129 ;;
  # }

  # dimension: ibe6130 {
  #   type: string
  #   sql: ${TABLE}.IBE6130 ;;
  # }

  # dimension: ibe6131 {
  #   type: string
  #   sql: ${TABLE}.IBE6131 ;;
  # }

  # dimension: ibe6132 {
  #   type: string
  #   sql: ${TABLE}.IBE6132 ;;
  # }

  # dimension: ibe6134 {
  #   type: string
  #   sql: ${TABLE}.IBE6134 ;;
  # }

  # dimension: ibe6135 {
  #   type: string
  #   sql: ${TABLE}.IBE6135 ;;
  # }

  # dimension: ibe6136 {
  #   type: string
  #   sql: ${TABLE}.IBE6136 ;;
  # }

  # dimension: ibe6137 {
  #   type: string
  #   sql: ${TABLE}.IBE6137 ;;
  # }

  # dimension: ibe6138 {
  #   type: string
  #   sql: ${TABLE}.IBE6138 ;;
  # }

  # dimension: ibe6139 {
  #   type: string
  #   sql: ${TABLE}.IBE6139 ;;
  # }

  # dimension: ibe6140 {
  #   type: string
  #   sql: ${TABLE}.IBE6140 ;;
  # }

  # dimension: ibe6141 {
  #   type: string
  #   sql: ${TABLE}.IBE6141 ;;
  # }

  # dimension: ibe6142 {
  #   type: string
  #   sql: ${TABLE}.IBE6142 ;;
  # }

  # dimension: ibe6143 {
  #   type: string
  #   sql: ${TABLE}.IBE6143 ;;
  # }

  # dimension: ibe6144 {
  #   type: string
  #   sql: ${TABLE}.IBE6144 ;;
  # }

  # dimension: ibe6145 {
  #   type: string
  #   sql: ${TABLE}.IBE6145 ;;
  # }

  # dimension: ibe6146 {
  #   type: string
  #   sql: ${TABLE}.IBE6146 ;;
  # }

  # dimension: ibe6147 {
  #   type: string
  #   sql: ${TABLE}.IBE6147 ;;
  # }

  # dimension: ibe6148 {
  #   type: string
  #   sql: ${TABLE}.IBE6148 ;;
  # }

  # dimension: ibe6149 {
  #   type: string
  #   sql: ${TABLE}.IBE6149 ;;
  # }

  # dimension: ibe6150 {
  #   type: string
  #   sql: ${TABLE}.IBE6150 ;;
  # }

  # dimension: ibe6151 {
  #   type: string
  #   sql: ${TABLE}.IBE6151 ;;
  # }

  # dimension: ibe6152 {
  #   type: string
  #   sql: ${TABLE}.IBE6152 ;;
  # }

  # dimension: ibe6154 {
  #   type: string
  #   sql: ${TABLE}.IBE6154 ;;
  # }

  # dimension: ibe6155 {
  #   type: string
  #   sql: ${TABLE}.IBE6155 ;;
  # }

  # dimension: ibe6156 {
  #   type: string
  #   sql: ${TABLE}.IBE6156 ;;
  # }

  # dimension: ibe6157 {
  #   type: string
  #   sql: ${TABLE}.IBE6157 ;;
  # }

  # dimension: ibe6161 {
  #   type: string
  #   sql: ${TABLE}.IBE6161 ;;
  # }

  # dimension: ibe6162 {
  #   type: string
  #   sql: ${TABLE}.IBE6162 ;;
  # }

  # dimension: ibe6163 {
  #   type: string
  #   sql: ${TABLE}.IBE6163 ;;
  # }

  # dimension: ibe6164 {
  #   type: string
  #   sql: ${TABLE}.IBE6164 ;;
  # }

  # dimension: ibe6165 {
  #   type: string
  #   sql: ${TABLE}.IBE6165 ;;
  # }

  # dimension: ibe6166 {
  #   type: string
  #   sql: ${TABLE}.IBE6166 ;;
  # }

  # dimension: ibe6167 {
  #   type: string
  #   sql: ${TABLE}.IBE6167 ;;
  # }

  # dimension: ibe6168 {
  #   type: string
  #   sql: ${TABLE}.IBE6168 ;;
  # }

  # dimension: ibe6169 {
  #   type: string
  #   sql: ${TABLE}.IBE6169 ;;
  # }

  # dimension: ibe6170 {
  #   type: string
  #   sql: ${TABLE}.IBE6170 ;;
  # }

  # dimension: ibe6171 {
  #   type: string
  #   sql: ${TABLE}.IBE6171 ;;
  # }

  # dimension: ibe6172 {
  #   type: string
  #   sql: ${TABLE}.IBE6172 ;;
  # }

  # dimension: ibe6173 {
  #   type: string
  #   sql: ${TABLE}.IBE6173 ;;
  # }

  # dimension: ibe6174 {
  #   type: string
  #   sql: ${TABLE}.IBE6174 ;;
  # }

  # dimension: ibe6175 {
  #   type: string
  #   sql: ${TABLE}.IBE6175 ;;
  # }

  # dimension: ibe6176 {
  #   type: string
  #   sql: ${TABLE}.IBE6176 ;;
  # }

  # dimension: ibe6177 {
  #   type: string
  #   sql: ${TABLE}.IBE6177 ;;
  # }

  # dimension: ibe6178 {
  #   type: string
  #   sql: ${TABLE}.IBE6178 ;;
  # }

  # dimension: ibe6179 {
  #   type: string
  #   sql: ${TABLE}.IBE6179 ;;
  # }

  # dimension: ibe6180 {
  #   type: string
  #   sql: ${TABLE}.IBE6180 ;;
  # }

  # dimension: ibe6182 {
  #   type: string
  #   sql: ${TABLE}.IBE6182 ;;
  # }

  # dimension: ibe6183 {
  #   type: string
  #   sql: ${TABLE}.IBE6183 ;;
  # }

  # dimension: ibe6184 {
  #   type: string
  #   sql: ${TABLE}.IBE6184 ;;
  # }

  # dimension: ibe6185 {
  #   type: string
  #   sql: ${TABLE}.IBE6185 ;;
  # }

  # dimension: ibe6186 {
  #   type: string
  #   sql: ${TABLE}.IBE6186 ;;
  # }

  # dimension: ibe6187 {
  #   type: string
  #   sql: ${TABLE}.IBE6187 ;;
  # }

  # dimension: ibe6188 {
  #   type: string
  #   sql: ${TABLE}.IBE6188 ;;
  # }

  # dimension: ibe6189 {
  #   type: string
  #   sql: ${TABLE}.IBE6189 ;;
  # }

  # dimension: ibe6190 {
  #   type: string
  #   sql: ${TABLE}.IBE6190 ;;
  # }

  # dimension: ibe6191 {
  #   type: string
  #   sql: ${TABLE}.IBE6191 ;;
  # }

  # dimension: ibe6192 {
  #   type: string
  #   sql: ${TABLE}.IBE6192 ;;
  # }

  # dimension: ibe6193 {
  #   type: string
  #   sql: ${TABLE}.IBE6193 ;;
  # }

  # dimension: ibe6195 {
  #   type: string
  #   sql: ${TABLE}.IBE6195 ;;
  # }

  # dimension: ibe6196 {
  #   type: string
  #   sql: ${TABLE}.IBE6196 ;;
  # }

  # dimension: ibe6197 {
  #   type: string
  #   sql: ${TABLE}.IBE6197 ;;
  # }

  # dimension: ibe6198 {
  #   type: string
  #   sql: ${TABLE}.IBE6198 ;;
  # }

  # dimension: ibe6199 {
  #   type: string
  #   sql: ${TABLE}.IBE6199 ;;
  # }

  # dimension: ibe6200 {
  #   type: string
  #   sql: ${TABLE}.IBE6200 ;;
  # }

  # dimension: ibe6201 {
  #   type: string
  #   sql: ${TABLE}.IBE6201 ;;
  # }

  # dimension: ibe6202 {
  #   type: string
  #   sql: ${TABLE}.IBE6202 ;;
  # }

  # dimension: ibe6203 {
  #   type: string
  #   sql: ${TABLE}.IBE6203 ;;
  # }

  # dimension: ibe6204 {
  #   type: string
  #   sql: ${TABLE}.IBE6204 ;;
  # }

  # dimension: ibe6205 {
  #   type: string
  #   sql: ${TABLE}.IBE6205 ;;
  # }

  # dimension: ibe6206 {
  #   type: string
  #   sql: ${TABLE}.IBE6206 ;;
  # }

  # dimension: ibe6207 {
  #   type: string
  #   sql: ${TABLE}.IBE6207 ;;
  # }

  # dimension: ibe6208 {
  #   type: string
  #   sql: ${TABLE}.IBE6208 ;;
  # }

  # dimension: ibe6209 {
  #   type: string
  #   sql: ${TABLE}.IBE6209 ;;
  # }

  # dimension: ibe6210 {
  #   type: string
  #   sql: ${TABLE}.IBE6210 ;;
  # }

  # dimension: ibe6211 {
  #   type: string
  #   sql: ${TABLE}.IBE6211 ;;
  # }

  # dimension: ibe6212 {
  #   type: string
  #   sql: ${TABLE}.IBE6212 ;;
  # }

  # dimension: ibe6213 {
  #   type: string
  #   sql: ${TABLE}.IBE6213 ;;
  # }

  # dimension: ibe6214 {
  #   type: string
  #   sql: ${TABLE}.IBE6214 ;;
  # }

  # dimension: ibe6215 {
  #   type: string
  #   sql: ${TABLE}.IBE6215 ;;
  # }

  # dimension: ibe6216 {
  #   type: string
  #   sql: ${TABLE}.IBE6216 ;;
  # }

  # dimension: ibe6217 {
  #   type: string
  #   sql: ${TABLE}.IBE6217 ;;
  # }

  # dimension: ibe6220 {
  #   type: string
  #   sql: ${TABLE}.IBE6220 ;;
  # }

  # dimension: ibe6221 {
  #   type: string
  #   sql: ${TABLE}.IBE6221 ;;
  # }

  # dimension: ibe6222 {
  #   type: string
  #   sql: ${TABLE}.IBE6222 ;;
  # }

  # dimension: ibe6223 {
  #   type: string
  #   sql: ${TABLE}.IBE6223 ;;
  # }

  # dimension: ibe6224 {
  #   type: string
  #   sql: ${TABLE}.IBE6224 ;;
  # }

  # dimension: ibe6225 {
  #   type: string
  #   sql: ${TABLE}.IBE6225 ;;
  # }

  # dimension: ibe6226 {
  #   type: string
  #   sql: ${TABLE}.IBE6226 ;;
  # }

  # dimension: ibe6227 {
  #   type: string
  #   sql: ${TABLE}.IBE6227 ;;
  # }

  # dimension: ibe6228 {
  #   type: string
  #   sql: ${TABLE}.IBE6228 ;;
  # }

  # dimension: ibe6229 {
  #   type: string
  #   sql: ${TABLE}.IBE6229 ;;
  # }

  # dimension: ibe6230 {
  #   type: string
  #   sql: ${TABLE}.IBE6230 ;;
  # }

  # dimension: ibe6231 {
  #   type: string
  #   sql: ${TABLE}.IBE6231 ;;
  # }

  # dimension: ibe6232 {
  #   type: string
  #   sql: ${TABLE}.IBE6232 ;;
  # }

  # dimension: ibe6233 {
  #   type: string
  #   sql: ${TABLE}.IBE6233 ;;
  # }

  # dimension: ibe6234 {
  #   type: string
  #   sql: ${TABLE}.IBE6234 ;;
  # }

  # dimension: ibe6235 {
  #   type: string
  #   sql: ${TABLE}.IBE6235 ;;
  # }

  # dimension: ibe6236 {
  #   type: string
  #   sql: ${TABLE}.IBE6236 ;;
  # }

  # dimension: ibe6237 {
  #   type: string
  #   sql: ${TABLE}.IBE6237 ;;
  # }

  # dimension: ibe6239 {
  #   type: string
  #   sql: ${TABLE}.IBE6239 ;;
  # }

  # dimension: ibe6240 {
  #   type: string
  #   sql: ${TABLE}.IBE6240 ;;
  # }

  # dimension: ibe6241 {
  #   type: string
  #   sql: ${TABLE}.IBE6241 ;;
  # }

  # dimension: ibe6242 {
  #   type: string
  #   sql: ${TABLE}.IBE6242 ;;
  # }

  # dimension: ibe6243 {
  #   type: string
  #   sql: ${TABLE}.IBE6243 ;;
  # }

  # dimension: ibe6244 {
  #   type: string
  #   sql: ${TABLE}.IBE6244 ;;
  # }

  # dimension: ibe6245 {
  #   type: string
  #   sql: ${TABLE}.IBE6245 ;;
  # }

  # dimension: ibe6246 {
  #   type: string
  #   sql: ${TABLE}.IBE6246 ;;
  # }

  # dimension: ibe6247 {
  #   type: string
  #   sql: ${TABLE}.IBE6247 ;;
  # }

  # dimension: ibe6248 {
  #   type: string
  #   sql: ${TABLE}.IBE6248 ;;
  # }

  # dimension: ibe6249 {
  #   type: string
  #   sql: ${TABLE}.IBE6249 ;;
  # }

  # dimension: ibe6250 {
  #   type: string
  #   sql: ${TABLE}.IBE6250 ;;
  # }

  # dimension: ibe6251 {
  #   type: string
  #   sql: ${TABLE}.IBE6251 ;;
  # }

  # dimension: ibe6252 {
  #   type: string
  #   sql: ${TABLE}.IBE6252 ;;
  # }

  # dimension: ibe6253 {
  #   type: string
  #   sql: ${TABLE}.IBE6253 ;;
  # }

  # dimension: ibe6254 {
  #   type: string
  #   sql: ${TABLE}.IBE6254 ;;
  # }

  # dimension: ibe6255 {
  #   type: string
  #   sql: ${TABLE}.IBE6255 ;;
  # }

  # dimension: ibe6256 {
  #   type: string
  #   sql: ${TABLE}.IBE6256 ;;
  # }

  # dimension: ibe6257 {
  #   type: string
  #   sql: ${TABLE}.IBE6257 ;;
  # }

  # dimension: ibe6258 {
  #   type: string
  #   sql: ${TABLE}.IBE6258 ;;
  # }

  # dimension: ibe6259 {
  #   type: string
  #   sql: ${TABLE}.IBE6259 ;;
  # }

  # dimension: ibe6260 {
  #   type: string
  #   sql: ${TABLE}.IBE6260 ;;
  # }

  # dimension: ibe6261 {
  #   type: string
  #   sql: ${TABLE}.IBE6261 ;;
  # }

  # dimension: ibe6262 {
  #   type: string
  #   sql: ${TABLE}.IBE6262 ;;
  # }

  # dimension: ibe6263 {
  #   type: string
  #   sql: ${TABLE}.IBE6263 ;;
  # }

  # dimension: ibe6265 {
  #   type: string
  #   sql: ${TABLE}.IBE6265 ;;
  # }

  # dimension: ibe6266 {
  #   type: string
  #   sql: ${TABLE}.IBE6266 ;;
  # }

  # dimension: ibe6267 {
  #   type: string
  #   sql: ${TABLE}.IBE6267 ;;
  # }

  # dimension: ibe6268 {
  #   type: string
  #   sql: ${TABLE}.IBE6268 ;;
  # }

  # dimension: ibe6269 {
  #   type: string
  #   sql: ${TABLE}.IBE6269 ;;
  # }

  # dimension: ibe6270 {
  #   type: string
  #   sql: ${TABLE}.IBE6270 ;;
  # }

  # dimension: ibe6271 {
  #   type: string
  #   sql: ${TABLE}.IBE6271 ;;
  # }

  # dimension: ibe6272 {
  #   type: string
  #   sql: ${TABLE}.IBE6272 ;;
  # }

  # dimension: ibe6273 {
  #   type: string
  #   sql: ${TABLE}.IBE6273 ;;
  # }

  # dimension: ibe6274 {
  #   type: string
  #   sql: ${TABLE}.IBE6274 ;;
  # }

  # dimension: ibe6275 {
  #   type: string
  #   sql: ${TABLE}.IBE6275 ;;
  # }

  # dimension: ibe6276 {
  #   type: string
  #   sql: ${TABLE}.IBE6276 ;;
  # }

  # dimension: ibe6277 {
  #   type: string
  #   sql: ${TABLE}.IBE6277 ;;
  # }

  # dimension: ibe6278 {
  #   type: string
  #   sql: ${TABLE}.IBE6278 ;;
  # }

  # dimension: ibe6279 {
  #   type: string
  #   sql: ${TABLE}.IBE6279 ;;
  # }

  # dimension: ibe6280 {
  #   type: string
  #   sql: ${TABLE}.IBE6280 ;;
  # }

  # dimension: ibe6281 {
  #   type: string
  #   sql: ${TABLE}.IBE6281 ;;
  # }

  # dimension: ibe6282 {
  #   type: string
  #   sql: ${TABLE}.IBE6282 ;;
  # }

  # dimension: ibe6283 {
  #   type: string
  #   sql: ${TABLE}.IBE6283 ;;
  # }

  # dimension: ibe6285 {
  #   type: string
  #   sql: ${TABLE}.IBE6285 ;;
  # }

  # dimension: ibe6286 {
  #   type: string
  #   sql: ${TABLE}.IBE6286 ;;
  # }

  # dimension: ibe6289 {
  #   type: string
  #   sql: ${TABLE}.IBE6289 ;;
  # }

  # dimension: ibe6291 {
  #   type: string
  #   sql: ${TABLE}.IBE6291 ;;
  # }

  # dimension: ibe6292 {
  #   type: string
  #   sql: ${TABLE}.IBE6292 ;;
  # }

  # dimension: ibe6293 {
  #   type: string
  #   sql: ${TABLE}.IBE6293 ;;
  # }

  # dimension: ibe6294 {
  #   type: string
  #   sql: ${TABLE}.IBE6294 ;;
  # }

  # dimension: ibe6295 {
  #   type: string
  #   sql: ${TABLE}.IBE6295 ;;
  # }

  # dimension: ibe6296 {
  #   type: string
  #   sql: ${TABLE}.IBE6296 ;;
  # }

  # dimension: ibe6297 {
  #   type: string
  #   sql: ${TABLE}.IBE6297 ;;
  # }

  # dimension: ibe6298 {
  #   type: string
  #   sql: ${TABLE}.IBE6298 ;;
  # }

  # dimension: ibe6300 {
  #   type: string
  #   sql: ${TABLE}.IBE6300 ;;
  # }

  # dimension: ibe6301 {
  #   type: string
  #   sql: ${TABLE}.IBE6301 ;;
  # }

  # dimension: ibe6302 {
  #   type: string
  #   sql: ${TABLE}.IBE6302 ;;
  # }

  # dimension: ibe6303 {
  #   type: string
  #   sql: ${TABLE}.IBE6303 ;;
  # }

  # dimension: ibe6305 {
  #   type: string
  #   sql: ${TABLE}.IBE6305 ;;
  # }

  # dimension: ibe6308 {
  #   type: string
  #   sql: ${TABLE}.IBE6308 ;;
  # }

  # dimension: ibe6309 {
  #   type: string
  #   sql: ${TABLE}.IBE6309 ;;
  # }

  # dimension: ibe6311 {
  #   type: string
  #   sql: ${TABLE}.IBE6311 ;;
  # }

  # dimension: ibe6312 {
  #   type: string
  #   sql: ${TABLE}.IBE6312 ;;
  # }

  # dimension: ibe6313 {
  #   type: string
  #   sql: ${TABLE}.IBE6313 ;;
  # }

  # dimension: ibe6314 {
  #   type: string
  #   sql: ${TABLE}.IBE6314 ;;
  # }

  # dimension: ibe6315 {
  #   type: string
  #   sql: ${TABLE}.IBE6315 ;;
  # }

  # dimension: ibe6316 {
  #   type: string
  #   sql: ${TABLE}.IBE6316 ;;
  # }

  # dimension: ibe6317 {
  #   type: string
  #   sql: ${TABLE}.IBE6317 ;;
  # }

  # dimension: ibe6318 {
  #   type: string
  #   sql: ${TABLE}.IBE6318 ;;
  # }

  # dimension: ibe6319 {
  #   type: string
  #   sql: ${TABLE}.IBE6319 ;;
  # }

  # dimension: ibe6320 {
  #   type: string
  #   sql: ${TABLE}.IBE6320 ;;
  # }

  # dimension: ibe6322 {
  #   type: string
  #   sql: ${TABLE}.IBE6322 ;;
  # }

  # dimension: ibe6323 {
  #   type: string
  #   sql: ${TABLE}.IBE6323 ;;
  # }

  # dimension: ibe6324 {
  #   type: string
  #   sql: ${TABLE}.IBE6324 ;;
  # }

  # dimension: ibe6325 {
  #   type: string
  #   sql: ${TABLE}.IBE6325 ;;
  # }

  # dimension: ibe6326 {
  #   type: string
  #   sql: ${TABLE}.IBE6326 ;;
  # }

  # dimension: ibe6328 {
  #   type: string
  #   sql: ${TABLE}.IBE6328 ;;
  # }

  # dimension: ibe6329 {
  #   type: string
  #   sql: ${TABLE}.IBE6329 ;;
  # }

  # dimension: ibe6330 {
  #   type: string
  #   sql: ${TABLE}.IBE6330 ;;
  # }

  # dimension: ibe6331 {
  #   type: string
  #   sql: ${TABLE}.IBE6331 ;;
  # }

  # dimension: ibe6332 {
  #   type: string
  #   sql: ${TABLE}.IBE6332 ;;
  # }

  # dimension: ibe6333 {
  #   type: string
  #   sql: ${TABLE}.IBE6333 ;;
  # }

  # dimension: ibe6334 {
  #   type: string
  #   sql: ${TABLE}.IBE6334 ;;
  # }

  # dimension: ibe6335 {
  #   type: string
  #   sql: ${TABLE}.IBE6335 ;;
  # }

  # dimension: ibe6336 {
  #   type: string
  #   sql: ${TABLE}.IBE6336 ;;
  # }

  # dimension: ibe6337 {
  #   type: string
  #   sql: ${TABLE}.IBE6337 ;;
  # }

  # dimension: ibe6338 {
  #   type: string
  #   sql: ${TABLE}.IBE6338 ;;
  # }

  # dimension: ibe6339 {
  #   type: string
  #   sql: ${TABLE}.IBE6339 ;;
  # }

  # dimension: ibe6341 {
  #   type: string
  #   sql: ${TABLE}.IBE6341 ;;
  # }

  # dimension: ibe6342 {
  #   type: string
  #   sql: ${TABLE}.IBE6342 ;;
  # }

  # dimension: ibe6343 {
  #   type: string
  #   sql: ${TABLE}.IBE6343 ;;
  # }

  # dimension: ibe6344 {
  #   type: string
  #   sql: ${TABLE}.IBE6344 ;;
  # }

  # dimension: ibe6345 {
  #   type: string
  #   sql: ${TABLE}.IBE6345 ;;
  # }

  # dimension: ibe6346 {
  #   type: string
  #   sql: ${TABLE}.IBE6346 ;;
  # }

  # dimension: ibe6347 {
  #   type: string
  #   sql: ${TABLE}.IBE6347 ;;
  # }

  # dimension: ibe6348 {
  #   type: string
  #   sql: ${TABLE}.IBE6348 ;;
  # }

  # dimension: ibe6349 {
  #   type: string
  #   sql: ${TABLE}.IBE6349 ;;
  # }

  # dimension: ibe6350 {
  #   type: string
  #   sql: ${TABLE}.IBE6350 ;;
  # }

  # dimension: ibe6351 {
  #   type: string
  #   sql: ${TABLE}.IBE6351 ;;
  # }

  # dimension: ibe6354 {
  #   type: string
  #   sql: ${TABLE}.IBE6354 ;;
  # }

  # dimension: ibe6355 {
  #   type: string
  #   sql: ${TABLE}.IBE6355 ;;
  # }

  # dimension: ibe6356 {
  #   type: string
  #   sql: ${TABLE}.IBE6356 ;;
  # }

  # dimension: ibe6357 {
  #   type: string
  #   sql: ${TABLE}.IBE6357 ;;
  # }

  # dimension: ibe6358 {
  #   type: string
  #   sql: ${TABLE}.IBE6358 ;;
  # }

  # dimension: ibe6359 {
  #   type: string
  #   sql: ${TABLE}.IBE6359 ;;
  # }

  # dimension: ibe6360 {
  #   type: string
  #   sql: ${TABLE}.IBE6360 ;;
  # }

  # dimension: ibe6361 {
  #   type: string
  #   sql: ${TABLE}.IBE6361 ;;
  # }

  # dimension: ibe6362 {
  #   type: string
  #   sql: ${TABLE}.IBE6362 ;;
  # }

  # dimension: ibe6365 {
  #   type: string
  #   sql: ${TABLE}.IBE6365 ;;
  # }

  # dimension: ibe6366 {
  #   type: string
  #   sql: ${TABLE}.IBE6366 ;;
  # }

  # dimension: ibe6367 {
  #   type: string
  #   sql: ${TABLE}.IBE6367 ;;
  # }

  # dimension: ibe6368 {
  #   type: string
  #   sql: ${TABLE}.IBE6368 ;;
  # }

  # dimension: ibe6369 {
  #   type: string
  #   sql: ${TABLE}.IBE6369 ;;
  # }

  # dimension: ibe6370 {
  #   type: string
  #   sql: ${TABLE}.IBE6370 ;;
  # }

  # dimension: ibe6371 {
  #   type: string
  #   sql: ${TABLE}.IBE6371 ;;
  # }

  # dimension: ibe6372 {
  #   type: string
  #   sql: ${TABLE}.IBE6372 ;;
  # }

  # dimension: ibe6373 {
  #   type: string
  #   sql: ${TABLE}.IBE6373 ;;
  # }

  # dimension: ibe6374 {
  #   type: string
  #   sql: ${TABLE}.IBE6374 ;;
  # }

  # dimension: ibe6375 {
  #   type: string
  #   sql: ${TABLE}.IBE6375 ;;
  # }

  # dimension: ibe6376 {
  #   type: string
  #   sql: ${TABLE}.IBE6376 ;;
  # }

  # dimension: ibe6377 {
  #   type: string
  #   sql: ${TABLE}.IBE6377 ;;
  # }

  # dimension: ibe6378 {
  #   type: string
  #   sql: ${TABLE}.IBE6378 ;;
  # }

  # dimension: ibe6379 {
  #   type: string
  #   sql: ${TABLE}.IBE6379 ;;
  # }

  # dimension: ibe6380 {
  #   type: string
  #   sql: ${TABLE}.IBE6380 ;;
  # }

  # dimension: ibe6381 {
  #   type: string
  #   sql: ${TABLE}.IBE6381 ;;
  # }

  # dimension: ibe6382 {
  #   type: string
  #   sql: ${TABLE}.IBE6382 ;;
  # }

  # dimension: ibe6383 {
  #   type: string
  #   sql: ${TABLE}.IBE6383 ;;
  # }

  # dimension: ibe6384 {
  #   type: string
  #   sql: ${TABLE}.IBE6384 ;;
  # }

  # dimension: ibe6385 {
  #   type: string
  #   sql: ${TABLE}.IBE6385 ;;
  # }

  # dimension: ibe6386 {
  #   type: string
  #   sql: ${TABLE}.IBE6386 ;;
  # }

  # dimension: ibe6387 {
  #   type: string
  #   sql: ${TABLE}.IBE6387 ;;
  # }

  # dimension: ibe6388 {
  #   type: string
  #   sql: ${TABLE}.IBE6388 ;;
  # }

  # dimension: ibe6389 {
  #   type: string
  #   sql: ${TABLE}.IBE6389 ;;
  # }

  # dimension: ibe6390 {
  #   type: string
  #   sql: ${TABLE}.IBE6390 ;;
  # }

  # dimension: ibe6391 {
  #   type: string
  #   sql: ${TABLE}.IBE6391 ;;
  # }

  # dimension: ibe6392 {
  #   type: string
  #   sql: ${TABLE}.IBE6392 ;;
  # }

  # dimension: ibe6393 {
  #   type: string
  #   sql: ${TABLE}.IBE6393 ;;
  # }

  # dimension: ibe6394 {
  #   type: string
  #   sql: ${TABLE}.IBE6394 ;;
  # }

  # dimension: ibe6395 {
  #   type: string
  #   sql: ${TABLE}.IBE6395 ;;
  # }

  # dimension: ibe6396 {
  #   type: string
  #   sql: ${TABLE}.IBE6396 ;;
  # }

  # dimension: ibe6397 {
  #   type: string
  #   sql: ${TABLE}.IBE6397 ;;
  # }

  # dimension: ibe6398 {
  #   type: string
  #   sql: ${TABLE}.IBE6398 ;;
  # }

  # dimension: ibe6400 {
  #   type: string
  #   sql: ${TABLE}.IBE6400 ;;
  # }

  # dimension: ibe6401 {
  #   type: string
  #   sql: ${TABLE}.IBE6401 ;;
  # }

  # dimension: ibe6402 {
  #   type: string
  #   sql: ${TABLE}.IBE6402 ;;
  # }

  # dimension: ibe6403 {
  #   type: string
  #   sql: ${TABLE}.IBE6403 ;;
  # }

  # dimension: ibe6404 {
  #   type: string
  #   sql: ${TABLE}.IBE6404 ;;
  # }

  # dimension: ibe6405 {
  #   type: string
  #   sql: ${TABLE}.IBE6405 ;;
  # }

  # dimension: ibe6406 {
  #   type: string
  #   sql: ${TABLE}.IBE6406 ;;
  # }

  # dimension: ibe6407 {
  #   type: string
  #   sql: ${TABLE}.IBE6407 ;;
  # }

  # dimension: ibe6408 {
  #   type: string
  #   sql: ${TABLE}.IBE6408 ;;
  # }

  # dimension: ibe6409 {
  #   type: string
  #   sql: ${TABLE}.IBE6409 ;;
  # }

  # dimension: ibe6410 {
  #   type: string
  #   sql: ${TABLE}.IBE6410 ;;
  # }

  # dimension: ibe6411 {
  #   type: string
  #   sql: ${TABLE}.IBE6411 ;;
  # }

  # dimension: ibe6412 {
  #   type: string
  #   sql: ${TABLE}.IBE6412 ;;
  # }

  # dimension: ibe6413 {
  #   type: string
  #   sql: ${TABLE}.IBE6413 ;;
  # }

  # dimension: ibe6414 {
  #   type: string
  #   sql: ${TABLE}.IBE6414 ;;
  # }

  # dimension: ibe6415 {
  #   type: string
  #   sql: ${TABLE}.IBE6415 ;;
  # }

  # dimension: ibe6416 {
  #   type: string
  #   sql: ${TABLE}.IBE6416 ;;
  # }

  # dimension: ibe6417 {
  #   type: string
  #   sql: ${TABLE}.IBE6417 ;;
  # }

  # dimension: ibe6418 {
  #   type: string
  #   sql: ${TABLE}.IBE6418 ;;
  # }

  # dimension: ibe6421 {
  #   type: string
  #   sql: ${TABLE}.IBE6421 ;;
  # }

  # dimension: ibe6422 {
  #   type: string
  #   sql: ${TABLE}.IBE6422 ;;
  # }

  # dimension: ibe6423 {
  #   type: string
  #   sql: ${TABLE}.IBE6423 ;;
  # }

  # dimension: ibe6424 {
  #   type: string
  #   sql: ${TABLE}.IBE6424 ;;
  # }

  # dimension: ibe6425 {
  #   type: string
  #   sql: ${TABLE}.IBE6425 ;;
  # }

  # dimension: ibe6426 {
  #   type: string
  #   sql: ${TABLE}.IBE6426 ;;
  # }

  # dimension: ibe6427 {
  #   type: string
  #   sql: ${TABLE}.IBE6427 ;;
  # }

  # dimension: ibe6428 {
  #   type: string
  #   sql: ${TABLE}.IBE6428 ;;
  # }

  # dimension: ibe6430 {
  #   type: string
  #   sql: ${TABLE}.IBE6430 ;;
  # }

  # dimension: ibe6431 {
  #   type: string
  #   sql: ${TABLE}.IBE6431 ;;
  # }

  # dimension: ibe6432 {
  #   type: string
  #   sql: ${TABLE}.IBE6432 ;;
  # }

  # dimension: ibe6434 {
  #   type: string
  #   sql: ${TABLE}.IBE6434 ;;
  # }

  # dimension: ibe6436 {
  #   type: string
  #   sql: ${TABLE}.IBE6436 ;;
  # }

  # dimension: ibe6437 {
  #   type: string
  #   sql: ${TABLE}.IBE6437 ;;
  # }

  # dimension: ibe6438 {
  #   type: string
  #   sql: ${TABLE}.IBE6438 ;;
  # }

  # dimension: ibe6448 {
  #   type: string
  #   sql: ${TABLE}.IBE6448 ;;
  # }

  # dimension: ibe6449 {
  #   type: string
  #   sql: ${TABLE}.IBE6449 ;;
  # }

  # dimension: ibe6450 {
  #   type: string
  #   sql: ${TABLE}.IBE6450 ;;
  # }

  # dimension: ibe6452 {
  #   type: string
  #   sql: ${TABLE}.IBE6452 ;;
  # }

  # dimension: ibe6453 {
  #   type: string
  #   sql: ${TABLE}.IBE6453 ;;
  # }

  # dimension: ibe6454 {
  #   type: string
  #   sql: ${TABLE}.IBE6454 ;;
  # }

  # dimension: ibe6455 {
  #   type: string
  #   sql: ${TABLE}.IBE6455 ;;
  # }

  # dimension: ibe6456 {
  #   type: string
  #   sql: ${TABLE}.IBE6456 ;;
  # }

  # dimension: ibe6457 {
  #   type: string
  #   sql: ${TABLE}.IBE6457 ;;
  # }

  # dimension: ibe6458 {
  #   type: string
  #   sql: ${TABLE}.IBE6458 ;;
  # }

  # dimension: ibe6459 {
  #   type: string
  #   sql: ${TABLE}.IBE6459 ;;
  # }

  # dimension: ibe6460 {
  #   type: string
  #   sql: ${TABLE}.IBE6460 ;;
  # }

  # dimension: ibe6483 {
  #   type: string
  #   sql: ${TABLE}.IBE6483 ;;
  # }

  # dimension: ibe6484 {
  #   type: string
  #   sql: ${TABLE}.IBE6484 ;;
  # }

  # dimension: ibe6485 {
  #   type: string
  #   sql: ${TABLE}.IBE6485 ;;
  # }

  # dimension: ibe6487 {
  #   type: string
  #   sql: ${TABLE}.IBE6487 ;;
  # }

  # dimension: ibe6488 {
  #   type: string
  #   sql: ${TABLE}.IBE6488 ;;
  # }

  # dimension: ibe6489 {
  #   type: string
  #   sql: ${TABLE}.IBE6489 ;;
  # }

  # dimension: ibe6490 {
  #   type: string
  #   sql: ${TABLE}.IBE6490 ;;
  # }

  # dimension: ibe6491 {
  #   type: string
  #   sql: ${TABLE}.IBE6491 ;;
  # }

  # dimension: ibe6492 {
  #   type: string
  #   sql: ${TABLE}.IBE6492 ;;
  # }

  # dimension: ibe6493 {
  #   type: string
  #   sql: ${TABLE}.IBE6493 ;;
  # }

  # dimension: ibe6494 {
  #   type: string
  #   sql: ${TABLE}.IBE6494 ;;
  # }

  # dimension: ibe6495 {
  #   type: string
  #   sql: ${TABLE}.IBE6495 ;;
  # }

  # dimension: ibe6496 {
  #   type: string
  #   sql: ${TABLE}.IBE6496 ;;
  # }

  # dimension: ibe6497 {
  #   type: string
  #   sql: ${TABLE}.IBE6497 ;;
  # }

  # dimension: ibe6498 {
  #   type: string
  #   sql: ${TABLE}.IBE6498 ;;
  # }

  # dimension: ibe6499 {
  #   type: string
  #   sql: ${TABLE}.IBE6499 ;;
  # }

  # dimension: ibe6500 {
  #   type: string
  #   sql: ${TABLE}.IBE6500 ;;
  # }

  # dimension: ibe6501 {
  #   type: string
  #   sql: ${TABLE}.IBE6501 ;;
  # }

  # dimension: ibe6502 {
  #   type: string
  #   sql: ${TABLE}.IBE6502 ;;
  # }

  # dimension: ibe6503 {
  #   type: string
  #   sql: ${TABLE}.IBE6503 ;;
  # }

  # dimension: ibe6504 {
  #   type: string
  #   sql: ${TABLE}.IBE6504 ;;
  # }

  # dimension: ibe6505 {
  #   type: string
  #   sql: ${TABLE}.IBE6505 ;;
  # }

  # dimension: ibe6506 {
  #   type: string
  #   sql: ${TABLE}.IBE6506 ;;
  # }

  # dimension: ibe6507 {
  #   type: string
  #   sql: ${TABLE}.IBE6507 ;;
  # }

  # dimension: ibe6508 {
  #   type: string
  #   sql: ${TABLE}.IBE6508 ;;
  # }

  # dimension: ibe6509 {
  #   type: string
  #   sql: ${TABLE}.IBE6509 ;;
  # }

  # dimension: ibe6510 {
  #   type: string
  #   sql: ${TABLE}.IBE6510 ;;
  # }

  # dimension: ibe6511 {
  #   type: string
  #   sql: ${TABLE}.IBE6511 ;;
  # }

  # dimension: ibe6512 {
  #   type: string
  #   sql: ${TABLE}.IBE6512 ;;
  # }

  # dimension: ibe6513 {
  #   type: string
  #   sql: ${TABLE}.IBE6513 ;;
  # }

  # dimension: ibe6514 {
  #   type: string
  #   sql: ${TABLE}.IBE6514 ;;
  # }

  # dimension: ibe6515 {
  #   type: string
  #   sql: ${TABLE}.IBE6515 ;;
  # }

  # dimension: ibe6516 {
  #   type: string
  #   sql: ${TABLE}.IBE6516 ;;
  # }

  # dimension: ibe6517 {
  #   type: string
  #   sql: ${TABLE}.IBE6517 ;;
  # }

  # dimension: ibe6518 {
  #   type: string
  #   sql: ${TABLE}.IBE6518 ;;
  # }

  # dimension: ibe6522 {
  #   type: string
  #   sql: ${TABLE}.IBE6522 ;;
  # }

  # dimension: ibe6523 {
  #   type: string
  #   sql: ${TABLE}.IBE6523 ;;
  # }

  # dimension: ibe6524 {
  #   type: string
  #   sql: ${TABLE}.IBE6524 ;;
  # }

  # dimension: ibe6525 {
  #   type: string
  #   sql: ${TABLE}.IBE6525 ;;
  # }

  # dimension: ibe6526 {
  #   type: string
  #   sql: ${TABLE}.IBE6526 ;;
  # }

  # dimension: ibe6527 {
  #   type: string
  #   sql: ${TABLE}.IBE6527 ;;
  # }

  # dimension: ibe6529 {
  #   type: string
  #   sql: ${TABLE}.IBE6529 ;;
  # }

  # dimension: ibe6530 {
  #   type: string
  #   sql: ${TABLE}.IBE6530 ;;
  # }

  # dimension: ibe6531 {
  #   type: string
  #   sql: ${TABLE}.IBE6531 ;;
  # }

  # dimension: ibe6532 {
  #   type: string
  #   sql: ${TABLE}.IBE6532 ;;
  # }

  # dimension: ibe6533 {
  #   type: string
  #   sql: ${TABLE}.IBE6533 ;;
  # }

  # dimension: ibe6535 {
  #   type: string
  #   sql: ${TABLE}.IBE6535 ;;
  # }

  # dimension: ibe6537 {
  #   type: string
  #   sql: ${TABLE}.IBE6537 ;;
  # }

  # dimension: ibe6538 {
  #   type: string
  #   sql: ${TABLE}.IBE6538 ;;
  # }

  # dimension: ibe6539 {
  #   type: string
  #   sql: ${TABLE}.IBE6539 ;;
  # }

  # dimension: ibe6540 {
  #   type: string
  #   sql: ${TABLE}.IBE6540 ;;
  # }

  # dimension: ibe6541 {
  #   type: string
  #   sql: ${TABLE}.IBE6541 ;;
  # }

  # dimension: ibe6543 {
  #   type: string
  #   sql: ${TABLE}.IBE6543 ;;
  # }

  # dimension: ibe6544 {
  #   type: string
  #   sql: ${TABLE}.IBE6544 ;;
  # }

  # dimension: ibe6545 {
  #   type: string
  #   sql: ${TABLE}.IBE6545 ;;
  # }

  # dimension: ibe6546 {
  #   type: string
  #   sql: ${TABLE}.IBE6546 ;;
  # }

  # dimension: ibe6547 {
  #   type: string
  #   sql: ${TABLE}.IBE6547 ;;
  # }

  # dimension: ibe6548 {
  #   type: string
  #   sql: ${TABLE}.IBE6548 ;;
  # }

  # dimension: ibe6549 {
  #   type: string
  #   sql: ${TABLE}.IBE6549 ;;
  # }

  # dimension: ibe6550 {
  #   type: string
  #   sql: ${TABLE}.IBE6550 ;;
  # }

  # dimension: ibe6551 {
  #   type: string
  #   sql: ${TABLE}.IBE6551 ;;
  # }

  # dimension: ibe6552 {
  #   type: string
  #   sql: ${TABLE}.IBE6552 ;;
  # }

  # dimension: ibe6553 {
  #   type: string
  #   sql: ${TABLE}.IBE6553 ;;
  # }

  # dimension: ibe6554 {
  #   type: string
  #   sql: ${TABLE}.IBE6554 ;;
  # }

  # dimension: ibe6555 {
  #   type: string
  #   sql: ${TABLE}.IBE6555 ;;
  # }

  # dimension: ibe6556 {
  #   type: string
  #   sql: ${TABLE}.IBE6556 ;;
  # }

  # dimension: ibe6558 {
  #   type: string
  #   sql: ${TABLE}.IBE6558 ;;
  # }

  # dimension: ibe6559 {
  #   type: string
  #   sql: ${TABLE}.IBE6559 ;;
  # }

  # dimension: ibe6560 {
  #   type: string
  #   sql: ${TABLE}.IBE6560 ;;
  # }

  # dimension: ibe6565 {
  #   type: string
  #   sql: ${TABLE}.IBE6565 ;;
  # }

  # dimension: ibe6566 {
  #   type: string
  #   sql: ${TABLE}.IBE6566 ;;
  # }

  # dimension: ibe6568 {
  #   type: string
  #   sql: ${TABLE}.IBE6568 ;;
  # }

  # dimension: ibe6569 {
  #   type: string
  #   sql: ${TABLE}.IBE6569 ;;
  # }

  # dimension: ibe6570 {
  #   type: string
  #   sql: ${TABLE}.IBE6570 ;;
  # }

  # dimension: ibe6571 {
  #   type: string
  #   sql: ${TABLE}.IBE6571 ;;
  # }

  # dimension: ibe6572 {
  #   type: string
  #   sql: ${TABLE}.IBE6572 ;;
  # }

  # dimension: ibe6573 {
  #   type: string
  #   sql: ${TABLE}.IBE6573 ;;
  # }

  # dimension: ibe6574 {
  #   type: string
  #   sql: ${TABLE}.IBE6574 ;;
  # }

  # dimension: ibe6575 {
  #   type: string
  #   sql: ${TABLE}.IBE6575 ;;
  # }

  # dimension: ibe6576 {
  #   type: string
  #   sql: ${TABLE}.IBE6576 ;;
  # }

  # dimension: ibe6577 {
  #   type: string
  #   sql: ${TABLE}.IBE6577 ;;
  # }

  # dimension: ibe6578 {
  #   type: string
  #   sql: ${TABLE}.IBE6578 ;;
  # }

  # dimension: ibe6579 {
  #   type: string
  #   sql: ${TABLE}.IBE6579 ;;
  # }

  # dimension: ibe6580 {
  #   type: string
  #   sql: ${TABLE}.IBE6580 ;;
  # }

  # dimension: ibe6581 {
  #   type: string
  #   sql: ${TABLE}.IBE6581 ;;
  # }

  # dimension: ibe6582 {
  #   type: string
  #   sql: ${TABLE}.IBE6582 ;;
  # }

  # dimension: ibe6583 {
  #   type: string
  #   sql: ${TABLE}.IBE6583 ;;
  # }

  # dimension: ibe6584 {
  #   type: string
  #   sql: ${TABLE}.IBE6584 ;;
  # }

  # dimension: ibe6585 {
  #   type: string
  #   sql: ${TABLE}.IBE6585 ;;
  # }

  # dimension: ibe6586 {
  #   type: string
  #   sql: ${TABLE}.IBE6586 ;;
  # }

  # dimension: ibe6588 {
  #   type: string
  #   sql: ${TABLE}.IBE6588 ;;
  # }

  # dimension: ibe6589 {
  #   type: string
  #   sql: ${TABLE}.IBE6589 ;;
  # }

  # dimension: ibe6590 {
  #   type: string
  #   sql: ${TABLE}.IBE6590 ;;
  # }

  # dimension: ibe6591 {
  #   type: string
  #   sql: ${TABLE}.IBE6591 ;;
  # }

  # dimension: ibe6592 {
  #   type: string
  #   sql: ${TABLE}.IBE6592 ;;
  # }

  # dimension: ibe6593 {
  #   type: string
  #   sql: ${TABLE}.IBE6593 ;;
  # }

  # dimension: ibe6594 {
  #   type: string
  #   sql: ${TABLE}.IBE6594 ;;
  # }

  # dimension: ibe6595 {
  #   type: string
  #   sql: ${TABLE}.IBE6595 ;;
  # }

  # dimension: ibe6596 {
  #   type: string
  #   sql: ${TABLE}.IBE6596 ;;
  # }

  # dimension: ibe6597 {
  #   type: string
  #   sql: ${TABLE}.IBE6597 ;;
  # }

  # dimension: ibe6598 {
  #   type: string
  #   sql: ${TABLE}.IBE6598 ;;
  # }

  # dimension: ibe6599 {
  #   type: string
  #   sql: ${TABLE}.IBE6599 ;;
  # }

  # dimension: ibe6600 {
  #   type: string
  #   sql: ${TABLE}.IBE6600 ;;
  # }

  # dimension: ibe6603 {
  #   type: string
  #   sql: ${TABLE}.IBE6603 ;;
  # }

  # dimension: ibe6604 {
  #   type: string
  #   sql: ${TABLE}.IBE6604 ;;
  # }

  # dimension: ibe6605 {
  #   type: string
  #   sql: ${TABLE}.IBE6605 ;;
  # }

  # dimension: ibe6606 {
  #   type: string
  #   sql: ${TABLE}.IBE6606 ;;
  # }

  # dimension: ibe6607 {
  #   type: string
  #   sql: ${TABLE}.IBE6607 ;;
  # }

  # dimension: ibe6608 {
  #   type: string
  #   sql: ${TABLE}.IBE6608 ;;
  # }

  # dimension: ibe6609 {
  #   type: string
  #   sql: ${TABLE}.IBE6609 ;;
  # }

  # dimension: ibe6610 {
  #   type: string
  #   sql: ${TABLE}.IBE6610 ;;
  # }

  # dimension: ibe6611 {
  #   type: string
  #   sql: ${TABLE}.IBE6611 ;;
  # }

  # dimension: ibe6612 {
  #   type: string
  #   sql: ${TABLE}.IBE6612 ;;
  # }

  # dimension: ibe6614 {
  #   type: string
  #   sql: ${TABLE}.IBE6614 ;;
  # }

  # dimension: ibe6615 {
  #   type: string
  #   sql: ${TABLE}.IBE6615 ;;
  # }

  # dimension: ibe6617 {
  #   type: string
  #   sql: ${TABLE}.IBE6617 ;;
  # }

  # dimension: ibe6618 {
  #   type: string
  #   sql: ${TABLE}.IBE6618 ;;
  # }

  # dimension: ibe6619 {
  #   type: string
  #   sql: ${TABLE}.IBE6619 ;;
  # }

  # dimension: ibe6620 {
  #   type: string
  #   sql: ${TABLE}.IBE6620 ;;
  # }

  # dimension: ibe6621 {
  #   type: string
  #   sql: ${TABLE}.IBE6621 ;;
  # }

  # dimension: ibe6622 {
  #   type: string
  #   sql: ${TABLE}.IBE6622 ;;
  # }

  # dimension: ibe6623 {
  #   type: string
  #   sql: ${TABLE}.IBE6623 ;;
  # }

  # dimension: ibe6624 {
  #   type: string
  #   sql: ${TABLE}.IBE6624 ;;
  # }

  # dimension: ibe6625 {
  #   type: string
  #   sql: ${TABLE}.IBE6625 ;;
  # }

  # dimension: ibe6626 {
  #   type: string
  #   sql: ${TABLE}.IBE6626 ;;
  # }

  # dimension: ibe6627 {
  #   type: string
  #   sql: ${TABLE}.IBE6627 ;;
  # }

  # dimension: ibe6628 {
  #   type: string
  #   sql: ${TABLE}.IBE6628 ;;
  # }

  # dimension: ibe6629 {
  #   type: string
  #   sql: ${TABLE}.IBE6629 ;;
  # }

  # dimension: ibe6630 {
  #   type: string
  #   sql: ${TABLE}.IBE6630 ;;
  # }

  # dimension: ibe6631 {
  #   type: string
  #   sql: ${TABLE}.IBE6631 ;;
  # }

  # dimension: ibe6632 {
  #   type: string
  #   sql: ${TABLE}.IBE6632 ;;
  # }

  # dimension: ibe6633 {
  #   type: string
  #   sql: ${TABLE}.IBE6633 ;;
  # }

  # dimension: ibe6634 {
  #   type: string
  #   sql: ${TABLE}.IBE6634 ;;
  # }

  # dimension: ibe6636 {
  #   type: string
  #   sql: ${TABLE}.IBE6636 ;;
  # }

  # dimension: ibe6637 {
  #   type: string
  #   sql: ${TABLE}.IBE6637 ;;
  # }

  # dimension: ibe6638 {
  #   type: string
  #   sql: ${TABLE}.IBE6638 ;;
  # }

  # dimension: ibe6639 {
  #   type: string
  #   sql: ${TABLE}.IBE6639 ;;
  # }

  # dimension: ibe6640 {
  #   type: string
  #   sql: ${TABLE}.IBE6640 ;;
  # }

  # dimension: ibe6641 {
  #   type: string
  #   sql: ${TABLE}.IBE6641 ;;
  # }

  # dimension: ibe6642 {
  #   type: string
  #   sql: ${TABLE}.IBE6642 ;;
  # }

  # dimension: ibe6643 {
  #   type: string
  #   sql: ${TABLE}.IBE6643 ;;
  # }

  # dimension: ibe6644 {
  #   type: string
  #   sql: ${TABLE}.IBE6644 ;;
  # }

  # dimension: ibe6645 {
  #   type: string
  #   sql: ${TABLE}.IBE6645 ;;
  # }

  # dimension: ibe6647 {
  #   type: string
  #   sql: ${TABLE}.IBE6647 ;;
  # }

  # dimension: ibe6648 {
  #   type: string
  #   sql: ${TABLE}.IBE6648 ;;
  # }

  # dimension: ibe6649 {
  #   type: string
  #   sql: ${TABLE}.IBE6649 ;;
  # }

  # dimension: ibe6650 {
  #   type: string
  #   sql: ${TABLE}.IBE6650 ;;
  # }

  # dimension: ibe6651 {
  #   type: string
  #   sql: ${TABLE}.IBE6651 ;;
  # }

  # dimension: ibe6652 {
  #   type: string
  #   sql: ${TABLE}.IBE6652 ;;
  # }

  # dimension: ibe6653 {
  #   type: string
  #   sql: ${TABLE}.IBE6653 ;;
  # }

  # dimension: ibe6654 {
  #   type: string
  #   sql: ${TABLE}.IBE6654 ;;
  # }

  # dimension: ibe6655 {
  #   type: string
  #   sql: ${TABLE}.IBE6655 ;;
  # }

  # dimension: ibe6656 {
  #   type: string
  #   sql: ${TABLE}.IBE6656 ;;
  # }

  # dimension: ibe6657 {
  #   type: string
  #   sql: ${TABLE}.IBE6657 ;;
  # }

  # dimension: ibe6658 {
  #   type: string
  #   sql: ${TABLE}.IBE6658 ;;
  # }

  # dimension: ibe6659 {
  #   type: string
  #   sql: ${TABLE}.IBE6659 ;;
  # }

  # dimension: ibe6660 {
  #   type: string
  #   sql: ${TABLE}.IBE6660 ;;
  # }

  # dimension: ibe6661 {
  #   type: string
  #   sql: ${TABLE}.IBE6661 ;;
  # }

  # dimension: ibe6662 {
  #   type: string
  #   sql: ${TABLE}.IBE6662 ;;
  # }

  # dimension: ibe6663 {
  #   type: string
  #   sql: ${TABLE}.IBE6663 ;;
  # }

  # dimension: ibe6664 {
  #   type: string
  #   sql: ${TABLE}.IBE6664 ;;
  # }

  # dimension: ibe6665 {
  #   type: string
  #   sql: ${TABLE}.IBE6665 ;;
  # }

  # dimension: ibe6666 {
  #   type: string
  #   sql: ${TABLE}.IBE6666 ;;
  # }

  # dimension: ibe6667 {
  #   type: string
  #   sql: ${TABLE}.IBE6667 ;;
  # }

  # dimension: ibe6668 {
  #   type: string
  #   sql: ${TABLE}.IBE6668 ;;
  # }

  # dimension: ibe6669 {
  #   type: string
  #   sql: ${TABLE}.IBE6669 ;;
  # }

  # dimension: ibe6670 {
  #   type: string
  #   sql: ${TABLE}.IBE6670 ;;
  # }

  # dimension: ibe6671 {
  #   type: string
  #   sql: ${TABLE}.IBE6671 ;;
  # }

  # dimension: ibe6672 {
  #   type: string
  #   sql: ${TABLE}.IBE6672 ;;
  # }

  # dimension: ibe6673 {
  #   type: string
  #   sql: ${TABLE}.IBE6673 ;;
  # }

  # dimension: ibe6674 {
  #   type: string
  #   sql: ${TABLE}.IBE6674 ;;
  # }

  # dimension: ibe6675 {
  #   type: string
  #   sql: ${TABLE}.IBE6675 ;;
  # }

  # dimension: ibe6676 {
  #   type: string
  #   sql: ${TABLE}.IBE6676 ;;
  # }

  # dimension: ibe6677 {
  #   type: string
  #   sql: ${TABLE}.IBE6677 ;;
  # }

  # dimension: ibe6678 {
  #   type: string
  #   sql: ${TABLE}.IBE6678 ;;
  # }

  # dimension: ibe6679 {
  #   type: string
  #   sql: ${TABLE}.IBE6679 ;;
  # }

  # dimension: ibe6680 {
  #   type: string
  #   sql: ${TABLE}.IBE6680 ;;
  # }

  # dimension: ibe6681 {
  #   type: string
  #   sql: ${TABLE}.IBE6681 ;;
  # }

  # dimension: ibe6685 {
  #   type: string
  #   sql: ${TABLE}.IBE6685 ;;
  # }

  # dimension: ibe6686 {
  #   type: string
  #   sql: ${TABLE}.IBE6686 ;;
  # }

  # dimension: ibe6696 {
  #   type: string
  #   sql: ${TABLE}.IBE6696 ;;
  # }

  # dimension: ibe6697 {
  #   type: string
  #   sql: ${TABLE}.IBE6697 ;;
  # }

  # dimension: ibe6698 {
  #   type: string
  #   sql: ${TABLE}.IBE6698 ;;
  # }

  # dimension: ibe6699 {
  #   type: string
  #   sql: ${TABLE}.IBE6699 ;;
  # }

  # dimension: ibe6700 {
  #   type: string
  #   sql: ${TABLE}.IBE6700 ;;
  # }

  # dimension: ibe6701 {
  #   type: string
  #   sql: ${TABLE}.IBE6701 ;;
  # }

  # dimension: ibe6702 {
  #   type: string
  #   sql: ${TABLE}.IBE6702 ;;
  # }

  # dimension: ibe6703 {
  #   type: string
  #   sql: ${TABLE}.IBE6703 ;;
  # }

  # dimension: ibe6707 {
  #   type: string
  #   sql: ${TABLE}.IBE6707 ;;
  # }

  # dimension: ibe6708 {
  #   type: string
  #   sql: ${TABLE}.IBE6708 ;;
  # }

  # dimension: ibe6718 {
  #   type: string
  #   sql: ${TABLE}.IBE6718 ;;
  # }

  # dimension: ibe6719 {
  #   type: string
  #   sql: ${TABLE}.IBE6719 ;;
  # }

  # dimension: ibe6720 {
  #   type: string
  #   sql: ${TABLE}.IBE6720 ;;
  # }

  # dimension: ibe6721 {
  #   type: string
  #   sql: ${TABLE}.IBE6721 ;;
  # }

  # dimension: ibe6722 {
  #   type: string
  #   sql: ${TABLE}.IBE6722 ;;
  # }

  # dimension: ibe6723 {
  #   type: string
  #   sql: ${TABLE}.IBE6723 ;;
  # }

  # dimension: ibe6724 {
  #   type: string
  #   sql: ${TABLE}.IBE6724 ;;
  # }

  # dimension: ibe6726 {
  #   type: string
  #   sql: ${TABLE}.IBE6726 ;;
  # }

  # dimension: ibe6727 {
  #   type: string
  #   sql: ${TABLE}.IBE6727 ;;
  # }

  # dimension: ibe6728 {
  #   type: string
  #   sql: ${TABLE}.IBE6728 ;;
  # }

  # dimension: ibe6729 {
  #   type: string
  #   sql: ${TABLE}.IBE6729 ;;
  # }

  # dimension: ibe6730 {
  #   type: string
  #   sql: ${TABLE}.IBE6730 ;;
  # }

  # dimension: ibe6731 {
  #   type: string
  #   sql: ${TABLE}.IBE6731 ;;
  # }

  # dimension: ibe6732 {
  #   type: string
  #   sql: ${TABLE}.IBE6732 ;;
  # }

  # dimension: ibe6733 {
  #   type: string
  #   sql: ${TABLE}.IBE6733 ;;
  # }

  # dimension: ibe6734 {
  #   type: string
  #   sql: ${TABLE}.IBE6734 ;;
  # }

  # dimension: ibe6736 {
  #   type: string
  #   sql: ${TABLE}.IBE6736 ;;
  # }

  # dimension: ibe6737 {
  #   type: string
  #   sql: ${TABLE}.IBE6737 ;;
  # }

  # dimension: ibe6738 {
  #   type: string
  #   sql: ${TABLE}.IBE6738 ;;
  # }

  # dimension: ibe6739 {
  #   type: string
  #   sql: ${TABLE}.IBE6739 ;;
  # }

  # dimension: ibe6740 {
  #   type: string
  #   sql: ${TABLE}.IBE6740 ;;
  # }

  # dimension: ibe6741 {
  #   type: string
  #   sql: ${TABLE}.IBE6741 ;;
  # }

  # dimension: ibe6742 {
  #   type: string
  #   sql: ${TABLE}.IBE6742 ;;
  # }

  # dimension: ibe6743 {
  #   type: string
  #   sql: ${TABLE}.IBE6743 ;;
  # }

  # dimension: ibe6744 {
  #   type: string
  #   sql: ${TABLE}.IBE6744 ;;
  # }

  # dimension: ibe6745 {
  #   type: string
  #   sql: ${TABLE}.IBE6745 ;;
  # }

  # dimension: ibe6746 {
  #   type: string
  #   sql: ${TABLE}.IBE6746 ;;
  # }

  # dimension: ibe6748 {
  #   type: string
  #   sql: ${TABLE}.IBE6748 ;;
  # }

  # dimension: ibe6753 {
  #   type: string
  #   sql: ${TABLE}.IBE6753 ;;
  # }

  # dimension: ibe6754 {
  #   type: string
  #   sql: ${TABLE}.IBE6754 ;;
  # }

  # dimension: ibe6755 {
  #   type: string
  #   sql: ${TABLE}.IBE6755 ;;
  # }

  # dimension: ibe6756 {
  #   type: string
  #   sql: ${TABLE}.IBE6756 ;;
  # }

  # dimension: ibe6757 {
  #   type: string
  #   sql: ${TABLE}.IBE6757 ;;
  # }

  # dimension: ibe6758 {
  #   type: string
  #   sql: ${TABLE}.IBE6758 ;;
  # }

  # dimension: ibe6759 {
  #   type: string
  #   sql: ${TABLE}.IBE6759 ;;
  # }

  # dimension: ibe6760 {
  #   type: string
  #   sql: ${TABLE}.IBE6760 ;;
  # }

  # dimension: ibe6761 {
  #   type: string
  #   sql: ${TABLE}.IBE6761 ;;
  # }

  # dimension: ibe6762 {
  #   type: string
  #   sql: ${TABLE}.IBE6762 ;;
  # }

  # dimension: ibe6763 {
  #   type: string
  #   sql: ${TABLE}.IBE6763 ;;
  # }

  # dimension: ibe6764 {
  #   type: string
  #   sql: ${TABLE}.IBE6764 ;;
  # }

  # dimension: ibe6765 {
  #   type: string
  #   sql: ${TABLE}.IBE6765 ;;
  # }

  # dimension: ibe6766 {
  #   type: string
  #   sql: ${TABLE}.IBE6766 ;;
  # }

  # dimension: ibe6767 {
  #   type: string
  #   sql: ${TABLE}.IBE6767 ;;
  # }

  # dimension: ibe6768 {
  #   type: string
  #   sql: ${TABLE}.IBE6768 ;;
  # }

  # dimension: ibe6769 {
  #   type: string
  #   sql: ${TABLE}.IBE6769 ;;
  # }

  # dimension: ibe6770 {
  #   type: string
  #   sql: ${TABLE}.IBE6770 ;;
  # }

  # dimension: ibe6771 {
  #   type: string
  #   sql: ${TABLE}.IBE6771 ;;
  # }

  # dimension: ibe6772 {
  #   type: string
  #   sql: ${TABLE}.IBE6772 ;;
  # }

  # dimension: ibe6773 {
  #   type: string
  #   sql: ${TABLE}.IBE6773 ;;
  # }

  # dimension: ibe6774 {
  #   type: string
  #   sql: ${TABLE}.IBE6774 ;;
  # }

  # dimension: ibe6775 {
  #   type: string
  #   sql: ${TABLE}.IBE6775 ;;
  # }

  # dimension: ibe6776 {
  #   type: string
  #   sql: ${TABLE}.IBE6776 ;;
  # }

  # dimension: ibe6777 {
  #   type: string
  #   sql: ${TABLE}.IBE6777 ;;
  # }

  # dimension: ibe6778 {
  #   type: string
  #   sql: ${TABLE}.IBE6778 ;;
  # }

  # dimension: ibe6779 {
  #   type: string
  #   sql: ${TABLE}.IBE6779 ;;
  # }

  # dimension: ibe6780 {
  #   type: string
  #   sql: ${TABLE}.IBE6780 ;;
  # }

  # dimension: ibe6781 {
  #   type: string
  #   sql: ${TABLE}.IBE6781 ;;
  # }

  # dimension: ibe6782 {
  #   type: string
  #   sql: ${TABLE}.IBE6782 ;;
  # }

  # dimension: ibe6783 {
  #   type: string
  #   sql: ${TABLE}.IBE6783 ;;
  # }

  # dimension: ibe6784 {
  #   type: string
  #   sql: ${TABLE}.IBE6784 ;;
  # }

  # dimension: ibe6785 {
  #   type: string
  #   sql: ${TABLE}.IBE6785 ;;
  # }

  # dimension: ibe6786 {
  #   type: string
  #   sql: ${TABLE}.IBE6786 ;;
  # }

  # dimension: ibe6787 {
  #   type: string
  #   sql: ${TABLE}.IBE6787 ;;
  # }

  # dimension: ibe6788 {
  #   type: string
  #   sql: ${TABLE}.IBE6788 ;;
  # }

  # dimension: ibe6791 {
  #   type: string
  #   sql: ${TABLE}.IBE6791 ;;
  # }

  # dimension: ibe6792 {
  #   type: string
  #   sql: ${TABLE}.IBE6792 ;;
  # }

  # dimension: ibe6793 {
  #   type: string
  #   sql: ${TABLE}.IBE6793 ;;
  # }

  # dimension: ibe6794 {
  #   type: string
  #   sql: ${TABLE}.IBE6794 ;;
  # }

  # dimension: ibe6795 {
  #   type: string
  #   sql: ${TABLE}.IBE6795 ;;
  # }

  # dimension: ibe6796 {
  #   type: string
  #   sql: ${TABLE}.IBE6796 ;;
  # }

  # dimension: ibe6797 {
  #   type: string
  #   sql: ${TABLE}.IBE6797 ;;
  # }

  # dimension: ibe6798 {
  #   type: string
  #   sql: ${TABLE}.IBE6798 ;;
  # }

  # dimension: ibe6799 {
  #   type: string
  #   sql: ${TABLE}.IBE6799 ;;
  # }

  # dimension: ibe6801 {
  #   type: string
  #   sql: ${TABLE}.IBE6801 ;;
  # }

  # dimension: ibe6802 {
  #   type: string
  #   sql: ${TABLE}.IBE6802 ;;
  # }

  # dimension: ibe6803 {
  #   type: string
  #   sql: ${TABLE}.IBE6803 ;;
  # }

  # dimension: ibe6804 {
  #   type: string
  #   sql: ${TABLE}.IBE6804 ;;
  # }

  # dimension: ibe6805 {
  #   type: string
  #   sql: ${TABLE}.IBE6805 ;;
  # }

  # dimension: ibe6806 {
  #   type: string
  #   sql: ${TABLE}.IBE6806 ;;
  # }

  # dimension: ibe6809 {
  #   type: string
  #   sql: ${TABLE}.IBE6809 ;;
  # }

  # dimension: ibe6810 {
  #   type: string
  #   sql: ${TABLE}.IBE6810 ;;
  # }

  # dimension: ibe6811 {
  #   type: string
  #   sql: ${TABLE}.IBE6811 ;;
  # }

  # dimension: ibe6812 {
  #   type: string
  #   sql: ${TABLE}.IBE6812 ;;
  # }

  # dimension: ibe6813 {
  #   type: string
  #   sql: ${TABLE}.IBE6813 ;;
  # }

  # dimension: ibe6814 {
  #   type: string
  #   sql: ${TABLE}.IBE6814 ;;
  # }

  # dimension: ibe6815 {
  #   type: string
  #   sql: ${TABLE}.IBE6815 ;;
  # }

  # dimension: ibe6816 {
  #   type: string
  #   sql: ${TABLE}.IBE6816 ;;
  # }

  # dimension: ibe6817 {
  #   type: string
  #   sql: ${TABLE}.IBE6817 ;;
  # }

  # dimension: ibe6818 {
  #   type: string
  #   sql: ${TABLE}.IBE6818 ;;
  # }

  # dimension: ibe6819 {
  #   type: string
  #   sql: ${TABLE}.IBE6819 ;;
  # }

  # dimension: ibe6820 {
  #   type: string
  #   sql: ${TABLE}.IBE6820 ;;
  # }

  # dimension: ibe6821 {
  #   type: string
  #   sql: ${TABLE}.IBE6821 ;;
  # }

  # dimension: ibe6823 {
  #   type: string
  #   sql: ${TABLE}.IBE6823 ;;
  # }

  # dimension: ibe6824 {
  #   type: string
  #   sql: ${TABLE}.IBE6824 ;;
  # }

  # dimension: ibe6825 {
  #   type: string
  #   sql: ${TABLE}.IBE6825 ;;
  # }

  # dimension: ibe6826 {
  #   type: string
  #   sql: ${TABLE}.IBE6826 ;;
  # }

  # dimension: ibe6827 {
  #   type: string
  #   sql: ${TABLE}.IBE6827 ;;
  # }

  # dimension: ibe6828 {
  #   type: string
  #   sql: ${TABLE}.IBE6828 ;;
  # }

  # dimension: ibe6829 {
  #   type: string
  #   sql: ${TABLE}.IBE6829 ;;
  # }

  # dimension: ibe6830 {
  #   type: string
  #   sql: ${TABLE}.IBE6830 ;;
  # }

  # dimension: ibe6831 {
  #   type: string
  #   sql: ${TABLE}.IBE6831 ;;
  # }

  # dimension: ibe6832 {
  #   type: string
  #   sql: ${TABLE}.IBE6832 ;;
  # }

  # dimension: ibe6833 {
  #   type: string
  #   sql: ${TABLE}.IBE6833 ;;
  # }

  # dimension: ibe6834 {
  #   type: string
  #   sql: ${TABLE}.IBE6834 ;;
  # }

  # dimension: ibe6835 {
  #   type: string
  #   sql: ${TABLE}.IBE6835 ;;
  # }

  # dimension: ibe6836 {
  #   type: string
  #   sql: ${TABLE}.IBE6836 ;;
  # }

  # dimension: ibe6837 {
  #   type: string
  #   sql: ${TABLE}.IBE6837 ;;
  # }

  # dimension: ibe6838 {
  #   type: string
  #   sql: ${TABLE}.IBE6838 ;;
  # }

  # dimension: ibe6839 {
  #   type: string
  #   sql: ${TABLE}.IBE6839 ;;
  # }

  # dimension: ibe6840 {
  #   type: string
  #   sql: ${TABLE}.IBE6840 ;;
  # }

  # dimension: ibe6841 {
  #   type: string
  #   sql: ${TABLE}.IBE6841 ;;
  # }

  # dimension: ibe6842 {
  #   type: string
  #   sql: ${TABLE}.IBE6842 ;;
  # }

  # dimension: ibe6843 {
  #   type: string
  #   sql: ${TABLE}.IBE6843 ;;
  # }

  # dimension: ibe6844 {
  #   type: string
  #   sql: ${TABLE}.IBE6844 ;;
  # }

  # dimension: ibe6845 {
  #   type: string
  #   sql: ${TABLE}.IBE6845 ;;
  # }

  # dimension: ibe6846 {
  #   type: string
  #   sql: ${TABLE}.IBE6846 ;;
  # }

  # dimension: ibe6847 {
  #   type: string
  #   sql: ${TABLE}.IBE6847 ;;
  # }

  # dimension: ibe6848 {
  #   type: string
  #   sql: ${TABLE}.IBE6848 ;;
  # }

  # dimension: ibe6849 {
  #   type: string
  #   sql: ${TABLE}.IBE6849 ;;
  # }

  # dimension: ibe6850 {
  #   type: string
  #   sql: ${TABLE}.IBE6850 ;;
  # }

  # dimension: ibe6851 {
  #   type: string
  #   sql: ${TABLE}.IBE6851 ;;
  # }

  # dimension: ibe6852 {
  #   type: string
  #   sql: ${TABLE}.IBE6852 ;;
  # }

  # dimension: ibe6853 {
  #   type: string
  #   sql: ${TABLE}.IBE6853 ;;
  # }

  # dimension: ibe6854 {
  #   type: string
  #   sql: ${TABLE}.IBE6854 ;;
  # }

  # dimension: ibe6855 {
  #   type: string
  #   sql: ${TABLE}.IBE6855 ;;
  # }

  # dimension: ibe6856 {
  #   type: string
  #   sql: ${TABLE}.IBE6856 ;;
  # }

  # dimension: ibe6858 {
  #   type: string
  #   sql: ${TABLE}.IBE6858 ;;
  # }

  # dimension: ibe6859 {
  #   type: string
  #   sql: ${TABLE}.IBE6859 ;;
  # }

  # dimension: ibe6860 {
  #   type: string
  #   sql: ${TABLE}.IBE6860 ;;
  # }

  # dimension: ibe6861 {
  #   type: string
  #   sql: ${TABLE}.IBE6861 ;;
  # }

  # dimension: ibe6863 {
  #   type: string
  #   sql: ${TABLE}.IBE6863 ;;
  # }

  # dimension: ibe6864 {
  #   type: string
  #   sql: ${TABLE}.IBE6864 ;;
  # }

  # dimension: ibe6865 {
  #   type: string
  #   sql: ${TABLE}.IBE6865 ;;
  # }

  # dimension: ibe6866 {
  #   type: string
  #   sql: ${TABLE}.IBE6866 ;;
  # }

  # dimension: ibe6867 {
  #   type: string
  #   sql: ${TABLE}.IBE6867 ;;
  # }

  # dimension: ibe6868 {
  #   type: string
  #   sql: ${TABLE}.IBE6868 ;;
  # }

  # dimension: ibe6869 {
  #   type: string
  #   sql: ${TABLE}.IBE6869 ;;
  # }

  # dimension: ibe6870 {
  #   type: string
  #   sql: ${TABLE}.IBE6870 ;;
  # }

  # dimension: ibe6871 {
  #   type: string
  #   sql: ${TABLE}.IBE6871 ;;
  # }

  # dimension: ibe6872 {
  #   type: string
  #   sql: ${TABLE}.IBE6872 ;;
  # }

  # dimension: ibe6873 {
  #   type: string
  #   sql: ${TABLE}.IBE6873 ;;
  # }

  # dimension: ibe6874 {
  #   type: string
  #   sql: ${TABLE}.IBE6874 ;;
  # }

  # dimension: ibe6875 {
  #   type: string
  #   sql: ${TABLE}.IBE6875 ;;
  # }

  # dimension: ibe6878 {
  #   type: string
  #   sql: ${TABLE}.IBE6878 ;;
  # }

  # dimension: ibe6879 {
  #   type: string
  #   sql: ${TABLE}.IBE6879 ;;
  # }

  # dimension: ibe6880 {
  #   type: string
  #   sql: ${TABLE}.IBE6880 ;;
  # }

  # dimension: ibe6881 {
  #   type: string
  #   sql: ${TABLE}.IBE6881 ;;
  # }

  # dimension: ibe6882 {
  #   type: string
  #   sql: ${TABLE}.IBE6882 ;;
  # }

  # dimension: ibe6884 {
  #   type: string
  #   sql: ${TABLE}.IBE6884 ;;
  # }

  # dimension: ibe6885 {
  #   type: string
  #   sql: ${TABLE}.IBE6885 ;;
  # }

  # dimension: ibe6886 {
  #   type: string
  #   sql: ${TABLE}.IBE6886 ;;
  # }

  # dimension: ibe6887 {
  #   type: string
  #   sql: ${TABLE}.IBE6887 ;;
  # }

  # dimension: ibe6888 {
  #   type: string
  #   sql: ${TABLE}.IBE6888 ;;
  # }

  # dimension: ibe6889 {
  #   type: string
  #   sql: ${TABLE}.IBE6889 ;;
  # }

  # dimension: ibe6890 {
  #   type: string
  #   sql: ${TABLE}.IBE6890 ;;
  # }

  # dimension: ibe6891 {
  #   type: string
  #   sql: ${TABLE}.IBE6891 ;;
  # }

  # dimension: ibe6892 {
  #   type: string
  #   sql: ${TABLE}.IBE6892 ;;
  # }

  # dimension: ibe6893 {
  #   type: string
  #   sql: ${TABLE}.IBE6893 ;;
  # }

  # dimension: ibe6894 {
  #   type: string
  #   sql: ${TABLE}.IBE6894 ;;
  # }

  # dimension: ibe6895 {
  #   type: string
  #   sql: ${TABLE}.IBE6895 ;;
  # }

  # dimension: ibe6896 {
  #   type: string
  #   sql: ${TABLE}.IBE6896 ;;
  # }

  # dimension: ibe6897 {
  #   type: string
  #   sql: ${TABLE}.IBE6897 ;;
  # }

  # dimension: ibe6898 {
  #   type: string
  #   sql: ${TABLE}.IBE6898 ;;
  # }

  # dimension: ibe6899 {
  #   type: string
  #   sql: ${TABLE}.IBE6899 ;;
  # }

  # dimension: ibe7467 {
  #   type: string
  #   sql: ${TABLE}.IBE7467 ;;
  # }

  # dimension: ibe7468 {
  #   type: string
  #   sql: ${TABLE}.IBE7468 ;;
  # }

  # dimension: ibe7470 {
  #   type: string
  #   sql: ${TABLE}.IBE7470 ;;
  # }

  # dimension: ibe7473 {
  #   type: string
  #   sql: ${TABLE}.IBE7473 ;;
  # }

  # dimension: ibe7478 {
  #   type: string
  #   sql: ${TABLE}.IBE7478 ;;
  # }

  # dimension: ibe7480_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7480_01 ;;
  # }

  # dimension: ibe7480_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7480_02 ;;
  # }

  # dimension: ibe7480_03 {
  #   type: string
  #   sql: ${TABLE}.IBE7480_03 ;;
  # }

  # dimension: ibe7600_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_01 ;;
  # }

  # dimension: ibe7600_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_02 ;;
  # }

  # dimension: ibe7600_03 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_03 ;;
  # }

  # dimension: ibe7600_04 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_04 ;;
  # }

  # dimension: ibe7600_05 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_05 ;;
  # }

  # dimension: ibe7600_06 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_06 ;;
  # }

  # dimension: ibe7600_07 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_07 ;;
  # }

  # dimension: ibe7600_08 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_08 ;;
  # }

  # dimension: ibe7600_09 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_09 ;;
  # }

  # dimension: ibe7600_10 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_10 ;;
  # }

  # dimension: ibe7600_11 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_11 ;;
  # }

  # dimension: ibe7600_12 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_12 ;;
  # }

  # dimension: ibe7600_13 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_13 ;;
  # }

  # dimension: ibe7600_14 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_14 ;;
  # }

  # dimension: ibe7600_15 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_15 ;;
  # }

  # dimension: ibe7600_16 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_16 ;;
  # }

  # dimension: ibe7600_17 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_17 ;;
  # }

  # dimension: ibe7600_18 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_18 ;;
  # }

  # dimension: ibe7600_19 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_19 ;;
  # }

  # dimension: ibe7600_20 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_20 ;;
  # }

  # dimension: ibe7600_21 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_21 ;;
  # }

  # dimension: ibe7600_22 {
  #   type: string
  #   sql: ${TABLE}.IBE7600_22 ;;
  # }

  # dimension: ibe7601_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_01 ;;
  # }

  # dimension: ibe7601_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_02 ;;
  # }

  # dimension: ibe7601_03 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_03 ;;
  # }

  # dimension: ibe7601_04 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_04 ;;
  # }

  # dimension: ibe7601_05 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_05 ;;
  # }

  # dimension: ibe7601_06 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_06 ;;
  # }

  # dimension: ibe7601_07 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_07 ;;
  # }

  # dimension: ibe7601_08 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_08 ;;
  # }

  # dimension: ibe7601_09 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_09 ;;
  # }

  # dimension: ibe7601_10 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_10 ;;
  # }

  # dimension: ibe7601_11 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_11 ;;
  # }

  # dimension: ibe7601_12 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_12 ;;
  # }

  # dimension: ibe7601_13 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_13 ;;
  # }

  # dimension: ibe7601_14 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_14 ;;
  # }

  # dimension: ibe7601_15 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_15 ;;
  # }

  # dimension: ibe7601_16 {
  #   type: string
  #   sql: ${TABLE}.IBE7601_16 ;;
  # }

  # dimension: ibe7602_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7602_01 ;;
  # }

  # dimension: ibe7602_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7602_02 ;;
  # }

  # dimension: ibe7606_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7606_01 ;;
  # }

  # dimension: ibe7606_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7606_02 ;;
  # }

  # dimension: ibe7607_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7607_01 ;;
  # }

  # dimension: ibe7607_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7607_02 ;;
  # }

  # dimension: ibe7609_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7609_01 ;;
  # }

  # dimension: ibe7609_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7609_02 ;;
  # }

  # dimension: ibe7616_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7616_01 ;;
  # }

  # dimension: ibe7616_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7616_02 ;;
  # }

  # dimension: ibe7622_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7622_01 ;;
  # }

  # dimension: ibe7622_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7622_02 ;;
  # }

  # dimension: ibe7628_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7628_01 ;;
  # }

  # dimension: ibe7628_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7628_02 ;;
  # }

  # dimension: ibe7629_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7629_01 ;;
  # }

  # dimension: ibe7629_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7629_02 ;;
  # }

  # dimension: ibe7650_01 {
  #   type: string
  #   sql: ${TABLE}.IBE7650_01 ;;
  # }

  # dimension: ibe7650_02 {
  #   type: string
  #   sql: ${TABLE}.IBE7650_02 ;;
  # }

  # dimension: ibe7719 {
  #   type: string
  #   sql: ${TABLE}.IBE7719 ;;
  # }

  # dimension: ibe7720 {
  #   type: string
  #   sql: ${TABLE}.IBE7720 ;;
  # }

  # dimension: ibe7721 {
  #   type: string
  #   sql: ${TABLE}.IBE7721 ;;
  # }

  # dimension: ibe7723 {
  #   type: string
  #   sql: ${TABLE}.IBE7723 ;;
  # }

  # dimension: ibe7724 {
  #   type: string
  #   sql: ${TABLE}.IBE7724 ;;
  # }

  # dimension: ibe7725 {
  #   type: string
  #   sql: ${TABLE}.IBE7725 ;;
  # }

  # dimension: ibe7726 {
  #   type: string
  #   sql: ${TABLE}.IBE7726 ;;
  # }

  # dimension: ibe7727 {
  #   type: string
  #   sql: ${TABLE}.IBE7727 ;;
  # }

  # dimension: ibe7728 {
  #   type: string
  #   sql: ${TABLE}.IBE7728 ;;
  # }

  # dimension: ibe7729 {
  #   type: string
  #   sql: ${TABLE}.IBE7729 ;;
  # }

  # dimension: ibe7730 {
  #   type: string
  #   sql: ${TABLE}.IBE7730 ;;
  # }

  # dimension: ibe7732 {
  #   type: string
  #   sql: ${TABLE}.IBE7732 ;;
  # }

  # dimension: ibe7733 {
  #   type: string
  #   sql: ${TABLE}.IBE7733 ;;
  # }

  # dimension: ibe7734 {
  #   type: string
  #   sql: ${TABLE}.IBE7734 ;;
  # }

  # dimension: ibe7735 {
  #   type: string
  #   sql: ${TABLE}.IBE7735 ;;
  # }

  # dimension: ibe7736 {
  #   type: string
  #   sql: ${TABLE}.IBE7736 ;;
  # }

  # dimension: ibe7737 {
  #   type: string
  #   sql: ${TABLE}.IBE7737 ;;
  # }

  # dimension: ibe7738 {
  #   type: string
  #   sql: ${TABLE}.IBE7738 ;;
  # }

  # dimension: ibe7739 {
  #   type: string
  #   sql: ${TABLE}.IBE7739 ;;
  # }

  # dimension: ibe7740 {
  #   type: string
  #   sql: ${TABLE}.IBE7740 ;;
  # }

  # dimension: ibe7741 {
  #   type: string
  #   sql: ${TABLE}.IBE7741 ;;
  # }

  # dimension: ibe7742 {
  #   type: string
  #   sql: ${TABLE}.IBE7742 ;;
  # }

  # dimension: ibe7743 {
  #   type: string
  #   sql: ${TABLE}.IBE7743 ;;
  # }

  # dimension: ibe7744 {
  #   type: string
  #   sql: ${TABLE}.IBE7744 ;;
  # }

  # dimension: ibe7746 {
  #   type: string
  #   sql: ${TABLE}.IBE7746 ;;
  # }

  # dimension: ibe7747 {
  #   type: string
  #   sql: ${TABLE}.IBE7747 ;;
  # }

  # dimension: ibe7748 {
  #   type: string
  #   sql: ${TABLE}.IBE7748 ;;
  # }

  # dimension: ibe7750 {
  #   type: string
  #   sql: ${TABLE}.IBE7750 ;;
  # }

  # dimension: ibe7751 {
  #   type: string
  #   sql: ${TABLE}.IBE7751 ;;
  # }

  # dimension: ibe7752 {
  #   type: string
  #   sql: ${TABLE}.IBE7752 ;;
  # }

  # dimension: ibe7753 {
  #   type: string
  #   sql: ${TABLE}.IBE7753 ;;
  # }

  # dimension: ibe7754 {
  #   type: string
  #   sql: ${TABLE}.IBE7754 ;;
  # }

  # dimension: ibe7755 {
  #   type: string
  #   sql: ${TABLE}.IBE7755 ;;
  # }

  # dimension: ibe7756 {
  #   type: string
  #   sql: ${TABLE}.IBE7756 ;;
  # }

  # dimension: ibe7757 {
  #   type: string
  #   sql: ${TABLE}.IBE7757 ;;
  # }

  # dimension: ibe7758 {
  #   type: string
  #   sql: ${TABLE}.IBE7758 ;;
  # }

  # dimension: ibe7759 {
  #   type: string
  #   sql: ${TABLE}.IBE7759 ;;
  # }

  # dimension: ibe7760 {
  #   type: string
  #   sql: ${TABLE}.IBE7760 ;;
  # }

  # dimension: ibe7761 {
  #   type: string
  #   sql: ${TABLE}.IBE7761 ;;
  # }

  # dimension: ibe7762 {
  #   type: string
  #   sql: ${TABLE}.IBE7762 ;;
  # }

  # dimension: ibe7763 {
  #   type: string
  #   sql: ${TABLE}.IBE7763 ;;
  # }

  # dimension: ibe7764 {
  #   type: string
  #   sql: ${TABLE}.IBE7764 ;;
  # }

  # dimension: ibe7766 {
  #   type: string
  #   sql: ${TABLE}.IBE7766 ;;
  # }

  # dimension: ibe7768 {
  #   type: string
  #   sql: ${TABLE}.IBE7768 ;;
  # }

  # dimension: ibe7770 {
  #   type: string
  #   sql: ${TABLE}.IBE7770 ;;
  # }

  # dimension: ibe7771 {
  #   type: string
  #   sql: ${TABLE}.IBE7771 ;;
  # }

  # dimension: ibe7772 {
  #   type: string
  #   sql: ${TABLE}.IBE7772 ;;
  # }

  # dimension: ibe7773 {
  #   type: string
  #   sql: ${TABLE}.IBE7773 ;;
  # }

  # dimension: ibe7774 {
  #   type: string
  #   sql: ${TABLE}.IBE7774 ;;
  # }

  # dimension: ibe7775 {
  #   type: string
  #   sql: ${TABLE}.IBE7775 ;;
  # }

  # dimension: ibe7777 {
  #   type: string
  #   sql: ${TABLE}.IBE7777 ;;
  # }

  # dimension: ibe7779 {
  #   type: string
  #   sql: ${TABLE}.IBE7779 ;;
  # }

  # dimension: ibe7780 {
  #   type: string
  #   sql: ${TABLE}.IBE7780 ;;
  # }

  # dimension: ibe7781 {
  #   type: string
  #   sql: ${TABLE}.IBE7781 ;;
  # }

  # dimension: ibe7782 {
  #   type: string
  #   sql: ${TABLE}.IBE7782 ;;
  # }

  # dimension: ibe7783 {
  #   type: string
  #   sql: ${TABLE}.IBE7783 ;;
  # }

  # dimension: ibe7784 {
  #   type: string
  #   sql: ${TABLE}.IBE7784 ;;
  # }

  # dimension: ibe7785 {
  #   type: string
  #   sql: ${TABLE}.IBE7785 ;;
  # }

  # dimension: ibe7786 {
  #   type: string
  #   sql: ${TABLE}.IBE7786 ;;
  # }

  # dimension: ibe7787 {
  #   type: string
  #   sql: ${TABLE}.IBE7787 ;;
  # }

  # dimension: ibe7788 {
  #   type: string
  #   sql: ${TABLE}.IBE7788 ;;
  # }

  # dimension: ibe7789 {
  #   type: string
  #   sql: ${TABLE}.IBE7789 ;;
  # }

  # dimension: ibe7790 {
  #   type: string
  #   sql: ${TABLE}.IBE7790 ;;
  # }

  # dimension: ibe7791 {
  #   type: string
  #   sql: ${TABLE}.IBE7791 ;;
  # }

  # dimension: ibe7792 {
  #   type: string
  #   sql: ${TABLE}.IBE7792 ;;
  # }

  # dimension: ibe7793 {
  #   type: string
  #   sql: ${TABLE}.IBE7793 ;;
  # }

  # dimension: ibe7794 {
  #   type: string
  #   sql: ${TABLE}.IBE7794 ;;
  # }

  # dimension: ibe7795 {
  #   type: string
  #   sql: ${TABLE}.IBE7795 ;;
  # }

  # dimension: ibe7796 {
  #   type: string
  #   sql: ${TABLE}.IBE7796 ;;
  # }

  # dimension: ibe7799 {
  #   type: string
  #   sql: ${TABLE}.IBE7799 ;;
  # }

  # dimension: ibe7801 {
  #   type: string
  #   sql: ${TABLE}.IBE7801 ;;
  # }

  # dimension: ibe7802 {
  #   type: string
  #   sql: ${TABLE}.IBE7802 ;;
  # }

  # dimension: ibe7803 {
  #   type: string
  #   sql: ${TABLE}.IBE7803 ;;
  # }

  # dimension: ibe7804 {
  #   type: string
  #   sql: ${TABLE}.IBE7804 ;;
  # }

  # dimension: ibe7805 {
  #   type: string
  #   sql: ${TABLE}.IBE7805 ;;
  # }

  # dimension: ibe7807 {
  #   type: string
  #   sql: ${TABLE}.IBE7807 ;;
  # }

  # dimension: ibe7808 {
  #   type: string
  #   sql: ${TABLE}.IBE7808 ;;
  # }

  # dimension: ibe7809 {
  #   type: string
  #   sql: ${TABLE}.IBE7809 ;;
  # }

  # dimension: ibe7810 {
  #   type: string
  #   sql: ${TABLE}.IBE7810 ;;
  # }

  # dimension: ibe7811 {
  #   type: string
  #   sql: ${TABLE}.IBE7811 ;;
  # }

  # dimension: ibe7812 {
  #   type: string
  #   sql: ${TABLE}.IBE7812 ;;
  # }

  # dimension: ibe7813 {
  #   type: string
  #   sql: ${TABLE}.IBE7813 ;;
  # }

  # dimension: ibe7814 {
  #   type: string
  #   sql: ${TABLE}.IBE7814 ;;
  # }

  # dimension: ibe7815 {
  #   type: string
  #   sql: ${TABLE}.IBE7815 ;;
  # }

  # dimension: ibe7816 {
  #   type: string
  #   sql: ${TABLE}.IBE7816 ;;
  # }

  # dimension: ibe7817 {
  #   type: string
  #   sql: ${TABLE}.IBE7817 ;;
  # }

  # dimension: ibe7821 {
  #   type: string
  #   sql: ${TABLE}.IBE7821 ;;
  # }

  # dimension: ibe7822 {
  #   type: string
  #   sql: ${TABLE}.IBE7822 ;;
  # }

  # dimension: ibe7823 {
  #   type: string
  #   sql: ${TABLE}.IBE7823 ;;
  # }

  # dimension: ibe7824 {
  #   type: string
  #   sql: ${TABLE}.IBE7824 ;;
  # }

  # dimension: ibe7825 {
  #   type: string
  #   sql: ${TABLE}.IBE7825 ;;
  # }

  # dimension: ibe7826 {
  #   type: string
  #   sql: ${TABLE}.IBE7826 ;;
  # }

  # dimension: ibe7827 {
  #   type: string
  #   sql: ${TABLE}.IBE7827 ;;
  # }

  # dimension: ibe7828 {
  #   type: string
  #   sql: ${TABLE}.IBE7828 ;;
  # }

  # dimension: ibe7829 {
  #   type: string
  #   sql: ${TABLE}.IBE7829 ;;
  # }

  # dimension: ibe7830 {
  #   type: string
  #   sql: ${TABLE}.IBE7830 ;;
  # }

  # dimension: ibe7831 {
  #   type: string
  #   sql: ${TABLE}.IBE7831 ;;
  # }

  # dimension: ibe7832 {
  #   type: string
  #   sql: ${TABLE}.IBE7832 ;;
  # }

  # dimension: ibe7841 {
  #   type: string
  #   sql: ${TABLE}.IBE7841 ;;
  # }

  # dimension: ibe7843 {
  #   type: string
  #   sql: ${TABLE}.IBE7843 ;;
  # }

  # dimension: ibe7844 {
  #   type: string
  #   sql: ${TABLE}.IBE7844 ;;
  # }

  # dimension: ibe7847 {
  #   type: string
  #   sql: ${TABLE}.IBE7847 ;;
  # }

  # dimension: ibe7848 {
  #   type: string
  #   sql: ${TABLE}.IBE7848 ;;
  # }

  # dimension: ibe7849 {
  #   type: string
  #   sql: ${TABLE}.IBE7849 ;;
  # }

  # dimension: ibe7851 {
  #   type: string
  #   sql: ${TABLE}.IBE7851 ;;
  # }

  # dimension: ibe7964_b_16 {
  #   type: string
  #   sql: ${TABLE}.IBE7964B_16 ;;
  # }

  # dimension: ibe8082 {
  #   type: string
  #   sql: ${TABLE}.IBE8082 ;;
  # }

  dimension: ibe8165_01 {
    type: string
    sql: ${TABLE}.IBE8165_01 ;;
  }

  dimension: ibe8165_02 {
    type: string
    sql: ${TABLE}.IBE8165_02 ;;
  }

  dimension: ibe8165_03 {
    type: string
    sql: ${TABLE}.IBE8165_03 ;;
  }

  dimension: ibe8167_01 {
    type: string
    sql: ${TABLE}.IBE8167_01 ;;
  }

  dimension: ibe8167_02 {
    type: string
    sql: ${TABLE}.IBE8167_02 ;;
  }

  dimension: ibe8167_03 {
    type: string
    sql: ${TABLE}.IBE8167_03 ;;
  }

  dimension: ibe8167_04 {
    type: string
    sql: ${TABLE}.IBE8167_04 ;;
  }

  dimension: ibe8167_05 {
    type: string
    sql: ${TABLE}.IBE8167_05 ;;
  }

  dimension: ibe8167_06 {
    type: string
    sql: ${TABLE}.IBE8167_06 ;;
  }

  dimension: ibe8167_07 {
    type: string
    sql: ${TABLE}.IBE8167_07 ;;
  }

  dimension: ibe8167_08 {
    type: string
    sql: ${TABLE}.IBE8167_08 ;;
  }

  dimension: ibe8167_09 {
    type: string
    sql: ${TABLE}.IBE8167_09 ;;
  }

  dimension: ibe8167_10 {
    type: string
    sql: ${TABLE}.IBE8167_10 ;;
  }

  dimension: ibe8167_11 {
    type: string
    sql: ${TABLE}.IBE8167_11 ;;
  }

  dimension: ibe8167_12 {
    type: string
    sql: ${TABLE}.IBE8167_12 ;;
  }

  dimension: ibe8167_13 {
    type: string
    sql: ${TABLE}.IBE8167_13 ;;
  }

  dimension: ibe8167_14 {
    type: string
    sql: ${TABLE}.IBE8167_14 ;;
  }

  dimension: ibe8167_15 {
    type: string
    sql: ${TABLE}.IBE8167_15 ;;
  }

  dimension: ibe8167_16 {
    type: string
    sql: ${TABLE}.IBE8167_16 ;;
  }

  dimension: ibe8167_17 {
    type: string
    sql: ${TABLE}.IBE8167_17 ;;
  }

  dimension: ibe8167_18 {
    type: string
    sql: ${TABLE}.IBE8167_18 ;;
  }

  dimension: ibe8167_19 {
    type: string
    sql: ${TABLE}.IBE8167_19 ;;
  }

  dimension: ibe8167_20 {
    type: string
    sql: ${TABLE}.IBE8167_20 ;;
  }

  dimension: ibe8167_21 {
    type: string
    sql: ${TABLE}.IBE8167_21 ;;
  }

  dimension: ibe8167_22 {
    type: string
    sql: ${TABLE}.IBE8167_22 ;;
  }

  dimension: ibe8167_23 {
    type: string
    sql: ${TABLE}.IBE8167_23 ;;
  }

  dimension: ibe8167_24 {
    type: string
    sql: ${TABLE}.IBE8167_24 ;;
  }

  dimension: ibe8167_25 {
    type: string
    sql: ${TABLE}.IBE8167_25 ;;
  }

  dimension: ibe8167_26 {
    type: string
    sql: ${TABLE}.IBE8167_26 ;;
  }

  dimension: ibe8167_27 {
    type: string
    sql: ${TABLE}.IBE8167_27 ;;
  }

  dimension: ibe8167_28 {
    type: string
    sql: ${TABLE}.IBE8167_28 ;;
  }

  dimension: ibe8167_29 {
    type: string
    sql: ${TABLE}.IBE8167_29 ;;
  }

  dimension: ibe8167_30 {
    type: string
    sql: ${TABLE}.IBE8167_30 ;;
  }

  dimension: ibe8167_31 {
    type: string
    sql: ${TABLE}.IBE8167_31 ;;
  }

  dimension: ibe8177 {
    type: string
    sql: ${TABLE}.IBE8177 ;;
  }

  dimension: ibe8236 {
    type: string
    sql: ${TABLE}.IBE8236 ;;
  }

  dimension: ibe8257 {
    type: string
    sql: ${TABLE}.IBE8257 ;;
  }

  dimension: ibe8263 {
    type: string
    sql: ${TABLE}.IBE8263 ;;
  }

  dimension: ibe8271 {
    type: string
    sql: ${TABLE}.IBE8271 ;;
  }

  dimension: ibe8272 {
    type: string
    sql: ${TABLE}.IBE8272 ;;
  }

  dimension: ibe8274 {
    type: string
    sql: ${TABLE}.IBE8274 ;;
  }

  dimension: ibe8276 {
    type: string
    sql: ${TABLE}.IBE8276 ;;
  }

  dimension: ibe8277 {
    type: string
    sql: ${TABLE}.IBE8277 ;;
  }

  dimension: ibe8278 {
    type: string
    sql: ${TABLE}.IBE8278 ;;
  }

  dimension: ibe8279 {
    type: string
    sql: ${TABLE}.IBE8279 ;;
  }

  dimension: ibe8321 {
    type: string
    sql: ${TABLE}.IBE8321 ;;
  }

  dimension: ibe8322 {
    type: string
    sql: ${TABLE}.IBE8322 ;;
  }

  dimension: ibe8326 {
    type: string
    sql: ${TABLE}.IBE8326 ;;
  }

  dimension: ibe8337 {
    type: string
    sql: ${TABLE}.IBE8337 ;;
  }

  dimension: ibe8339 {
    type: string
    sql: ${TABLE}.IBE8339 ;;
  }

  dimension: ibe8433 {
    type: string
    sql: ${TABLE}.IBE8433 ;;
  }

  dimension: ibe8434_01 {
    type: string
    sql: ${TABLE}.IBE8434_01 ;;
  }

  dimension: ibe8434_02 {
    type: string
    sql: ${TABLE}.IBE8434_02 ;;
  }

  dimension: ibe8436 {
    type: string
    sql: ${TABLE}.IBE8436 ;;
  }

  dimension: ibe8438 {
    type: string
    sql: ${TABLE}.IBE8438 ;;
  }

  dimension: ibe8439 {
    type: string
    sql: ${TABLE}.IBE8439 ;;
  }

  dimension: ibe8440 {
    type: string
    sql: ${TABLE}.IBE8440 ;;
  }

  dimension: ibe8441 {
    type: string
    sql: ${TABLE}.IBE8441 ;;
  }

  dimension: ibe8442 {
    type: string
    sql: ${TABLE}.IBE8442 ;;
  }

  dimension: ibe8443 {
    type: string
    sql: ${TABLE}.IBE8443 ;;
  }

  dimension: ibe8444 {
    type: string
    sql: ${TABLE}.IBE8444 ;;
  }

  dimension: ibe8445 {
    type: string
    sql: ${TABLE}.IBE8445 ;;
  }

  dimension: ibe8446 {
    type: string
    sql: ${TABLE}.IBE8446 ;;
  }

  dimension: ibe8487 {
    type: string
    sql: ${TABLE}.IBE8487 ;;
  }

  dimension: ibe8496 {
    type: string
    sql: ${TABLE}.IBE8496 ;;
  }

  dimension: ibe8505 {
    type: string
    sql: ${TABLE}.IBE8505 ;;
  }

  dimension: ibe8514 {
    type: string
    sql: ${TABLE}.IBE8514 ;;
  }

  dimension: ibe8523 {
    type: string
    sql: ${TABLE}.IBE8523 ;;
  }

  dimension: ibe8531 {
    type: string
    sql: ${TABLE}.IBE8531 ;;
  }

  dimension: ibe8555 {
    type: string
    sql: ${TABLE}.IBE8555 ;;
  }

  dimension: ibe8556 {
    type: string
    sql: ${TABLE}.IBE8556 ;;
  }

  dimension: ibe8558 {
    type: string
    sql: ${TABLE}.IBE8558 ;;
  }

  dimension: ibe8559 {
    type: string
    sql: ${TABLE}.IBE8559 ;;
  }

  dimension: ibe8560 {
    type: string
    sql: ${TABLE}.IBE8560 ;;
  }

  dimension: ibe8562_01 {
    type: string
    sql: ${TABLE}.IBE8562_01 ;;
  }

  dimension: ibe8562_02 {
    type: string
    sql: ${TABLE}.IBE8562_02 ;;
  }

  dimension: ibe8563_01 {
    type: string
    sql: ${TABLE}.IBE8563_01 ;;
  }

  dimension: ibe8563_02 {
    type: string
    sql: ${TABLE}.IBE8563_02 ;;
  }

  dimension: ibe8564 {
    type: string
    sql: ${TABLE}.IBE8564 ;;
  }

  dimension: ibe8565 {
    type: string
    sql: ${TABLE}.IBE8565 ;;
  }

  dimension: ibe8566 {
    type: string
    sql: ${TABLE}.IBE8566 ;;
  }

  dimension: ibe8570 {
    type: string
    sql: ${TABLE}.IBE8570 ;;
  }

  dimension: ibe8571 {
    type: string
    sql: ${TABLE}.IBE8571 ;;
  }

  dimension: ibe8572 {
    type: string
    sql: ${TABLE}.IBE8572 ;;
  }

  dimension: ibe8573 {
    type: string
    sql: ${TABLE}.IBE8573 ;;
  }

  dimension: ibe8574 {
    type: string
    sql: ${TABLE}.IBE8574 ;;
  }

  dimension: ibe8575 {
    type: string
    sql: ${TABLE}.IBE8575 ;;
  }

  dimension: ibe8576 {
    type: string
    sql: ${TABLE}.IBE8576 ;;
  }

  dimension: ibe8578 {
    type: string
    sql: ${TABLE}.IBE8578 ;;
  }

  dimension: ibe8579 {
    type: string
    sql: ${TABLE}.IBE8579 ;;
  }

  dimension: ibe8580 {
    type: string
    sql: ${TABLE}.IBE8580 ;;
  }

  dimension: ibe8581 {
    type: string
    sql: ${TABLE}.IBE8581 ;;
  }

  dimension: ibe8582 {
    type: string
    sql: ${TABLE}.IBE8582 ;;
  }

  dimension: ibe8587 {
    type: string
    sql: ${TABLE}.IBE8587 ;;
  }

  dimension: ibe8588 {
    type: string
    sql: ${TABLE}.IBE8588 ;;
  }

  dimension: ibe8589 {
    type: string
    sql: ${TABLE}.IBE8589 ;;
  }

  dimension: ibe8590_01 {
    type: string
    sql: ${TABLE}.IBE8590_01 ;;
  }

  dimension: ibe8590_02 {
    type: string
    sql: ${TABLE}.IBE8590_02 ;;
  }

  dimension: ibe8591 {
    type: string
    sql: ${TABLE}.IBE8591 ;;
  }

  dimension: ibe8592 {
    type: string
    sql: ${TABLE}.IBE8592 ;;
  }

  dimension: ibe8594 {
    type: string
    sql: ${TABLE}.IBE8594 ;;
  }

  dimension: ibe8597 {
    type: string
    sql: ${TABLE}.IBE8597 ;;
  }

  dimension: ibe8600_01 {
    type: string
    sql: ${TABLE}.IBE8600_01 ;;
  }

  dimension: ibe8600_02 {
    type: string
    sql: ${TABLE}.IBE8600_02 ;;
  }

  dimension: ibe8600_03 {
    type: string
    sql: ${TABLE}.IBE8600_03 ;;
  }

  dimension: ibe8600_04 {
    type: string
    sql: ${TABLE}.IBE8600_04 ;;
  }

  dimension: ibe8600_05 {
    type: string
    sql: ${TABLE}.IBE8600_05 ;;
  }

  dimension: ibe8600_06 {
    type: string
    sql: ${TABLE}.IBE8600_06 ;;
  }

  dimension: ibe8600_07 {
    type: string
    sql: ${TABLE}.IBE8600_07 ;;
  }

  dimension: ibe8600_08 {
    type: string
    sql: ${TABLE}.IBE8600_08 ;;
  }

  dimension: ibe8600_09 {
    type: string
    sql: ${TABLE}.IBE8600_09 ;;
  }

  dimension: ibe8600_10 {
    type: string
    sql: ${TABLE}.IBE8600_10 ;;
  }

  dimension: ibe8600_11 {
    type: string
    sql: ${TABLE}.IBE8600_11 ;;
  }

  dimension: ibe8600_12 {
    type: string
    sql: ${TABLE}.IBE8600_12 ;;
  }

  dimension: ibe8600_13 {
    type: string
    sql: ${TABLE}.IBE8600_13 ;;
  }

  dimension: ibe8600_14 {
    type: string
    sql: ${TABLE}.IBE8600_14 ;;
  }

  dimension: ibe8600_15 {
    type: string
    sql: ${TABLE}.IBE8600_15 ;;
  }

  dimension: ibe8600_16 {
    type: string
    sql: ${TABLE}.IBE8600_16 ;;
  }

  dimension: ibe8600_17 {
    type: string
    sql: ${TABLE}.IBE8600_17 ;;
  }

  dimension: ibe8600_18 {
    type: string
    sql: ${TABLE}.IBE8600_18 ;;
  }

  dimension: ibe8600_19 {
    type: string
    sql: ${TABLE}.IBE8600_19 ;;
  }

  dimension: ibe8600_20 {
    type: string
    sql: ${TABLE}.IBE8600_20 ;;
  }

  dimension: ibe8600_21 {
    type: string
    sql: ${TABLE}.IBE8600_21 ;;
  }

  dimension: ibe8601_01 {
    type: string
    sql: ${TABLE}.IBE8601_01 ;;
  }

  dimension: ibe8601_02 {
    type: string
    sql: ${TABLE}.IBE8601_02 ;;
  }

  dimension: ibe8601_03 {
    type: string
    sql: ${TABLE}.IBE8601_03 ;;
  }

  dimension: ibe8601_04 {
    type: string
    sql: ${TABLE}.IBE8601_04 ;;
  }

  dimension: ibe8601_05 {
    type: string
    sql: ${TABLE}.IBE8601_05 ;;
  }

  dimension: ibe8601_06 {
    type: string
    sql: ${TABLE}.IBE8601_06 ;;
  }

  dimension: ibe8601_07 {
    type: string
    sql: ${TABLE}.IBE8601_07 ;;
  }

  dimension: ibe8601_08 {
    type: string
    sql: ${TABLE}.IBE8601_08 ;;
  }

  dimension: ibe8601_09 {
    type: string
    sql: ${TABLE}.IBE8601_09 ;;
  }

  dimension: ibe8601_10 {
    type: string
    sql: ${TABLE}.IBE8601_10 ;;
  }

  dimension: ibe8601_11 {
    type: string
    sql: ${TABLE}.IBE8601_11 ;;
  }

  dimension: ibe8601_12 {
    type: string
    sql: ${TABLE}.IBE8601_12 ;;
  }

  dimension: ibe8601_13 {
    type: string
    sql: ${TABLE}.IBE8601_13 ;;
  }

  dimension: ibe8601_14 {
    type: string
    sql: ${TABLE}.IBE8601_14 ;;
  }

  dimension: ibe8601_15 {
    type: string
    sql: ${TABLE}.IBE8601_15 ;;
  }

  dimension: ibe8602 {
    type: string
    sql: ${TABLE}.IBE8602 ;;
  }

  dimension: ibe8603_01 {
    type: string
    sql: ${TABLE}.IBE8603_01 ;;
  }

  dimension: ibe8603_02 {
    type: string
    sql: ${TABLE}.IBE8603_02 ;;
  }

  dimension: ibe8603_03 {
    type: string
    sql: ${TABLE}.IBE8603_03 ;;
  }

  dimension: ibe8603_04 {
    type: string
    sql: ${TABLE}.IBE8603_04 ;;
  }

  dimension: ibe8603_05 {
    type: string
    sql: ${TABLE}.IBE8603_05 ;;
  }

  dimension: ibe8603_06 {
    type: string
    sql: ${TABLE}.IBE8603_06 ;;
  }

  dimension: ibe8603_07 {
    type: string
    sql: ${TABLE}.IBE8603_07 ;;
  }

  dimension: ibe8603_08 {
    type: string
    sql: ${TABLE}.IBE8603_08 ;;
  }

  dimension: ibe8603_09 {
    type: string
    sql: ${TABLE}.IBE8603_09 ;;
  }

  dimension: ibe8603_10 {
    type: string
    sql: ${TABLE}.IBE8603_10 ;;
  }

  dimension: ibe8603_11 {
    type: string
    sql: ${TABLE}.IBE8603_11 ;;
  }

  dimension: ibe8603_12 {
    type: string
    sql: ${TABLE}.IBE8603_12 ;;
  }

  dimension: ibe8603_13 {
    type: string
    sql: ${TABLE}.IBE8603_13 ;;
  }

  dimension: ibe8603_14 {
    type: string
    sql: ${TABLE}.IBE8603_14 ;;
  }

  dimension: ibe8603_15 {
    type: string
    sql: ${TABLE}.IBE8603_15 ;;
  }

  dimension: ibe8603_16 {
    type: string
    sql: ${TABLE}.IBE8603_16 ;;
  }

  dimension: ibe8603_17 {
    type: string
    sql: ${TABLE}.IBE8603_17 ;;
  }

  dimension: ibe8603_18 {
    type: string
    sql: ${TABLE}.IBE8603_18 ;;
  }

  dimension: ibe8603_19 {
    type: string
    sql: ${TABLE}.IBE8603_19 ;;
  }

  dimension: ibe8604 {
    type: string
    sql: ${TABLE}.IBE8604 ;;
  }

  dimension: ibe8605 {
    type: string
    sql: ${TABLE}.IBE8605 ;;
  }

  dimension: ibe8606 {
    type: string
    sql: ${TABLE}.IBE8606 ;;
  }

  dimension: ibe8607 {
    type: string
    sql: ${TABLE}.IBE8607 ;;
  }

  dimension: ibe8608 {
    type: string
    sql: ${TABLE}.IBE8608 ;;
  }

  dimension: ibe8609 {
    type: string
    sql: ${TABLE}.IBE8609 ;;
  }

  dimension: ibe8614 {
    type: string
    sql: ${TABLE}.IBE8614 ;;
  }

  dimension: ibe8615 {
    type: string
    sql: ${TABLE}.IBE8615 ;;
  }

  dimension: ibe8616 {
    type: string
    sql: ${TABLE}.IBE8616 ;;
  }

  dimension: ibe8617 {
    type: string
    sql: ${TABLE}.IBE8617 ;;
  }

  dimension: ibe8619 {
    type: string
    sql: ${TABLE}.IBE8619 ;;
  }

  dimension: ibe8620 {
    type: string
    sql: ${TABLE}.IBE8620 ;;
  }

  dimension: ibe8621_01 {
    type: string
    sql: ${TABLE}.IBE8621_01 ;;
  }

  dimension: ibe8621_02 {
    type: string
    sql: ${TABLE}.IBE8621_02 ;;
  }

  dimension: ibe8621_03 {
    type: string
    sql: ${TABLE}.IBE8621_03 ;;
  }

  dimension: ibe8621_04 {
    type: string
    sql: ${TABLE}.IBE8621_04 ;;
  }

  dimension: ibe8621_05 {
    type: string
    sql: ${TABLE}.IBE8621_05 ;;
  }

  dimension: ibe8621_06 {
    type: string
    sql: ${TABLE}.IBE8621_06 ;;
  }

  dimension: ibe8622 {
    type: string
    sql: ${TABLE}.IBE8622 ;;
  }

  dimension: ibe8625 {
    type: string
    sql: ${TABLE}.IBE8625 ;;
  }

  dimension: ibe8626 {
    type: string
    sql: ${TABLE}.IBE8626 ;;
  }

  dimension: ibe8628 {
    type: string
    sql: ${TABLE}.IBE8628 ;;
  }

  dimension: ibe8629 {
    type: string
    sql: ${TABLE}.IBE8629 ;;
  }

  dimension: ibe8630 {
    type: string
    sql: ${TABLE}.IBE8630 ;;
  }

  dimension: ibe8637 {
    type: string
    sql: ${TABLE}.IBE8637 ;;
  }

  dimension: ibe8642 {
    type: string
    sql: ${TABLE}.IBE8642 ;;
  }

  dimension: ibe8643 {
    type: string
    sql: ${TABLE}.IBE8643 ;;
  }

  dimension: ibe8644 {
    type: string
    sql: ${TABLE}.IBE8644 ;;
  }

  dimension: ibe8645 {
    type: string
    sql: ${TABLE}.IBE8645 ;;
  }

  dimension: ibe8646 {
    type: string
    sql: ${TABLE}.IBE8646 ;;
  }

  dimension: ibe8647 {
    type: string
    sql: ${TABLE}.IBE8647 ;;
  }

  dimension: ibe8652 {
    type: string
    sql: ${TABLE}.IBE8652 ;;
  }

  dimension: ibe8653 {
    type: string
    sql: ${TABLE}.IBE8653 ;;
  }

  dimension: ibe8667 {
    type: string
    sql: ${TABLE}.IBE8667 ;;
  }

  dimension: ibe8668 {
    type: string
    sql: ${TABLE}.IBE8668 ;;
  }

  dimension: ibe8669 {
    type: string
    sql: ${TABLE}.IBE8669 ;;
  }

  dimension: ibe8680 {
    type: string
    sql: ${TABLE}.IBE8680 ;;
  }

  dimension: ibe8682 {
    type: string
    sql: ${TABLE}.IBE8682 ;;
  }

  dimension: ibe8686 {
    type: string
    sql: ${TABLE}.IBE8686 ;;
  }

  dimension: ibe8688 {
    type: string
    sql: ${TABLE}.IBE8688 ;;
  }

  dimension: ibe8690 {
    type: string
    sql: ${TABLE}.IBE8690 ;;
  }

  dimension: ibe8692 {
    type: string
    sql: ${TABLE}.IBE8692 ;;
  }

  dimension: ibe8693 {
    type: string
    sql: ${TABLE}.IBE8693 ;;
  }

  dimension: ibe8701 {
    type: string
    sql: ${TABLE}.IBE8701 ;;
  }

  dimension: ibe8702 {
    type: string
    sql: ${TABLE}.IBE8702 ;;
  }

  dimension: ibe8703 {
    type: string
    sql: ${TABLE}.IBE8703 ;;
  }

  dimension: ibe8704 {
    type: string
    sql: ${TABLE}.IBE8704 ;;
  }

  dimension: ibe8705 {
    type: string
    sql: ${TABLE}.IBE8705 ;;
  }

  dimension: ibe8706 {
    type: string
    sql: ${TABLE}.IBE8706 ;;
  }

  dimension: ibe8707 {
    type: string
    sql: ${TABLE}.IBE8707 ;;
  }

  dimension: ibe8708 {
    type: string
    sql: ${TABLE}.IBE8708 ;;
  }

  dimension: ibe8713 {
    type: string
    sql: ${TABLE}.IBE8713 ;;
  }

  dimension: ibe8717 {
    type: string
    sql: ${TABLE}.IBE8717 ;;
  }

  dimension: ibe8718 {
    type: string
    sql: ${TABLE}.IBE8718 ;;
  }

  dimension: ibe8727 {
    type: string
    sql: ${TABLE}.IBE8727 ;;
  }

  dimension: ibe8728 {
    type: string
    sql: ${TABLE}.IBE8728 ;;
  }

  dimension: ibe8729 {
    type: string
    sql: ${TABLE}.IBE8729 ;;
  }

  dimension: ibe8747 {
    type: string
    sql: ${TABLE}.IBE8747 ;;
  }

  dimension: ibe8748 {
    type: string
    sql: ${TABLE}.IBE8748 ;;
  }

  dimension: ibe8749 {
    type: string
    sql: ${TABLE}.IBE8749 ;;
  }

  dimension: ibe8763 {
    type: string
    sql: ${TABLE}.IBE8763 ;;
  }

  dimension: ibe8808 {
    type: string
    sql: ${TABLE}.IBE8808 ;;
  }

  dimension: ibe8815 {
    type: string
    sql: ${TABLE}.IBE8815 ;;
  }

  dimension: ibe8819_01 {
    type: string
    sql: ${TABLE}.IBE8819_01 ;;
  }

  dimension: ibe8819_02 {
    type: string
    sql: ${TABLE}.IBE8819_02 ;;
  }

  dimension: ibe8839_01 {
    type: string
    sql: ${TABLE}.IBE8839_01 ;;
  }

  dimension: ibe8839_02 {
    type: string
    sql: ${TABLE}.IBE8839_02 ;;
  }

  dimension: ibe8840 {
    type: string
    sql: ${TABLE}.IBE8840 ;;
  }

  dimension: ibe8841 {
    type: string
    sql: ${TABLE}.IBE8841 ;;
  }

  dimension: ibe8842 {
    type: string
    sql: ${TABLE}.IBE8842 ;;
  }

  dimension: ibe8847 {
    type: string
    sql: ${TABLE}.IBE8847 ;;
  }

  dimension: ibe8848 {
    type: string
    sql: ${TABLE}.IBE8848 ;;
  }

  dimension: ibe8850 {
    type: string
    sql: ${TABLE}.IBE8850 ;;
  }

  # dimension: ibe9040 {
  #   type: string
  #   sql: ${TABLE}.IBE9040 ;;
  # }

  # dimension: ibe9041 {
  #   type: string
  #   sql: ${TABLE}.IBE9041 ;;
  # }

  # dimension: ibe9042 {
  #   type: string
  #   sql: ${TABLE}.IBE9042 ;;
  # }

  # dimension: ibe9043 {
  #   type: string
  #   sql: ${TABLE}.IBE9043 ;;
  # }

  # dimension: ibe9044 {
  #   type: string
  #   sql: ${TABLE}.IBE9044 ;;
  # }

  # dimension: ibe9047 {
  #   type: string
  #   sql: ${TABLE}.IBE9047 ;;
  # }

  # dimension: ibe9050 {
  #   type: string
  #   sql: ${TABLE}.IBE9050 ;;
  # }

  # dimension: ibe9051 {
  #   type: string
  #   sql: ${TABLE}.IBE9051 ;;
  # }

  # dimension: ibe9052 {
  #   type: string
  #   sql: ${TABLE}.IBE9052 ;;
  # }

  # dimension: ibe9053 {
  #   type: string
  #   sql: ${TABLE}.IBE9053 ;;
  # }

  # dimension: ibe9054 {
  #   type: string
  #   sql: ${TABLE}.IBE9054 ;;
  # }

  # dimension: ibe9057 {
  #   type: string
  #   sql: ${TABLE}.IBE9057 ;;
  # }

  # dimension: ibe9100 {
  #   type: string
  #   sql: ${TABLE}.IBE9100 ;;
  # }

  # dimension: ibe9150_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_01 ;;
  # }

  # dimension: ibe9150_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_02 ;;
  # }

  # dimension: ibe9150_03 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_03 ;;
  # }

  # dimension: ibe9150_04 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_04 ;;
  # }

  # dimension: ibe9150_05 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_05 ;;
  # }

  # dimension: ibe9150_06 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_06 ;;
  # }

  # dimension: ibe9150_07 {
  #   type: string
  #   sql: ${TABLE}.IBE9150_07 ;;
  # }

  # dimension: ibe9152 {
  #   type: string
  #   sql: ${TABLE}.IBE9152 ;;
  # }

  # dimension: ibe9153_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_01 ;;
  # }

  # dimension: ibe9153_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_02 ;;
  # }

  # dimension: ibe9153_03 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_03 ;;
  # }

  # dimension: ibe9153_04 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_04 ;;
  # }

  # dimension: ibe9153_05 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_05 ;;
  # }

  # dimension: ibe9153_06 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_06 ;;
  # }

  # dimension: ibe9153_07 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_07 ;;
  # }

  # dimension: ibe9153_08 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_08 ;;
  # }

  # dimension: ibe9153_09 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_09 ;;
  # }

  # dimension: ibe9153_10 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_10 ;;
  # }

  # dimension: ibe9153_11 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_11 ;;
  # }

  # dimension: ibe9153_12 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_12 ;;
  # }

  # dimension: ibe9153_13 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_13 ;;
  # }

  # dimension: ibe9153_14 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_14 ;;
  # }

  # dimension: ibe9153_15 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_15 ;;
  # }

  # dimension: ibe9153_16 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_16 ;;
  # }

  # dimension: ibe9153_17 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_17 ;;
  # }

  # dimension: ibe9153_18 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_18 ;;
  # }

  # dimension: ibe9153_19 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_19 ;;
  # }

  # dimension: ibe9153_20 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_20 ;;
  # }

  # dimension: ibe9153_21 {
  #   type: string
  #   sql: ${TABLE}.IBE9153_21 ;;
  # }

  # dimension: ibe9154 {
  #   type: string
  #   sql: ${TABLE}.IBE9154 ;;
  # }

  # dimension: ibe9156_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9156_01 ;;
  # }

  # dimension: ibe9156_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9156_02 ;;
  # }

  # dimension: ibe9157_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9157_01 ;;
  # }

  # dimension: ibe9157_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9157_02 ;;
  # }

  # dimension: ibe9158_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9158_01 ;;
  # }

  # dimension: ibe9158_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9158_02 ;;
  # }

  # dimension: ibe9159_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9159_01 ;;
  # }

  # dimension: ibe9159_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9159_02 ;;
  # }

  # dimension: ibe9160_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9160_01 ;;
  # }

  # dimension: ibe9160_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9160_02 ;;
  # }

  # dimension: ibe9180 {
  #   type: string
  #   sql: ${TABLE}.IBE9180 ;;
  # }

  # dimension: ibe9181 {
  #   type: string
  #   sql: ${TABLE}.IBE9181 ;;
  # }

  # dimension: ibe9358 {
  #   type: string
  #   sql: ${TABLE}.IBE9358 ;;
  # }

  # dimension: ibe9509 {
  #   type: string
  #   sql: ${TABLE}.IBE9509 ;;
  # }

  # dimension: ibe9510 {
  #   type: string
  #   sql: ${TABLE}.IBE9510 ;;
  # }

  # dimension: ibe9511 {
  #   type: string
  #   sql: ${TABLE}.IBE9511 ;;
  # }

  # dimension: ibe9512 {
  #   type: string
  #   sql: ${TABLE}.IBE9512 ;;
  # }

  # dimension: ibe9513 {
  #   type: string
  #   sql: ${TABLE}.IBE9513 ;;
  # }

  # dimension: ibe9514 {
  #   type: string
  #   sql: ${TABLE}.IBE9514 ;;
  # }

  # dimension: ibe9515 {
  #   type: string
  #   sql: ${TABLE}.IBE9515 ;;
  # }

  # dimension: ibe9516 {
  #   type: string
  #   sql: ${TABLE}.IBE9516 ;;
  # }

  # dimension: ibe9517 {
  #   type: string
  #   sql: ${TABLE}.IBE9517 ;;
  # }

  # dimension: ibe9518 {
  #   type: string
  #   sql: ${TABLE}.IBE9518 ;;
  # }

  # dimension: ibe9519 {
  #   type: string
  #   sql: ${TABLE}.IBE9519 ;;
  # }

  # dimension: ibe9528 {
  #   type: string
  #   sql: ${TABLE}.IBE9528 ;;
  # }

  # dimension: ibe9529 {
  #   type: string
  #   sql: ${TABLE}.IBE9529 ;;
  # }

  # dimension: ibe9530 {
  #   type: string
  #   sql: ${TABLE}.IBE9530 ;;
  # }

  # dimension: ibe9531 {
  #   type: string
  #   sql: ${TABLE}.IBE9531 ;;
  # }

  # dimension: ibe9532 {
  #   type: string
  #   sql: ${TABLE}.IBE9532 ;;
  # }

  # dimension: ibe9533 {
  #   type: string
  #   sql: ${TABLE}.IBE9533 ;;
  # }

  # dimension: ibe9557 {
  #   type: string
  #   sql: ${TABLE}.IBE9557 ;;
  # }

  # dimension: ibe9567 {
  #   type: string
  #   sql: ${TABLE}.IBE9567 ;;
  # }

  # dimension: ibe9568 {
  #   type: string
  #   sql: ${TABLE}.IBE9568 ;;
  # }

  # dimension: ibe9569 {
  #   type: string
  #   sql: ${TABLE}.IBE9569 ;;
  # }

  # dimension: ibe9587 {
  #   type: string
  #   sql: ${TABLE}.IBE9587 ;;
  # }

  # dimension: ibe9588_01 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_01 ;;
  # }

  # dimension: ibe9588_02 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_02 ;;
  # }

  # dimension: ibe9588_03 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_03 ;;
  # }

  # dimension: ibe9588_04 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_04 ;;
  # }

  # dimension: ibe9588_05 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_05 ;;
  # }

  # dimension: ibe9588_06 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_06 ;;
  # }

  # dimension: ibe9588_07 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_07 ;;
  # }

  # dimension: ibe9588_08 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_08 ;;
  # }

  # dimension: ibe9588_09 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_09 ;;
  # }

  # dimension: ibe9588_10 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_10 ;;
  # }

  # dimension: ibe9588_11 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_11 ;;
  # }

  # dimension: ibe9588_12 {
  #   type: string
  #   sql: ${TABLE}.IBE9588_12 ;;
  # }

  # dimension: ibe9750 {
  #   type: string
  #   sql: ${TABLE}.IBE9750 ;;
  # }

  # dimension: ibe9751 {
  #   type: string
  #   sql: ${TABLE}.IBE9751 ;;
  # }

  # dimension: ibe9752 {
  #   type: string
  #   sql: ${TABLE}.IBE9752 ;;
  # }

  # dimension: ibe9780 {
  #   type: string
  #   sql: ${TABLE}.IBE9780 ;;
  # }

  # dimension: lat_rounded {
  #   type: number
  #   sql: ${TABLE}.lat_rounded ;;
  # }

  # dimension: lon_rounded {
  #   type: number
  #   sql: ${TABLE}.lon_rounded ;;
  # }

  # dimension: px001270_01 {
  #   type: string
  #   sql: ${TABLE}.PX001270_01 ;;
  # }

  # dimension: px001270_02 {
  #   type: string
  #   sql: ${TABLE}.PX001270_02 ;;
  # }

  # dimension: px001271_01 {
  #   type: string
  #   sql: ${TABLE}.PX001271_01 ;;
  # }

  # dimension: px001271_02 {
  #   type: string
  #   sql: ${TABLE}.PX001271_02 ;;
  # }

  # dimension: px001274_01 {
  #   type: string
  #   sql: ${TABLE}.PX001274_01 ;;
  # }

  # dimension: px001274_02 {
  #   type: string
  #   sql: ${TABLE}.PX001274_02 ;;
  # }


  # dimension: use_code_3048 {
  #   type: string
  #   sql: ${TABLE}.USE_CODE_3048 ;;
  # }

  dimension: zip4_code_3044 {
    type: string
    sql: ${TABLE}.ZIP4_CODE_3044 ;;
  }

  dimension: zip_code_3043 {
    type: string
    sql: ${TABLE}.ZIP_CODE_3043 ;;
  }

}
