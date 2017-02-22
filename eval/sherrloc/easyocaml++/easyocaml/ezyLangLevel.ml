include EzyFeatures

let configure features modules objs = EzyDynload.LangLevel.config_result := Some (features, modules, objs)

