
type identifier = string
type module_ident = identifier
type dir_path = module_ident list

type label = identifier
type uniq_ident = int * identifier * dir_path
type mod_bound_id = uniq_ident
type module_path =
  | MPfile of dir_path
  | MPbound of mod_bound_id
  | MPdot of module_path * label

type dyn_t = string * Obj.t
type libobject_obj = dyn_t
type lib_objects = (identifier * Libobject.obj) list
type library_objects =
    module_path * lib_objects * lib_objects

type compilation_unit_name = dir_path

type compiled_library =
    dir_path * module_body * library_info list * engagement option

type lightened_compiled_library = compiled_library

type library_disk = {
  md_name : compilation_unit_name;
  md_compiled : lightened_compiled_library;
  md_objects : library_objects;
  md_deps : (compilation_unit_name * Digest.t) list;
  md_imports : compilation_unit_name list }
