male_organs <- c(
  "cerebral_cortex", "pleura", "brain", "heart", "breast", "thyroid_gland",
  "adrenal_gland", "lymph_node", "bone_marrow", "adipose_tissue",
  "skeletal_muscle", "leukocyte", "frontal_cortex", "temporal_lobe",
  "prefrontal_cortex", "pituitary_gland", "atrial_appendage", "aorta",
  "coronary_artery", "gastroesophageal_junction", "left_ventricle",
  "caecum", "ileum", "rectum", "nose", "tongue", "left_atrium",
  "pulmonary_valve", "mitral_valve", "penis", "vas_deferens",
  "seminal_vesicle", "testis", "epididymis", "eye", "nasal_septum",
  "oral_cavity", "tonsil", "nasal_pharynx", "lung", "spinal_cord",
  "amygdala", "trachea", "throat", "bronchus", "tricuspid_valve",
  "diaphragm", "liver", "stomach", "spleen", "duodenum", "gall_bladder",
  "pancreas", "colon", "small_intestine", "appendix", "smooth_muscle",
  "bladder", "prostate_gland", "nerve", "cerebellum", "cerebellar_hemisphere",
  "kidney", "renal_cortex", "bone", "cartilage", "esophagus", "salivary_gland",
  "parotid_gland", "submandibular_gland", "skin"
)
female_organs <- c(
  "parotid_gland", "adipose_tissue", "heart",  "smooth_muscle", "brain",
  "breast", "adrenal_gland", "pancreas", "liver", "colon", "lymph_node",
  "bone_marrow",  "skeletal_muscle", "ovary",  "bladder", "stomach",
  "duodenum", "esophagus", "gall_bladder", "spleen", "small_intestine",
  "placenta", "salivary_gland",  "endometrium", "fallopian_tube", "uterus",
  "uterine_cervix", "vagina", "aorta",  "nerve", "pituitary_gland",
  "atrial_appendage", "ectocervix", "gastroesophageal_junction", "caecum",
  "appendix", "ileum", "left_atrium", "left_ventricle", "pulmonary_valve",
  "mitral_valve", "diaphragm", "pleura", "bone", "cartilage", "bronchus",
  "trachea", "lung", "spinal_cord",  "throat",  "rectum",  "nasal_septum",
  "nasal_pharynx", "oral_cavity", "tongue",  "tonsil", "eye", "cerebellum",
  "cerebellar_hemisphere", "prefrontal_cortex", "frontal_cortex", "nose",
  "temporal_lobe", "cerebral_cortex", "amygdala", "kidney", "renal_cortex",
  "coronary_artery", "submandibular_gland", "tricuspid_valve", "thyroid_gland",
  "skin"
)
shinybody_organs <- list(male = male_organs, female = female_organs)
usethis::use_data(shinybody_organs, overwrite = TRUE)
