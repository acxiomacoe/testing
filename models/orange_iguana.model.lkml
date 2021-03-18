connection: "gcp_dsdv_orange_iguana"

# include all the views
include: "/views/**/*.view"
include: "/views/orange_iguana_POC202001_1.view.lkml"
include: "/views/tall_nested/ib_hybrid_phu_test1.lkml"



datagroup: orange_iguana_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "72 hours"
  sql_trigger: SELECT max(consumer_link_sha256) FROM `orange-iguana.prod.ib_hybrid_POC202001_4` ;;
  label: "Consumerlink changed"
  description: "Refresh aggregate tables when consumerlink changes"
}

persist_with: orange_iguana_default_datagroup

# explore: zbr_ib_raw_prod_sample {}


#explore: ib_transforms_bigsamp {}

# explore: ib_hybrid_phu_test1 {
#   join: ibe_interests {
#     sql: left join unnest(${ib_hybrid_phu_test1.ibe_interests}) ;;
#     relationship: one_to_many
#   }
# }

# map_layer: dma {
#   file: "/dma_master_polygons_2_1.json"
#   format: topojson
#   property_key: "DMA_CODE_3010_geo_dma"
#   # feature_key: "Polygon"
# }
# # DMA_CODE_3010_geo_dma
# # Designated Marketing Area (DMA)

map_layer: dma {
  file: "/dma_master_polygons_2_1.json"
  property_key: "dma_master_polygons_2_1"
}



# Place in `orange_iguana` model
explore: +ib_hybrid_phu_test1 {
  aggregate_table: rollup__age_kpi {
    query: {
      dimensions: [age_kpi,ib_hybrid_phu_test1.target_flg]
      measures: [target_count]
      filters: [
        ib_hybrid_phu_test1.age_kpi: "-Missing"
      ]
    }

    materialization: {
      datagroup_trigger: orange_iguana_default_datagroup
    }
  }
}
# Place in `orange_iguana` model
explore: +ib_hybrid_phu_test1 {
  aggregate_table: rollup__cib8688_gender {
    query: {
      dimensions: [cib8688_gender,ib_hybrid_phu_test1.target_flg]
      measures: [index, percent_of_total_target]
      filters: [
        ib_hybrid_phu_test1.cib8688_gender: "-Missing"
      ]
    }

    materialization: {
      datagroup_trigger: orange_iguana_default_datagroup
    }
  }
}




# explore: ib_hybrid_bigsamp {
#   # Repeated nested object
#   join: ibe_elements {
#     view_label: "InfoBase Elements (Tall)"
#     sql: ,UNNEST(${ib_hybrid_bigsamp.ibe_elements}) as ibe_elements ;;
#     relationship: one_to_many
#   }

#   join: ibe_interests {
#     view_label: "InfoBase Interests (Tall)"
#     sql: ,UNNEST(${ib_hybrid_bigsamp.ibe_interests}) as ibe_interests ;;
#     relationship: one_to_many
#   }
# }




# explore: ap_1 {}

# explore: ap_2 {}

# explore: ap_3 {}

# explore: ap_4 {}

# explore: for_structs_teesting {}

# explore: infobase_data_dictionary {}

# explore: test_ib_raw_ids {}

# explore: zbr_ib_raw_iad_oct_1aa_sample {}

# explore: zbr_tall_nest {
#   join: zbr_tall_nest__ibe {
#     view_label: "Zbr Tall Nest: Ibe"
#     sql: LEFT JOIN UNNEST(${zbr_tall_nest.ibe}) as zbr_tall_nest__ibe ;;
#     relationship: one_to_many
#   }

#   join: zbr_tall_nest__ap {
#     view_label: "Zbr Tall Nest: Ap"
#     sql: LEFT JOIN UNNEST(${zbr_tall_nest.ap}) as zbr_tall_nest__ap ;;
#     relationship: one_to_many
#   }
# }
