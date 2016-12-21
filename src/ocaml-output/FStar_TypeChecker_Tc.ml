
open Prims

let set_hint_correlator : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt  ->  FStar_TypeChecker_Env.env = (fun env se -> (match ((FStar_Options.reuse_hint_for ())) with
| Some (l) -> begin
(

let lid = (let _158_5 = (FStar_TypeChecker_Env.current_module env)
in (FStar_Ident.lid_add_suffix _158_5 l))
in (

let _60_17 = env
in {FStar_TypeChecker_Env.solver = _60_17.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_17.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_17.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_17.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_17.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_17.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_17.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_17.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_17.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_17.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_17.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_17.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_17.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_17.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_17.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_17.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_17.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_17.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = _60_17.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = _60_17.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_17.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_17.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_17.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = Some (((lid), ((Prims.parse_int "0"))))}))
end
| None -> begin
(

let lids = (FStar_Syntax_Util.lids_of_sigelt se)
in (

let lid = (match (lids) with
| [] -> begin
(let _158_8 = (FStar_TypeChecker_Env.current_module env)
in (let _158_7 = (let _158_6 = (FStar_Syntax_Syntax.next_id ())
in (FStar_All.pipe_right _158_6 FStar_Util.string_of_int))
in (FStar_Ident.lid_add_suffix _158_8 _158_7)))
end
| (l)::_60_23 -> begin
l
end)
in (

let _60_27 = env
in {FStar_TypeChecker_Env.solver = _60_27.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_27.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_27.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_27.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_27.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_27.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_27.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_27.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_27.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_27.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_27.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_27.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_27.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_27.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_27.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_27.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_27.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_27.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = _60_27.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = _60_27.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_27.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_27.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_27.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = Some (((lid), ((Prims.parse_int "0"))))})))
end))


let log : FStar_TypeChecker_Env.env  ->  Prims.bool = (fun env -> ((FStar_Options.log_types ()) && (not ((let _158_11 = (FStar_TypeChecker_Env.current_module env)
in (FStar_Ident.lid_equals FStar_Syntax_Const.prims_lid _158_11))))))


let tc_check_trivial_guard : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.term = (fun env t k -> (

let _60_36 = (FStar_TypeChecker_TcTerm.tc_check_tot_or_gtot_term env t k)
in (match (_60_36) with
| (t, c, g) -> begin
(

let _60_37 = (FStar_ST.op_Colon_Equals t.FStar_Syntax_Syntax.tk (Some (c.FStar_Syntax_Syntax.res_typ.FStar_Syntax_Syntax.n)))
in (

let _60_39 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in t))
end)))


let recheck_debug : Prims.string  ->  FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.term = (fun s env t -> (

let _60_44 = if (FStar_TypeChecker_Env.debug env (FStar_Options.Other ("ED"))) then begin
(let _158_24 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "Term has been %s-transformed to:\n%s\n----------\n" s _158_24))
end else begin
()
end
in (

let _60_51 = (FStar_TypeChecker_TcTerm.tc_term env t)
in (match (_60_51) with
| (t', _60_48, _60_50) -> begin
(

let _60_52 = if (FStar_TypeChecker_Env.debug env (FStar_Options.Other ("ED"))) then begin
(let _158_25 = (FStar_Syntax_Print.term_to_string t')
in (FStar_Util.print1 "Re-checked; got:\n%s\n----------\n" _158_25))
end else begin
()
end
in t)
end))))


let check_and_gen : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.term  ->  FStar_Syntax_Syntax.typ  ->  FStar_Syntax_Syntax.tscheme = (fun env t k -> (let _158_32 = (tc_check_trivial_guard env t k)
in (FStar_TypeChecker_Util.generalize_universes env _158_32)))


let check_nogen = (fun env t k -> (

let t = (tc_check_trivial_guard env t k)
in (let _158_36 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env t)
in (([]), (_158_36)))))


let tc_tparams : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.binders  ->  (FStar_Syntax_Syntax.binders * FStar_TypeChecker_Env.env * FStar_Syntax_Syntax.universes) = (fun env tps -> (

let _60_67 = (FStar_TypeChecker_TcTerm.tc_binders env tps)
in (match (_60_67) with
| (tps, env, g, us) -> begin
(

let _60_68 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in ((tps), (env), (us)))
end)))


let monad_signature : FStar_TypeChecker_Env.env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.term  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.term) = (fun env m s -> (

let fail = (fun _60_74 -> (match (()) with
| () -> begin
(let _158_51 = (let _158_50 = (let _158_49 = (FStar_TypeChecker_Errors.unexpected_signature_for_monad env m s)
in ((_158_49), ((FStar_Ident.range_of_lid m))))
in FStar_Syntax_Syntax.Error (_158_50))
in (Prims.raise _158_51))
end))
in (

let s = (FStar_Syntax_Subst.compress s)
in (match (s.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let bs = (FStar_Syntax_Subst.open_binders bs)
in (match (bs) with
| ((a, _60_87))::((wp, _60_83))::[] -> begin
((a), (wp.FStar_Syntax_Syntax.sort))
end
| _60_91 -> begin
(fail ())
end))
end
| _60_93 -> begin
(fail ())
end))))


let open_univ_vars : FStar_Syntax_Syntax.univ_names  ->  (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) Prims.list  ->  FStar_Syntax_Syntax.comp  ->  (FStar_Syntax_Syntax.univ_names * (FStar_Syntax_Syntax.bv * FStar_Syntax_Syntax.arg_qualifier Prims.option) Prims.list * FStar_Syntax_Syntax.comp) = (fun uvs binders c -> (match (binders) with
| [] -> begin
(

let _60_100 = (FStar_Syntax_Subst.open_univ_vars_comp uvs c)
in (match (_60_100) with
| (uvs, c) -> begin
((uvs), ([]), (c))
end))
end
| _60_102 -> begin
(

let t' = (FStar_Syntax_Util.arrow binders c)
in (

let _60_106 = (FStar_Syntax_Subst.open_univ_vars uvs t')
in (match (_60_106) with
| (uvs, t') -> begin
(match ((let _158_58 = (FStar_Syntax_Subst.compress t')
in _158_58.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (binders, c) -> begin
((uvs), (binders), (c))
end
| _60_112 -> begin
(FStar_All.failwith "Impossible")
end)
end)))
end))


let rec tc_eff_decl : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.eff_decl  ->  FStar_Syntax_Syntax.eff_decl = (fun env0 ed -> (

let _60_115 = ()
in (

let _60_120 = (FStar_Syntax_Subst.open_term' ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature)
in (match (_60_120) with
| (effect_params_un, signature_un, opening) -> begin
(

let _60_125 = (tc_tparams env0 effect_params_un)
in (match (_60_125) with
| (effect_params, env, _60_124) -> begin
(

let _60_129 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env signature_un)
in (match (_60_129) with
| (signature, _60_128) -> begin
(

let ed = (

let _60_130 = ed
in {FStar_Syntax_Syntax.qualifiers = _60_130.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.cattributes = _60_130.FStar_Syntax_Syntax.cattributes; FStar_Syntax_Syntax.mname = _60_130.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = _60_130.FStar_Syntax_Syntax.univs; FStar_Syntax_Syntax.binders = effect_params; FStar_Syntax_Syntax.signature = signature; FStar_Syntax_Syntax.ret_wp = _60_130.FStar_Syntax_Syntax.ret_wp; FStar_Syntax_Syntax.bind_wp = _60_130.FStar_Syntax_Syntax.bind_wp; FStar_Syntax_Syntax.if_then_else = _60_130.FStar_Syntax_Syntax.if_then_else; FStar_Syntax_Syntax.ite_wp = _60_130.FStar_Syntax_Syntax.ite_wp; FStar_Syntax_Syntax.stronger = _60_130.FStar_Syntax_Syntax.stronger; FStar_Syntax_Syntax.close_wp = _60_130.FStar_Syntax_Syntax.close_wp; FStar_Syntax_Syntax.assert_p = _60_130.FStar_Syntax_Syntax.assert_p; FStar_Syntax_Syntax.assume_p = _60_130.FStar_Syntax_Syntax.assume_p; FStar_Syntax_Syntax.null_wp = _60_130.FStar_Syntax_Syntax.null_wp; FStar_Syntax_Syntax.trivial = _60_130.FStar_Syntax_Syntax.trivial; FStar_Syntax_Syntax.repr = _60_130.FStar_Syntax_Syntax.repr; FStar_Syntax_Syntax.return_repr = _60_130.FStar_Syntax_Syntax.return_repr; FStar_Syntax_Syntax.bind_repr = _60_130.FStar_Syntax_Syntax.bind_repr; FStar_Syntax_Syntax.actions = _60_130.FStar_Syntax_Syntax.actions})
in (

let ed = (match (effect_params) with
| [] -> begin
ed
end
| _60_135 -> begin
(

let op = (fun ts -> (

let _60_138 = ()
in (

let t1 = (FStar_Syntax_Subst.subst opening (Prims.snd ts))
in (([]), (t1)))))
in (

let _60_141 = ed
in (let _158_101 = (op ed.FStar_Syntax_Syntax.ret_wp)
in (let _158_100 = (op ed.FStar_Syntax_Syntax.bind_wp)
in (let _158_99 = (op ed.FStar_Syntax_Syntax.if_then_else)
in (let _158_98 = (op ed.FStar_Syntax_Syntax.ite_wp)
in (let _158_97 = (op ed.FStar_Syntax_Syntax.stronger)
in (let _158_96 = (op ed.FStar_Syntax_Syntax.close_wp)
in (let _158_95 = (op ed.FStar_Syntax_Syntax.assert_p)
in (let _158_94 = (op ed.FStar_Syntax_Syntax.assume_p)
in (let _158_93 = (op ed.FStar_Syntax_Syntax.null_wp)
in (let _158_92 = (op ed.FStar_Syntax_Syntax.trivial)
in (let _158_91 = (let _158_82 = (op (([]), (ed.FStar_Syntax_Syntax.repr)))
in (Prims.snd _158_82))
in (let _158_90 = (op ed.FStar_Syntax_Syntax.return_repr)
in (let _158_89 = (op ed.FStar_Syntax_Syntax.bind_repr)
in (let _158_88 = (FStar_List.map (fun a -> (

let _60_144 = a
in (let _158_87 = (let _158_84 = (op (([]), (a.FStar_Syntax_Syntax.action_defn)))
in (Prims.snd _158_84))
in (let _158_86 = (let _158_85 = (op (([]), (a.FStar_Syntax_Syntax.action_typ)))
in (Prims.snd _158_85))
in {FStar_Syntax_Syntax.action_name = _60_144.FStar_Syntax_Syntax.action_name; FStar_Syntax_Syntax.action_unqualified_name = _60_144.FStar_Syntax_Syntax.action_unqualified_name; FStar_Syntax_Syntax.action_univs = _60_144.FStar_Syntax_Syntax.action_univs; FStar_Syntax_Syntax.action_defn = _158_87; FStar_Syntax_Syntax.action_typ = _158_86})))) ed.FStar_Syntax_Syntax.actions)
in {FStar_Syntax_Syntax.qualifiers = _60_141.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.cattributes = _60_141.FStar_Syntax_Syntax.cattributes; FStar_Syntax_Syntax.mname = _60_141.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = _60_141.FStar_Syntax_Syntax.univs; FStar_Syntax_Syntax.binders = _60_141.FStar_Syntax_Syntax.binders; FStar_Syntax_Syntax.signature = _60_141.FStar_Syntax_Syntax.signature; FStar_Syntax_Syntax.ret_wp = _158_101; FStar_Syntax_Syntax.bind_wp = _158_100; FStar_Syntax_Syntax.if_then_else = _158_99; FStar_Syntax_Syntax.ite_wp = _158_98; FStar_Syntax_Syntax.stronger = _158_97; FStar_Syntax_Syntax.close_wp = _158_96; FStar_Syntax_Syntax.assert_p = _158_95; FStar_Syntax_Syntax.assume_p = _158_94; FStar_Syntax_Syntax.null_wp = _158_93; FStar_Syntax_Syntax.trivial = _158_92; FStar_Syntax_Syntax.repr = _158_91; FStar_Syntax_Syntax.return_repr = _158_90; FStar_Syntax_Syntax.bind_repr = _158_89; FStar_Syntax_Syntax.actions = _158_88}))))))))))))))))
end)
in (

let wp_with_fresh_result_type = (fun env mname signature -> (

let fail = (fun t -> (let _158_112 = (let _158_111 = (let _158_110 = (FStar_TypeChecker_Errors.unexpected_signature_for_monad env mname t)
in ((_158_110), ((FStar_Ident.range_of_lid mname))))
in FStar_Syntax_Syntax.Error (_158_111))
in (Prims.raise _158_112)))
in (match ((let _158_113 = (FStar_Syntax_Subst.compress signature)
in _158_113.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let bs = (FStar_Syntax_Subst.open_binders bs)
in (match (bs) with
| ((a, _60_164))::((wp, _60_160))::[] -> begin
((a), (wp.FStar_Syntax_Syntax.sort))
end
| _60_168 -> begin
(fail signature)
end))
end
| _60_170 -> begin
(fail signature)
end)))
in (

let _60_173 = (wp_with_fresh_result_type env ed.FStar_Syntax_Syntax.mname ed.FStar_Syntax_Syntax.signature)
in (match (_60_173) with
| (a, wp_a) -> begin
(

let fresh_effect_signature = (fun _60_175 -> (match (()) with
| () -> begin
(

let _60_179 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env signature_un)
in (match (_60_179) with
| (signature, _60_178) -> begin
(wp_with_fresh_result_type env ed.FStar_Syntax_Syntax.mname signature)
end))
end))
in (

let env = (let _158_116 = (FStar_Syntax_Syntax.new_bv None ed.FStar_Syntax_Syntax.signature)
in (FStar_TypeChecker_Env.push_bv env _158_116))
in (

let _60_181 = if (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env0) (FStar_Options.Other ("ED"))) then begin
(let _158_122 = (FStar_Syntax_Print.lid_to_string ed.FStar_Syntax_Syntax.mname)
in (let _158_121 = (FStar_Syntax_Print.binders_to_string " " ed.FStar_Syntax_Syntax.binders)
in (let _158_120 = (FStar_Syntax_Print.term_to_string ed.FStar_Syntax_Syntax.signature)
in (let _158_119 = (let _158_117 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Print.term_to_string _158_117))
in (let _158_118 = (FStar_Syntax_Print.term_to_string a.FStar_Syntax_Syntax.sort)
in (FStar_Util.print5 "Checking effect signature: %s %s : %s\n(a is %s:%s)\n" _158_122 _158_121 _158_120 _158_119 _158_118))))))
end else begin
()
end
in (

let check_and_gen' = (fun env _60_188 k -> (match (_60_188) with
| (_60_186, t) -> begin
(check_and_gen env t k)
end))
in (

let return_wp = (

let expected_k = (let _158_134 = (let _158_132 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_131 = (let _158_130 = (let _158_129 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _158_129))
in (_158_130)::[])
in (_158_132)::_158_131))
in (let _158_133 = (FStar_Syntax_Syntax.mk_GTotal wp_a)
in (FStar_Syntax_Util.arrow _158_134 _158_133)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.ret_wp expected_k))
in (

let bind_wp = (

let _60_194 = (fresh_effect_signature ())
in (match (_60_194) with
| (b, wp_b) -> begin
(

let a_wp_b = (let _158_138 = (let _158_136 = (let _158_135 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _158_135))
in (_158_136)::[])
in (let _158_137 = (FStar_Syntax_Syntax.mk_Total wp_b)
in (FStar_Syntax_Util.arrow _158_138 _158_137)))
in (

let expected_k = (let _158_149 = (let _158_147 = (FStar_Syntax_Syntax.null_binder FStar_TypeChecker_Common.t_range)
in (let _158_146 = (let _158_145 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_144 = (let _158_143 = (FStar_Syntax_Syntax.mk_binder b)
in (let _158_142 = (let _158_141 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _158_140 = (let _158_139 = (FStar_Syntax_Syntax.null_binder a_wp_b)
in (_158_139)::[])
in (_158_141)::_158_140))
in (_158_143)::_158_142))
in (_158_145)::_158_144))
in (_158_147)::_158_146))
in (let _158_148 = (FStar_Syntax_Syntax.mk_Total wp_b)
in (FStar_Syntax_Util.arrow _158_149 _158_148)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.bind_wp expected_k)))
end))
in (

let if_then_else = (

let p = (let _158_151 = (let _158_150 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _158_150 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _158_151))
in (

let expected_k = (let _158_160 = (let _158_158 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_157 = (let _158_156 = (FStar_Syntax_Syntax.mk_binder p)
in (let _158_155 = (let _158_154 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _158_153 = (let _158_152 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_152)::[])
in (_158_154)::_158_153))
in (_158_156)::_158_155))
in (_158_158)::_158_157))
in (let _158_159 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_160 _158_159)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.if_then_else expected_k)))
in (

let ite_wp = (

let expected_k = (let _158_165 = (let _158_163 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_162 = (let _158_161 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_161)::[])
in (_158_163)::_158_162))
in (let _158_164 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_165 _158_164)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.ite_wp expected_k))
in (

let stronger = (

let _60_206 = (FStar_Syntax_Util.type_u ())
in (match (_60_206) with
| (t, _60_205) -> begin
(

let expected_k = (let _158_172 = (let _158_170 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_169 = (let _158_168 = (FStar_Syntax_Syntax.null_binder wp_a)
in (let _158_167 = (let _158_166 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_166)::[])
in (_158_168)::_158_167))
in (_158_170)::_158_169))
in (let _158_171 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow _158_172 _158_171)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.stronger expected_k))
end))
in (

let close_wp = (

let b = (let _158_174 = (let _158_173 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _158_173 Prims.fst))
in (FStar_Syntax_Syntax.new_bv (Some ((FStar_Ident.range_of_lid ed.FStar_Syntax_Syntax.mname))) _158_174))
in (

let b_wp_a = (let _158_178 = (let _158_176 = (let _158_175 = (FStar_Syntax_Syntax.bv_to_name b)
in (FStar_Syntax_Syntax.null_binder _158_175))
in (_158_176)::[])
in (let _158_177 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_178 _158_177)))
in (

let expected_k = (let _158_185 = (let _158_183 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_182 = (let _158_181 = (FStar_Syntax_Syntax.mk_binder b)
in (let _158_180 = (let _158_179 = (FStar_Syntax_Syntax.null_binder b_wp_a)
in (_158_179)::[])
in (_158_181)::_158_180))
in (_158_183)::_158_182))
in (let _158_184 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_185 _158_184)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.close_wp expected_k))))
in (

let assert_p = (

let expected_k = (let _158_194 = (let _158_192 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_191 = (let _158_190 = (let _158_187 = (let _158_186 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _158_186 Prims.fst))
in (FStar_Syntax_Syntax.null_binder _158_187))
in (let _158_189 = (let _158_188 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_188)::[])
in (_158_190)::_158_189))
in (_158_192)::_158_191))
in (let _158_193 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_194 _158_193)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.assert_p expected_k))
in (

let assume_p = (

let expected_k = (let _158_203 = (let _158_201 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_200 = (let _158_199 = (let _158_196 = (let _158_195 = (FStar_Syntax_Util.type_u ())
in (FStar_All.pipe_right _158_195 Prims.fst))
in (FStar_Syntax_Syntax.null_binder _158_196))
in (let _158_198 = (let _158_197 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_197)::[])
in (_158_199)::_158_198))
in (_158_201)::_158_200))
in (let _158_202 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_203 _158_202)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.assume_p expected_k))
in (

let null_wp = (

let expected_k = (let _158_206 = (let _158_204 = (FStar_Syntax_Syntax.mk_binder a)
in (_158_204)::[])
in (let _158_205 = (FStar_Syntax_Syntax.mk_Total wp_a)
in (FStar_Syntax_Util.arrow _158_206 _158_205)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.null_wp expected_k))
in (

let trivial_wp = (

let _60_222 = (FStar_Syntax_Util.type_u ())
in (match (_60_222) with
| (t, _60_221) -> begin
(

let expected_k = (let _158_211 = (let _158_209 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_208 = (let _158_207 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_207)::[])
in (_158_209)::_158_208))
in (let _158_210 = (FStar_Syntax_Syntax.mk_GTotal t)
in (FStar_Syntax_Util.arrow _158_211 _158_210)))
in (check_and_gen' env ed.FStar_Syntax_Syntax.trivial expected_k))
end))
in (

let _60_366 = (match ((let _158_212 = (FStar_Syntax_Subst.compress ed.FStar_Syntax_Syntax.repr)
in _158_212.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
((ed.FStar_Syntax_Syntax.repr), (ed.FStar_Syntax_Syntax.bind_repr), (ed.FStar_Syntax_Syntax.return_repr), (ed.FStar_Syntax_Syntax.actions))
end
| _60_227 -> begin
(

let repr = (

let _60_231 = (FStar_Syntax_Util.type_u ())
in (match (_60_231) with
| (t, _60_230) -> begin
(

let expected_k = (let _158_217 = (let _158_215 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_214 = (let _158_213 = (FStar_Syntax_Syntax.null_binder wp_a)
in (_158_213)::[])
in (_158_215)::_158_214))
in (let _158_216 = (FStar_Syntax_Syntax.mk_GTotal t)
in (FStar_Syntax_Util.arrow _158_217 _158_216)))
in (tc_check_trivial_guard env ed.FStar_Syntax_Syntax.repr expected_k))
end))
in (

let mk_repr' = (fun t wp -> (

let repr = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.AllowUnboundUniverses)::[]) env repr)
in (let _158_227 = (let _158_226 = (let _158_225 = (let _158_224 = (FStar_Syntax_Syntax.as_arg t)
in (let _158_223 = (let _158_222 = (FStar_Syntax_Syntax.as_arg wp)
in (_158_222)::[])
in (_158_224)::_158_223))
in ((repr), (_158_225)))
in FStar_Syntax_Syntax.Tm_app (_158_226))
in (FStar_Syntax_Syntax.mk _158_227 None FStar_Range.dummyRange))))
in (

let mk_repr = (fun a wp -> (let _158_232 = (FStar_Syntax_Syntax.bv_to_name a)
in (mk_repr' _158_232 wp)))
in (

let destruct_repr = (fun t -> (match ((let _158_235 = (FStar_Syntax_Subst.compress t)
in _158_235.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_app (_60_244, ((t, _60_251))::((wp, _60_247))::[]) -> begin
((t), (wp))
end
| _60_257 -> begin
(FStar_All.failwith "Unexpected repr type")
end))
in (

let bind_repr = (

let r = (let _158_236 = (FStar_Syntax_Syntax.lid_as_fv FStar_Syntax_Const.range_0 FStar_Syntax_Syntax.Delta_constant None)
in (FStar_All.pipe_right _158_236 FStar_Syntax_Syntax.fv_to_tm))
in (

let _60_261 = (fresh_effect_signature ())
in (match (_60_261) with
| (b, wp_b) -> begin
(

let a_wp_b = (let _158_240 = (let _158_238 = (let _158_237 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.null_binder _158_237))
in (_158_238)::[])
in (let _158_239 = (FStar_Syntax_Syntax.mk_Total wp_b)
in (FStar_Syntax_Util.arrow _158_240 _158_239)))
in (

let wp_f = (FStar_Syntax_Syntax.gen_bv "wp_f" None wp_a)
in (

let wp_g = (FStar_Syntax_Syntax.gen_bv "wp_g" None a_wp_b)
in (

let x_a = (let _158_241 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.gen_bv "x_a" None _158_241))
in (

let wp_g_x = (let _158_245 = (FStar_Syntax_Syntax.bv_to_name wp_g)
in (let _158_244 = (let _158_243 = (let _158_242 = (FStar_Syntax_Syntax.bv_to_name x_a)
in (FStar_All.pipe_left FStar_Syntax_Syntax.as_arg _158_242))
in (_158_243)::[])
in (FStar_Syntax_Syntax.mk_Tm_app _158_245 _158_244 None FStar_Range.dummyRange)))
in (

let res = (

let wp = (let _158_257 = (let _158_246 = (FStar_TypeChecker_Env.inst_tscheme bind_wp)
in (FStar_All.pipe_right _158_246 Prims.snd))
in (let _158_256 = (let _158_255 = (let _158_254 = (let _158_253 = (FStar_Syntax_Syntax.bv_to_name a)
in (let _158_252 = (let _158_251 = (FStar_Syntax_Syntax.bv_to_name b)
in (let _158_250 = (let _158_249 = (FStar_Syntax_Syntax.bv_to_name wp_f)
in (let _158_248 = (let _158_247 = (FStar_Syntax_Syntax.bv_to_name wp_g)
in (_158_247)::[])
in (_158_249)::_158_248))
in (_158_251)::_158_250))
in (_158_253)::_158_252))
in (r)::_158_254)
in (FStar_List.map FStar_Syntax_Syntax.as_arg _158_255))
in (FStar_Syntax_Syntax.mk_Tm_app _158_257 _158_256 None FStar_Range.dummyRange)))
in (mk_repr b wp))
in (

let expected_k = (let _158_277 = (let _158_275 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_274 = (let _158_273 = (FStar_Syntax_Syntax.mk_binder b)
in (let _158_272 = (let _158_271 = (FStar_Syntax_Syntax.mk_binder wp_f)
in (let _158_270 = (let _158_269 = (let _158_259 = (let _158_258 = (FStar_Syntax_Syntax.bv_to_name wp_f)
in (mk_repr a _158_258))
in (FStar_Syntax_Syntax.null_binder _158_259))
in (let _158_268 = (let _158_267 = (FStar_Syntax_Syntax.mk_binder wp_g)
in (let _158_266 = (let _158_265 = (let _158_264 = (let _158_263 = (let _158_260 = (FStar_Syntax_Syntax.mk_binder x_a)
in (_158_260)::[])
in (let _158_262 = (let _158_261 = (mk_repr b wp_g_x)
in (FStar_All.pipe_left FStar_Syntax_Syntax.mk_Total _158_261))
in (FStar_Syntax_Util.arrow _158_263 _158_262)))
in (FStar_Syntax_Syntax.null_binder _158_264))
in (_158_265)::[])
in (_158_267)::_158_266))
in (_158_269)::_158_268))
in (_158_271)::_158_270))
in (_158_273)::_158_272))
in (_158_275)::_158_274))
in (let _158_276 = (FStar_Syntax_Syntax.mk_Total res)
in (FStar_Syntax_Util.arrow _158_277 _158_276)))
in (

let _60_275 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env expected_k)
in (match (_60_275) with
| (expected_k, _60_272, _60_274) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env (Prims.snd ed.FStar_Syntax_Syntax.bind_repr).FStar_Syntax_Syntax.pos)
in (

let env = (

let _60_277 = env
in {FStar_TypeChecker_Env.solver = _60_277.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_277.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_277.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_277.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_277.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_277.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_277.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_277.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_277.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_277.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_277.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_277.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_277.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_277.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_277.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_277.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_277.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_277.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = _60_277.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_277.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_277.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_277.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_277.FStar_TypeChecker_Env.qname_and_index})
in (

let br = (check_and_gen' env ed.FStar_Syntax_Syntax.bind_repr expected_k)
in br)))
end)))))))))
end)))
in (

let return_repr = (

let x_a = (let _158_278 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.gen_bv "x_a" None _158_278))
in (

let res = (

let wp = (let _158_285 = (let _158_279 = (FStar_TypeChecker_Env.inst_tscheme return_wp)
in (FStar_All.pipe_right _158_279 Prims.snd))
in (let _158_284 = (let _158_283 = (let _158_282 = (FStar_Syntax_Syntax.bv_to_name a)
in (let _158_281 = (let _158_280 = (FStar_Syntax_Syntax.bv_to_name x_a)
in (_158_280)::[])
in (_158_282)::_158_281))
in (FStar_List.map FStar_Syntax_Syntax.as_arg _158_283))
in (FStar_Syntax_Syntax.mk_Tm_app _158_285 _158_284 None FStar_Range.dummyRange)))
in (mk_repr a wp))
in (

let expected_k = (let _158_290 = (let _158_288 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_287 = (let _158_286 = (FStar_Syntax_Syntax.mk_binder x_a)
in (_158_286)::[])
in (_158_288)::_158_287))
in (let _158_289 = (FStar_Syntax_Syntax.mk_Total res)
in (FStar_Syntax_Util.arrow _158_290 _158_289)))
in (

let _60_291 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env expected_k)
in (match (_60_291) with
| (expected_k, _60_288, _60_290) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env (Prims.snd ed.FStar_Syntax_Syntax.return_repr).FStar_Syntax_Syntax.pos)
in (

let _60_295 = (check_and_gen' env ed.FStar_Syntax_Syntax.return_repr expected_k)
in (match (_60_295) with
| (univs, repr) -> begin
(match (univs) with
| [] -> begin
(([]), (repr))
end
| _60_298 -> begin
(Prims.raise (FStar_Syntax_Syntax.Error ((("Unexpected universe-polymorphic return for effect"), (repr.FStar_Syntax_Syntax.pos)))))
end)
end)))
end)))))
in (

let actions = (

let check_action = (fun act -> (

let _60_306 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env act.FStar_Syntax_Syntax.action_typ)
in (match (_60_306) with
| (act_typ, _60_304, g_t) -> begin
(

let env' = (FStar_TypeChecker_Env.set_expected_typ env act_typ)
in (

let _60_308 = if (FStar_TypeChecker_Env.debug env (FStar_Options.Other ("ED"))) then begin
(let _158_294 = (FStar_Syntax_Print.term_to_string act.FStar_Syntax_Syntax.action_defn)
in (let _158_293 = (FStar_Syntax_Print.term_to_string act_typ)
in (FStar_Util.print3 "Checking action %s:\n[definition]: %s\n[cps\'d type]: %s\n" (FStar_Ident.text_of_lid act.FStar_Syntax_Syntax.action_name) _158_294 _158_293)))
end else begin
()
end
in (

let _60_314 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env' act.FStar_Syntax_Syntax.action_defn)
in (match (_60_314) with
| (act_defn, _60_312, g_a) -> begin
(

let act_defn = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::[]) env act_defn)
in (

let act_typ = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.UnfoldUntil (FStar_Syntax_Syntax.Delta_constant))::(FStar_TypeChecker_Normalize.Eager_unfolding)::(FStar_TypeChecker_Normalize.Beta)::[]) env act_typ)
in (

let _60_337 = (

let act_typ = (FStar_Syntax_Subst.compress act_typ)
in (match (act_typ.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let _60_325 = (FStar_Syntax_Subst.open_comp bs c)
in (match (_60_325) with
| (bs, _60_324) -> begin
(

let res = (mk_repr' FStar_Syntax_Syntax.tun FStar_Syntax_Syntax.tun)
in (

let k = (let _158_295 = (FStar_Syntax_Syntax.mk_Total res)
in (FStar_Syntax_Util.arrow bs _158_295))
in (

let _60_332 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env k)
in (match (_60_332) with
| (k, _60_330, g) -> begin
((k), (g))
end))))
end))
end
| _60_334 -> begin
(let _158_300 = (let _158_299 = (let _158_298 = (let _158_297 = (FStar_Syntax_Print.term_to_string act_typ)
in (let _158_296 = (FStar_Syntax_Print.tag_of_term act_typ)
in (FStar_Util.format2 "Actions must have function types (not: %s, a.k.a. %s)" _158_297 _158_296)))
in ((_158_298), (act_defn.FStar_Syntax_Syntax.pos)))
in FStar_Syntax_Syntax.Error (_158_299))
in (Prims.raise _158_300))
end))
in (match (_60_337) with
| (expected_k, g_k) -> begin
(

let g = (FStar_TypeChecker_Rel.teq env act_typ expected_k)
in (

let _60_339 = (let _158_303 = (let _158_302 = (let _158_301 = (FStar_TypeChecker_Rel.conj_guard g_t g)
in (FStar_TypeChecker_Rel.conj_guard g_k _158_301))
in (FStar_TypeChecker_Rel.conj_guard g_a _158_302))
in (FStar_TypeChecker_Rel.force_trivial_guard env _158_303))
in (

let act_typ = (match ((let _158_304 = (FStar_Syntax_Subst.compress expected_k)
in _158_304.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (bs, c) -> begin
(

let _60_347 = (FStar_Syntax_Subst.open_comp bs c)
in (match (_60_347) with
| (bs, c) -> begin
(

let _60_350 = (destruct_repr (FStar_Syntax_Util.comp_result c))
in (match (_60_350) with
| (a, wp) -> begin
(

let c = (let _158_308 = (let _158_305 = (env.FStar_TypeChecker_Env.universe_of env a)
in (_158_305)::[])
in (let _158_307 = (let _158_306 = (FStar_Syntax_Syntax.as_arg wp)
in (_158_306)::[])
in {FStar_Syntax_Syntax.comp_univs = _158_308; FStar_Syntax_Syntax.effect_name = ed.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.result_typ = a; FStar_Syntax_Syntax.effect_args = _158_307; FStar_Syntax_Syntax.flags = []}))
in (let _158_309 = (FStar_Syntax_Syntax.mk_Comp c)
in (FStar_Syntax_Util.arrow bs _158_309)))
end))
end))
end
| _60_353 -> begin
(FStar_All.failwith "")
end)
in (

let _60_357 = (FStar_TypeChecker_Util.generalize_universes env act_defn)
in (match (_60_357) with
| (univs, act_defn) -> begin
(

let act_typ = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env act_typ)
in (

let _60_359 = act
in {FStar_Syntax_Syntax.action_name = _60_359.FStar_Syntax_Syntax.action_name; FStar_Syntax_Syntax.action_unqualified_name = _60_359.FStar_Syntax_Syntax.action_unqualified_name; FStar_Syntax_Syntax.action_univs = univs; FStar_Syntax_Syntax.action_defn = act_defn; FStar_Syntax_Syntax.action_typ = act_typ}))
end)))))
end))))
end))))
end)))
in (FStar_All.pipe_right ed.FStar_Syntax_Syntax.actions (FStar_List.map check_action)))
in ((repr), (bind_repr), (return_repr), (actions)))))))))
end)
in (match (_60_366) with
| (repr, bind_repr, return_repr, actions) -> begin
(

let t = (let _158_310 = (FStar_Syntax_Syntax.mk_Total ed.FStar_Syntax_Syntax.signature)
in (FStar_Syntax_Util.arrow ed.FStar_Syntax_Syntax.binders _158_310))
in (

let _60_370 = (FStar_TypeChecker_Util.generalize_universes env0 t)
in (match (_60_370) with
| (univs, t) -> begin
(

let signature = (match ((let _158_312 = (let _158_311 = (FStar_Syntax_Subst.compress t)
in _158_311.FStar_Syntax_Syntax.n)
in ((effect_params), (_158_312)))) with
| ([], _60_373) -> begin
t
end
| (_60_376, FStar_Syntax_Syntax.Tm_arrow (_60_378, c)) -> begin
(FStar_Syntax_Util.comp_result c)
end
| _60_384 -> begin
(FStar_All.failwith "Impossible")
end)
in (

let close = (fun n ts -> (

let ts = (let _158_317 = (FStar_Syntax_Subst.close_tscheme effect_params ts)
in (FStar_Syntax_Subst.close_univ_vars_tscheme univs _158_317))
in (

let m = (FStar_List.length (Prims.fst ts))
in (

let _60_392 = if (((n >= (Prims.parse_int "0")) && (not ((FStar_Syntax_Util.is_unknown (Prims.snd ts))))) && (m <> n)) then begin
(

let error = if (m < n) then begin
"not universe-polymorphic enough"
end else begin
"too universe-polymorphic"
end
in (let _158_320 = (let _158_319 = (FStar_Util.string_of_int n)
in (let _158_318 = (FStar_Syntax_Print.tscheme_to_string ts)
in (FStar_Util.format3 "The effect combinator is %s (n=%s) (%s)" error _158_319 _158_318)))
in (FStar_All.failwith _158_320)))
end else begin
()
end
in ts))))
in (

let close_action = (fun act -> (

let _60_398 = (close (~- ((Prims.parse_int "1"))) ((act.FStar_Syntax_Syntax.action_univs), (act.FStar_Syntax_Syntax.action_defn)))
in (match (_60_398) with
| (univs, defn) -> begin
(

let _60_401 = (close (~- ((Prims.parse_int "1"))) ((act.FStar_Syntax_Syntax.action_univs), (act.FStar_Syntax_Syntax.action_typ)))
in (match (_60_401) with
| (univs', typ) -> begin
(

let _60_402 = ()
in (

let _60_404 = act
in {FStar_Syntax_Syntax.action_name = _60_404.FStar_Syntax_Syntax.action_name; FStar_Syntax_Syntax.action_unqualified_name = _60_404.FStar_Syntax_Syntax.action_unqualified_name; FStar_Syntax_Syntax.action_univs = univs; FStar_Syntax_Syntax.action_defn = defn; FStar_Syntax_Syntax.action_typ = typ}))
end))
end)))
in (

let nunivs = (FStar_List.length univs)
in (

let _60_407 = ()
in (

let ed = (

let _60_409 = ed
in (let _158_337 = (close (Prims.parse_int "0") return_wp)
in (let _158_336 = (close (Prims.parse_int "1") bind_wp)
in (let _158_335 = (close (Prims.parse_int "0") if_then_else)
in (let _158_334 = (close (Prims.parse_int "0") ite_wp)
in (let _158_333 = (close (Prims.parse_int "0") stronger)
in (let _158_332 = (close (Prims.parse_int "1") close_wp)
in (let _158_331 = (close (Prims.parse_int "0") assert_p)
in (let _158_330 = (close (Prims.parse_int "0") assume_p)
in (let _158_329 = (close (Prims.parse_int "0") null_wp)
in (let _158_328 = (close (Prims.parse_int "0") trivial_wp)
in (let _158_327 = (let _158_323 = (close (Prims.parse_int "0") (([]), (repr)))
in (Prims.snd _158_323))
in (let _158_326 = (close (Prims.parse_int "0") return_repr)
in (let _158_325 = (close (Prims.parse_int "1") bind_repr)
in (let _158_324 = (FStar_List.map close_action actions)
in {FStar_Syntax_Syntax.qualifiers = _60_409.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.cattributes = _60_409.FStar_Syntax_Syntax.cattributes; FStar_Syntax_Syntax.mname = _60_409.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = univs; FStar_Syntax_Syntax.binders = effect_params; FStar_Syntax_Syntax.signature = signature; FStar_Syntax_Syntax.ret_wp = _158_337; FStar_Syntax_Syntax.bind_wp = _158_336; FStar_Syntax_Syntax.if_then_else = _158_335; FStar_Syntax_Syntax.ite_wp = _158_334; FStar_Syntax_Syntax.stronger = _158_333; FStar_Syntax_Syntax.close_wp = _158_332; FStar_Syntax_Syntax.assert_p = _158_331; FStar_Syntax_Syntax.assume_p = _158_330; FStar_Syntax_Syntax.null_wp = _158_329; FStar_Syntax_Syntax.trivial = _158_328; FStar_Syntax_Syntax.repr = _158_327; FStar_Syntax_Syntax.return_repr = _158_326; FStar_Syntax_Syntax.bind_repr = _158_325; FStar_Syntax_Syntax.actions = _158_324})))))))))))))))
in (

let _60_412 = if ((FStar_TypeChecker_Env.debug env FStar_Options.Low) || (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("ED")))) then begin
(let _158_338 = (FStar_Syntax_Print.eff_decl_to_string false ed)
in (FStar_Util.print_string _158_338))
end else begin
()
end
in ed)))))))
end)))
end))))))))))))))))
end)))))
end))
end))
end))))
and cps_and_elaborate : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.eff_decl  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Syntax_Syntax.eff_decl * FStar_Syntax_Syntax.sigelt Prims.option) = (fun env ed -> (

let _60_418 = (FStar_Syntax_Subst.open_term ed.FStar_Syntax_Syntax.binders ed.FStar_Syntax_Syntax.signature)
in (match (_60_418) with
| (effect_binders_un, signature_un) -> begin
(

let _60_423 = (tc_tparams env effect_binders_un)
in (match (_60_423) with
| (effect_binders, env, _60_422) -> begin
(

let _60_427 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env signature_un)
in (match (_60_427) with
| (signature, _60_426) -> begin
(

let effect_binders = (FStar_List.map (fun _60_430 -> (match (_60_430) with
| (bv, qual) -> begin
(let _158_343 = (

let _60_431 = bv
in (let _158_342 = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.EraseUniverses)::[]) env bv.FStar_Syntax_Syntax.sort)
in {FStar_Syntax_Syntax.ppname = _60_431.FStar_Syntax_Syntax.ppname; FStar_Syntax_Syntax.index = _60_431.FStar_Syntax_Syntax.index; FStar_Syntax_Syntax.sort = _158_342}))
in ((_158_343), (qual)))
end)) effect_binders)
in (

let _60_446 = (match ((let _158_344 = (FStar_Syntax_Subst.compress signature_un)
in _158_344.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (((a, _60_436))::[], effect_marker) -> begin
((a), (effect_marker))
end
| _60_443 -> begin
(FStar_All.failwith "bad shape for effect-for-free signature")
end)
in (match (_60_446) with
| (a, effect_marker) -> begin
(

let a = if (FStar_Syntax_Syntax.is_null_bv a) then begin
(let _158_346 = (let _158_345 = (FStar_Syntax_Syntax.range_of_bv a)
in Some (_158_345))
in (FStar_Syntax_Syntax.gen_bv "a" _158_346 a.FStar_Syntax_Syntax.sort))
end else begin
a
end
in (

let open_and_check = (fun t -> (

let subst = (FStar_Syntax_Subst.opening_of_binders effect_binders)
in (

let t = (FStar_Syntax_Subst.subst subst t)
in (

let _60_456 = (FStar_TypeChecker_TcTerm.tc_term env t)
in (match (_60_456) with
| (t, comp, _60_455) -> begin
((t), (comp))
end)))))
in (

let mk = (fun x -> (FStar_Syntax_Syntax.mk x None signature.FStar_Syntax_Syntax.pos))
in (

let _60_461 = (open_and_check ed.FStar_Syntax_Syntax.repr)
in (match (_60_461) with
| (repr, _comp) -> begin
(

let _60_462 = if (FStar_TypeChecker_Env.debug env (FStar_Options.Other ("ED"))) then begin
(let _158_351 = (FStar_Syntax_Print.term_to_string repr)
in (FStar_Util.print1 "Representation is: %s\n" _158_351))
end else begin
()
end
in (

let dmff_env = (FStar_TypeChecker_DMFF.empty env (FStar_TypeChecker_TcTerm.tc_constant FStar_Range.dummyRange))
in (

let wp_type = (FStar_TypeChecker_DMFF.star_type dmff_env repr)
in (

let wp_type = (recheck_debug "*" env wp_type)
in (

let wp_a = (let _158_358 = (let _158_357 = (let _158_356 = (let _158_355 = (let _158_354 = (let _158_353 = (FStar_Syntax_Syntax.bv_to_name a)
in (let _158_352 = (FStar_Syntax_Syntax.as_implicit false)
in ((_158_353), (_158_352))))
in (_158_354)::[])
in ((wp_type), (_158_355)))
in FStar_Syntax_Syntax.Tm_app (_158_356))
in (mk _158_357))
in (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env _158_358))
in (

let effect_signature = (

let binders = (let _158_363 = (let _158_359 = (FStar_Syntax_Syntax.as_implicit false)
in ((a), (_158_359)))
in (let _158_362 = (let _158_361 = (let _158_360 = (FStar_Syntax_Syntax.gen_bv "dijkstra_wp" None wp_a)
in (FStar_All.pipe_right _158_360 FStar_Syntax_Syntax.mk_binder))
in (_158_361)::[])
in (_158_363)::_158_362))
in (

let binders = (FStar_Syntax_Subst.close_binders binders)
in (mk (FStar_Syntax_Syntax.Tm_arrow (((binders), (effect_marker)))))))
in (

let effect_signature = (recheck_debug "turned into the effect signature" env effect_signature)
in (

let sigelts = (FStar_ST.alloc [])
in (

let mk_lid = (fun name -> (FStar_Ident.lid_of_path (FStar_Ident.path_of_text (Prims.strcat (FStar_Ident.text_of_lid ed.FStar_Syntax_Syntax.mname) (Prims.strcat "_" name))) FStar_Range.dummyRange))
in (

let elaborate_and_star = (fun dmff_env item -> (

let _60_480 = item
in (match (_60_480) with
| (u_item, item) -> begin
(

let _60_483 = (open_and_check item)
in (match (_60_483) with
| (item, item_comp) -> begin
(

let _60_484 = if (not ((FStar_Syntax_Util.is_total_lcomp item_comp))) then begin
(let _158_373 = (let _158_372 = (let _158_371 = (FStar_Syntax_Print.term_to_string item)
in (let _158_370 = (FStar_Syntax_Print.lcomp_to_string item_comp)
in (FStar_Util.format2 "Computation for [%s] is not total : %s !" _158_371 _158_370)))
in FStar_Syntax_Syntax.Err (_158_372))
in (Prims.raise _158_373))
end else begin
()
end
in (

let _60_489 = (FStar_TypeChecker_DMFF.star_expr dmff_env item)
in (match (_60_489) with
| (item_t, item_wp, item_elab) -> begin
(

let item_wp = (recheck_debug "*" env item_wp)
in (

let item_elab = (recheck_debug "_" env item_elab)
in ((dmff_env), (item_t), (item_wp), (item_elab))))
end)))
end))
end)))
in (

let _60_497 = (elaborate_and_star dmff_env ed.FStar_Syntax_Syntax.bind_repr)
in (match (_60_497) with
| (dmff_env, _60_494, bind_wp, bind_elab) -> begin
(

let _60_503 = (elaborate_and_star dmff_env ed.FStar_Syntax_Syntax.return_repr)
in (match (_60_503) with
| (dmff_env, _60_500, return_wp, return_elab) -> begin
(

let lift_from_pure_wp = (match ((let _158_374 = (FStar_Syntax_Subst.compress return_wp)
in _158_374.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs ((b1)::(b2)::bs, body, what) -> begin
(

let _60_523 = (match ((let _158_375 = (FStar_Syntax_Util.abs bs body None)
in (FStar_Syntax_Subst.open_term ((b1)::(b2)::[]) _158_375))) with
| ((b1)::(b2)::[], body) -> begin
((b1), (b2), (body))
end
| _60_519 -> begin
(FStar_All.failwith "Impossible : open_term not preserving binders arity")
end)
in (match (_60_523) with
| (b1, b2, body) -> begin
(

let env0 = (FStar_TypeChecker_Env.push_binders (FStar_TypeChecker_DMFF.get_env dmff_env) ((b1)::(b2)::[]))
in (

let wp_b1 = (let _158_382 = (let _158_381 = (let _158_380 = (let _158_379 = (let _158_378 = (let _158_377 = (FStar_Syntax_Syntax.bv_to_name (Prims.fst b1))
in (let _158_376 = (FStar_Syntax_Syntax.as_implicit false)
in ((_158_377), (_158_376))))
in (_158_378)::[])
in ((wp_type), (_158_379)))
in FStar_Syntax_Syntax.Tm_app (_158_380))
in (mk _158_381))
in (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::[]) env0 _158_382))
in (

let _60_529 = (let _158_384 = (let _158_383 = (FStar_Syntax_Util.unascribe wp_b1)
in (FStar_TypeChecker_Normalize.eta_expand_with_type body _158_383))
in (FStar_All.pipe_left FStar_Syntax_Util.abs_formals _158_384))
in (match (_60_529) with
| (bs, body, what') -> begin
(

let t2 = (Prims.fst b2).FStar_Syntax_Syntax.sort
in (

let pure_wp_type = (FStar_TypeChecker_DMFF.double_star t2)
in (

let wp = (FStar_Syntax_Syntax.gen_bv "wp" None pure_wp_type)
in (

let body = (let _158_388 = (FStar_Syntax_Syntax.bv_to_name wp)
in (let _158_387 = (let _158_386 = (let _158_385 = (FStar_Syntax_Util.abs ((b2)::[]) body what')
in ((_158_385), (None)))
in (_158_386)::[])
in (FStar_Syntax_Syntax.mk_Tm_app _158_388 _158_387 None FStar_Range.dummyRange)))
in (let _158_392 = (let _158_390 = (let _158_389 = (FStar_Syntax_Syntax.mk_binder wp)
in (_158_389)::[])
in (b1)::_158_390)
in (let _158_391 = (FStar_Syntax_Util.abs bs body what)
in (FStar_Syntax_Util.abs _158_392 _158_391 (Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_GTot_lid), ([]))))))))))))
end))))
end))
end
| _60_535 -> begin
(FStar_All.failwith "unexpected shape for return")
end)
in (

let return_wp = (match ((let _158_393 = (FStar_Syntax_Subst.compress return_wp)
in _158_393.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs ((b1)::(b2)::bs, body, what) -> begin
(let _158_394 = (FStar_Syntax_Util.abs bs body what)
in (FStar_Syntax_Util.abs ((b1)::(b2)::[]) _158_394 (Some (FStar_Util.Inr (((FStar_Syntax_Const.effect_GTot_lid), ([])))))))
end
| _60_547 -> begin
(FStar_All.failwith "unexpected shape for return")
end)
in (

let bind_wp = (match ((let _158_395 = (FStar_Syntax_Subst.compress bind_wp)
in _158_395.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs (binders, body, what) -> begin
(

let r = (FStar_Syntax_Syntax.lid_as_fv FStar_Syntax_Const.range_lid (FStar_Syntax_Syntax.Delta_defined_at_level ((Prims.parse_int "1"))) None)
in (let _158_399 = (let _158_398 = (let _158_397 = (let _158_396 = (mk (FStar_Syntax_Syntax.Tm_fvar (r)))
in (FStar_Syntax_Syntax.null_binder _158_396))
in (_158_397)::[])
in (FStar_List.append _158_398 binders))
in (FStar_Syntax_Util.abs _158_399 body what)))
end
| _60_556 -> begin
(FStar_All.failwith "unexpected shape for bind")
end)
in (

let apply_close = (fun t -> if ((FStar_List.length effect_binders) = (Prims.parse_int "0")) then begin
t
end else begin
(let _158_406 = (let _158_405 = (let _158_404 = (let _158_403 = (let _158_402 = (FStar_Syntax_Util.args_of_binders effect_binders)
in (Prims.snd _158_402))
in ((t), (_158_403)))
in FStar_Syntax_Syntax.Tm_app (_158_404))
in (mk _158_405))
in (FStar_Syntax_Subst.close effect_binders _158_406))
end)
in (

let register = (fun name item -> (

let _60_565 = (let _158_412 = (mk_lid name)
in (let _158_411 = (FStar_Syntax_Util.abs effect_binders item None)
in (FStar_TypeChecker_Util.mk_toplevel_definition env _158_412 _158_411)))
in (match (_60_565) with
| (sigelt, fv) -> begin
(

let _60_566 = (let _158_414 = (let _158_413 = (FStar_ST.read sigelts)
in (sigelt)::_158_413)
in (FStar_ST.op_Colon_Equals sigelts _158_414))
in fv)
end)))
in (

let lift_from_pure_wp = (register "lift_from_pure" lift_from_pure_wp)
in (

let return_wp = (register "return_wp" return_wp)
in (

let _60_570 = (let _158_416 = (let _158_415 = (FStar_ST.read sigelts)
in (FStar_Syntax_Syntax.Sig_pragma (((FStar_Syntax_Syntax.SetOptions ("--admit_smt_queries true")), (FStar_Range.dummyRange))))::_158_415)
in (FStar_ST.op_Colon_Equals sigelts _158_416))
in (

let return_elab = (register "return_elab" return_elab)
in (

let _60_573 = (let _158_418 = (let _158_417 = (FStar_ST.read sigelts)
in (FStar_Syntax_Syntax.Sig_pragma (((FStar_Syntax_Syntax.SetOptions ("--admit_smt_queries false")), (FStar_Range.dummyRange))))::_158_417)
in (FStar_ST.op_Colon_Equals sigelts _158_418))
in (

let bind_wp = (register "bind_wp" bind_wp)
in (

let _60_576 = (let _158_420 = (let _158_419 = (FStar_ST.read sigelts)
in (FStar_Syntax_Syntax.Sig_pragma (((FStar_Syntax_Syntax.SetOptions ("--admit_smt_queries true")), (FStar_Range.dummyRange))))::_158_419)
in (FStar_ST.op_Colon_Equals sigelts _158_420))
in (

let bind_elab = (register "bind_elab" bind_elab)
in (

let _60_579 = (let _158_422 = (let _158_421 = (FStar_ST.read sigelts)
in (FStar_Syntax_Syntax.Sig_pragma (((FStar_Syntax_Syntax.SetOptions ("--admit_smt_queries false")), (FStar_Range.dummyRange))))::_158_421)
in (FStar_ST.op_Colon_Equals sigelts _158_422))
in (

let _60_598 = (FStar_List.fold_left (fun _60_583 action -> (match (_60_583) with
| (dmff_env, actions) -> begin
(

let _60_589 = (elaborate_and_star dmff_env ((action.FStar_Syntax_Syntax.action_univs), (action.FStar_Syntax_Syntax.action_defn)))
in (match (_60_589) with
| (dmff_env, action_t, action_wp, action_elab) -> begin
(

let name = action.FStar_Syntax_Syntax.action_name.FStar_Ident.ident.FStar_Ident.idText
in (

let action_typ_with_wp = (FStar_TypeChecker_DMFF.trans_F dmff_env action_t action_wp)
in (

let action_elab = (register (Prims.strcat name "_elab") action_elab)
in (

let action_typ_with_wp = (register (Prims.strcat name "_complete_type") action_typ_with_wp)
in (let _158_428 = (let _158_427 = (

let _60_594 = action
in (let _158_426 = (apply_close action_elab)
in (let _158_425 = (apply_close action_typ_with_wp)
in {FStar_Syntax_Syntax.action_name = _60_594.FStar_Syntax_Syntax.action_name; FStar_Syntax_Syntax.action_unqualified_name = _60_594.FStar_Syntax_Syntax.action_unqualified_name; FStar_Syntax_Syntax.action_univs = _60_594.FStar_Syntax_Syntax.action_univs; FStar_Syntax_Syntax.action_defn = _158_426; FStar_Syntax_Syntax.action_typ = _158_425})))
in (_158_427)::actions)
in ((dmff_env), (_158_428)))))))
end))
end)) ((dmff_env), ([])) ed.FStar_Syntax_Syntax.actions)
in (match (_60_598) with
| (dmff_env, actions) -> begin
(

let actions = (FStar_List.rev actions)
in (

let repr = (

let wp = (FStar_Syntax_Syntax.gen_bv "wp_a" None wp_a)
in (

let binders = (let _158_431 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_430 = (let _158_429 = (FStar_Syntax_Syntax.mk_binder wp)
in (_158_429)::[])
in (_158_431)::_158_430))
in (let _158_440 = (let _158_439 = (let _158_437 = (let _158_436 = (let _158_435 = (let _158_434 = (let _158_433 = (FStar_Syntax_Syntax.bv_to_name a)
in (let _158_432 = (FStar_Syntax_Syntax.as_implicit false)
in ((_158_433), (_158_432))))
in (_158_434)::[])
in ((repr), (_158_435)))
in FStar_Syntax_Syntax.Tm_app (_158_436))
in (mk _158_437))
in (let _158_438 = (FStar_Syntax_Syntax.bv_to_name wp)
in (FStar_TypeChecker_DMFF.trans_F dmff_env _158_439 _158_438)))
in (FStar_Syntax_Util.abs binders _158_440 None))))
in (

let repr = (recheck_debug "FC" env repr)
in (

let repr = (register "repr" repr)
in (

let _60_649 = (match ((let _158_442 = (let _158_441 = (FStar_Syntax_Subst.compress wp_type)
in (FStar_All.pipe_left FStar_Syntax_Util.unascribe _158_441))
in _158_442.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_abs ((type_param)::effect_param, arrow, _60_610) -> begin
(

let _60_623 = (match ((FStar_Syntax_Subst.open_term ((type_param)::effect_param) arrow)) with
| ((b)::bs, body) -> begin
((b), (bs), (body))
end
| _60_619 -> begin
(FStar_All.failwith "Impossible : open_term nt preserving binders arity")
end)
in (match (_60_623) with
| (type_param, effect_param, arrow) -> begin
(match ((let _158_444 = (let _158_443 = (FStar_Syntax_Subst.compress arrow)
in (FStar_All.pipe_left FStar_Syntax_Util.unascribe _158_443))
in _158_444.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (wp_binders, c) -> begin
(

let _60_630 = (FStar_Syntax_Subst.open_comp wp_binders c)
in (match (_60_630) with
| (wp_binders, c) -> begin
(

let _60_637 = (FStar_List.partition (fun _60_634 -> (match (_60_634) with
| (bv, _60_633) -> begin
(let _158_447 = (let _158_446 = (FStar_Syntax_Free.names bv.FStar_Syntax_Syntax.sort)
in (FStar_All.pipe_right _158_446 (FStar_Util.set_mem (Prims.fst type_param))))
in (FStar_All.pipe_right _158_447 Prims.op_Negation))
end)) wp_binders)
in (match (_60_637) with
| (pre_args, post_args) -> begin
(

let post = (match (post_args) with
| (post)::[] -> begin
post
end
| _60_641 -> begin
(let _158_449 = (let _158_448 = (FStar_Syntax_Print.term_to_string arrow)
in (FStar_Util.format1 "Impossible: multiple post candidates %s" _158_448))
in (FStar_All.failwith _158_449))
end)
in (let _158_451 = (FStar_Syntax_Util.arrow pre_args c)
in (let _158_450 = (FStar_Syntax_Util.abs ((type_param)::effect_param) (Prims.fst post).FStar_Syntax_Syntax.sort None)
in ((_158_451), (_158_450)))))
end))
end))
end
| _60_644 -> begin
(let _158_453 = (let _158_452 = (FStar_Syntax_Print.term_to_string arrow)
in (FStar_Util.format1 "Impossible: pre/post arrow %s" _158_452))
in (FStar_All.failwith _158_453))
end)
end))
end
| _60_646 -> begin
(let _158_455 = (let _158_454 = (FStar_Syntax_Print.term_to_string wp_type)
in (FStar_Util.format1 "Impossible: pre/post abs %s" _158_454))
in (FStar_All.failwith _158_455))
end)
in (match (_60_649) with
| (pre, post) -> begin
(

let _60_650 = (let _158_456 = (register "pre" pre)
in (Prims.ignore _158_456))
in (

let _60_652 = (let _158_457 = (register "post" post)
in (Prims.ignore _158_457))
in (

let _60_654 = (let _158_458 = (register "wp" wp_type)
in (Prims.ignore _158_458))
in (

let ed = (

let _60_656 = ed
in (let _158_469 = (FStar_Syntax_Subst.close_binders effect_binders)
in (let _158_468 = (FStar_Syntax_Subst.close effect_binders effect_signature)
in (let _158_467 = (let _158_459 = (apply_close return_wp)
in (([]), (_158_459)))
in (let _158_466 = (let _158_460 = (apply_close bind_wp)
in (([]), (_158_460)))
in (let _158_465 = (apply_close repr)
in (let _158_464 = (let _158_461 = (apply_close return_elab)
in (([]), (_158_461)))
in (let _158_463 = (let _158_462 = (apply_close bind_elab)
in (([]), (_158_462)))
in {FStar_Syntax_Syntax.qualifiers = _60_656.FStar_Syntax_Syntax.qualifiers; FStar_Syntax_Syntax.cattributes = _60_656.FStar_Syntax_Syntax.cattributes; FStar_Syntax_Syntax.mname = _60_656.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.univs = _60_656.FStar_Syntax_Syntax.univs; FStar_Syntax_Syntax.binders = _158_469; FStar_Syntax_Syntax.signature = _158_468; FStar_Syntax_Syntax.ret_wp = _158_467; FStar_Syntax_Syntax.bind_wp = _158_466; FStar_Syntax_Syntax.if_then_else = _60_656.FStar_Syntax_Syntax.if_then_else; FStar_Syntax_Syntax.ite_wp = _60_656.FStar_Syntax_Syntax.ite_wp; FStar_Syntax_Syntax.stronger = _60_656.FStar_Syntax_Syntax.stronger; FStar_Syntax_Syntax.close_wp = _60_656.FStar_Syntax_Syntax.close_wp; FStar_Syntax_Syntax.assert_p = _60_656.FStar_Syntax_Syntax.assert_p; FStar_Syntax_Syntax.assume_p = _60_656.FStar_Syntax_Syntax.assume_p; FStar_Syntax_Syntax.null_wp = _60_656.FStar_Syntax_Syntax.null_wp; FStar_Syntax_Syntax.trivial = _60_656.FStar_Syntax_Syntax.trivial; FStar_Syntax_Syntax.repr = _158_465; FStar_Syntax_Syntax.return_repr = _158_464; FStar_Syntax_Syntax.bind_repr = _158_463; FStar_Syntax_Syntax.actions = actions}))))))))
in (

let _60_661 = (FStar_TypeChecker_DMFF.gen_wps_for_free env effect_binders a wp_a ed)
in (match (_60_661) with
| (sigelts', ed) -> begin
(

let _60_662 = if (FStar_TypeChecker_Env.debug env (FStar_Options.Other ("ED"))) then begin
(let _158_470 = (FStar_Syntax_Print.eff_decl_to_string true ed)
in (FStar_Util.print_string _158_470))
end else begin
()
end
in (

let lift_from_pure_opt = if ((FStar_List.length effect_binders) = (Prims.parse_int "0")) then begin
(

let lift_from_pure = (let _158_473 = (let _158_472 = (let _158_471 = (apply_close lift_from_pure_wp)
in (([]), (_158_471)))
in Some (_158_472))
in {FStar_Syntax_Syntax.source = FStar_Syntax_Const.effect_PURE_lid; FStar_Syntax_Syntax.target = ed.FStar_Syntax_Syntax.mname; FStar_Syntax_Syntax.lift_wp = _158_473; FStar_Syntax_Syntax.lift = None})
in Some (FStar_Syntax_Syntax.Sig_sub_effect (((lift_from_pure), (FStar_Range.dummyRange)))))
end else begin
None
end
in (let _158_476 = (let _158_475 = (let _158_474 = (FStar_ST.read sigelts)
in (FStar_List.rev _158_474))
in (FStar_List.append _158_475 sigelts'))
in ((_158_476), (ed), (lift_from_pure_opt)))))
end))))))
end))))))
end))))))))))))))))
end))
end))))))))))))
end)))))
end)))
end))
end))
end)))
and tc_lex_t : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  FStar_Syntax_Syntax.qualifier Prims.list  ->  FStar_Ident.lident Prims.list  ->  FStar_Syntax_Syntax.sigelt = (fun env ses quals lids -> (

let _60_670 = ()
in (

let _60_678 = ()
in (match (ses) with
| (FStar_Syntax_Syntax.Sig_inductive_typ (lex_t, [], [], t, _60_707, _60_709, [], r))::(FStar_Syntax_Syntax.Sig_datacon (lex_top, [], _t_top, _lex_t_top, _158_481, [], _60_698, r1))::(FStar_Syntax_Syntax.Sig_datacon (lex_cons, [], _t_cons, _lex_t_cons, _158_482, [], _60_687, r2))::[] when (((_158_481 = (Prims.parse_int "0")) && (_158_482 = (Prims.parse_int "0"))) && (((FStar_Ident.lid_equals lex_t FStar_Syntax_Const.lex_t_lid) && (FStar_Ident.lid_equals lex_top FStar_Syntax_Const.lextop_lid)) && (FStar_Ident.lid_equals lex_cons FStar_Syntax_Const.lexcons_lid))) -> begin
(

let u = (FStar_Syntax_Syntax.new_univ_name (Some (r)))
in (

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_name (u))) None r)
in (

let t = (FStar_Syntax_Subst.close_univ_vars ((u)::[]) t)
in (

let tc = FStar_Syntax_Syntax.Sig_inductive_typ (((lex_t), ((u)::[]), ([]), (t), ([]), ((FStar_Syntax_Const.lextop_lid)::(FStar_Syntax_Const.lexcons_lid)::[]), ([]), (r)))
in (

let utop = (FStar_Syntax_Syntax.new_univ_name (Some (r1)))
in (

let lex_top_t = (let _158_485 = (let _158_484 = (let _158_483 = (FStar_Syntax_Syntax.fvar (FStar_Ident.set_lid_range FStar_Syntax_Const.lex_t_lid r1) FStar_Syntax_Syntax.Delta_constant None)
in ((_158_483), ((FStar_Syntax_Syntax.U_name (utop))::[])))
in FStar_Syntax_Syntax.Tm_uinst (_158_484))
in (FStar_Syntax_Syntax.mk _158_485 None r1))
in (

let lex_top_t = (FStar_Syntax_Subst.close_univ_vars ((utop)::[]) lex_top_t)
in (

let dc_lextop = FStar_Syntax_Syntax.Sig_datacon (((lex_top), ((utop)::[]), (lex_top_t), (FStar_Syntax_Const.lex_t_lid), ((Prims.parse_int "0")), ([]), ([]), (r1)))
in (

let ucons1 = (FStar_Syntax_Syntax.new_univ_name (Some (r2)))
in (

let ucons2 = (FStar_Syntax_Syntax.new_univ_name (Some (r2)))
in (

let lex_cons_t = (

let a = (let _158_486 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_type (FStar_Syntax_Syntax.U_name (ucons1))) None r2)
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _158_486))
in (

let hd = (let _158_487 = (FStar_Syntax_Syntax.bv_to_name a)
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _158_487))
in (

let tl = (let _158_491 = (let _158_490 = (let _158_489 = (let _158_488 = (FStar_Syntax_Syntax.fvar (FStar_Ident.set_lid_range FStar_Syntax_Const.lex_t_lid r2) FStar_Syntax_Syntax.Delta_constant None)
in ((_158_488), ((FStar_Syntax_Syntax.U_name (ucons2))::[])))
in FStar_Syntax_Syntax.Tm_uinst (_158_489))
in (FStar_Syntax_Syntax.mk _158_490 None r2))
in (FStar_Syntax_Syntax.new_bv (Some (r2)) _158_491))
in (

let res = (let _158_494 = (let _158_493 = (let _158_492 = (FStar_Syntax_Syntax.fvar (FStar_Ident.set_lid_range FStar_Syntax_Const.lex_t_lid r2) FStar_Syntax_Syntax.Delta_constant None)
in ((_158_492), ((FStar_Syntax_Syntax.U_max ((FStar_Syntax_Syntax.U_name (ucons1))::(FStar_Syntax_Syntax.U_name (ucons2))::[]))::[])))
in FStar_Syntax_Syntax.Tm_uinst (_158_493))
in (FStar_Syntax_Syntax.mk _158_494 None r2))
in (let _158_495 = (FStar_Syntax_Syntax.mk_Total res)
in (FStar_Syntax_Util.arrow ((((a), (Some (FStar_Syntax_Syntax.imp_tag))))::(((hd), (None)))::(((tl), (None)))::[]) _158_495))))))
in (

let lex_cons_t = (FStar_Syntax_Subst.close_univ_vars ((ucons1)::(ucons2)::[]) lex_cons_t)
in (

let dc_lexcons = FStar_Syntax_Syntax.Sig_datacon (((lex_cons), ((ucons1)::(ucons2)::[]), (lex_cons_t), (FStar_Syntax_Const.lex_t_lid), ((Prims.parse_int "0")), ([]), ([]), (r2)))
in (let _158_497 = (let _158_496 = (FStar_TypeChecker_Env.get_range env)
in (((tc)::(dc_lextop)::(dc_lexcons)::[]), ([]), (lids), (_158_496)))
in FStar_Syntax_Syntax.Sig_bundle (_158_497)))))))))))))))
end
| _60_733 -> begin
(let _158_499 = (let _158_498 = (FStar_Syntax_Print.sigelt_to_string (FStar_Syntax_Syntax.Sig_bundle (((ses), ([]), (lids), (FStar_Range.dummyRange)))))
in (FStar_Util.format1 "Unexpected lex_t: %s\n" _158_498))
in (FStar_All.failwith _158_499))
end))))
and tc_assume : FStar_TypeChecker_Env.env  ->  FStar_Ident.lident  ->  FStar_Syntax_Syntax.formula  ->  FStar_Syntax_Syntax.qualifier Prims.list  ->  FStar_Range.range  ->  FStar_Syntax_Syntax.sigelt = (fun env lid phi quals r -> (

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let _60_743 = (FStar_Syntax_Util.type_u ())
in (match (_60_743) with
| (k, _60_742) -> begin
(

let phi = (let _158_505 = (tc_check_trivial_guard env phi k)
in (FStar_All.pipe_right _158_505 (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.Beta)::(FStar_TypeChecker_Normalize.Eager_unfolding)::[]) env)))
in (

let _60_745 = (FStar_TypeChecker_Util.check_uvars r phi)
in FStar_Syntax_Syntax.Sig_assume (((lid), (phi), (quals), (r)))))
end))))
and tc_inductive : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  FStar_Syntax_Syntax.qualifier Prims.list  ->  FStar_Ident.lident Prims.list  ->  FStar_Syntax_Syntax.sigelt Prims.list = (fun env ses quals lids -> (

let warn_positivity = (fun l r -> (let _158_515 = (let _158_514 = (FStar_Syntax_Print.lid_to_string l)
in (FStar_Util.format1 "Positivity check is not yet implemented (%s)" _158_514))
in (FStar_TypeChecker_Errors.diag r _158_515)))
in (

let env0 = env
in (

let tc_tycon = (fun env s -> (match (s) with
| FStar_Syntax_Syntax.Sig_inductive_typ (tc, uvs, tps, k, mutuals, data, quals, r) -> begin
(

let _60_768 = ()
in (

let _60_770 = (warn_positivity tc r)
in (

let _60_774 = (FStar_Syntax_Subst.open_term tps k)
in (match (_60_774) with
| (tps, k) -> begin
(

let _60_779 = (FStar_TypeChecker_TcTerm.tc_binders env tps)
in (match (_60_779) with
| (tps, env_tps, guard_params, us) -> begin
(

let _60_782 = (FStar_Syntax_Util.arrow_formals k)
in (match (_60_782) with
| (indices, t) -> begin
(

let _60_787 = (FStar_TypeChecker_TcTerm.tc_binders env_tps indices)
in (match (_60_787) with
| (indices, env', guard_indices, us') -> begin
(

let _60_795 = (

let _60_792 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env' t)
in (match (_60_792) with
| (t, _60_790, g) -> begin
(let _158_522 = (let _158_521 = (let _158_520 = (FStar_TypeChecker_Rel.conj_guard guard_indices g)
in (FStar_TypeChecker_Rel.conj_guard guard_params _158_520))
in (FStar_TypeChecker_Rel.discharge_guard env' _158_521))
in ((t), (_158_522)))
end))
in (match (_60_795) with
| (t, guard) -> begin
(

let k = (let _158_523 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow indices _158_523))
in (

let _60_799 = (FStar_Syntax_Util.type_u ())
in (match (_60_799) with
| (t_type, u) -> begin
(

let _60_800 = (let _158_524 = (FStar_TypeChecker_Rel.teq env' t t_type)
in (FStar_TypeChecker_Rel.force_trivial_guard env' _158_524))
in (

let t_tc = (let _158_525 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow (FStar_List.append tps indices) _158_525))
in (

let tps = (FStar_Syntax_Subst.close_binders tps)
in (

let k = (FStar_Syntax_Subst.close tps k)
in (

let fv_tc = (FStar_Syntax_Syntax.lid_as_fv tc FStar_Syntax_Syntax.Delta_constant None)
in (let _158_526 = (FStar_TypeChecker_Env.push_let_binding env_tps (FStar_Util.Inr (fv_tc)) (([]), (t_tc)))
in ((_158_526), (FStar_Syntax_Syntax.Sig_inductive_typ (((tc), ([]), (tps), (k), (mutuals), (data), (quals), (r)))), (u), (guard))))))))
end)))
end))
end))
end))
end))
end))))
end
| _60_807 -> begin
(FStar_All.failwith "impossible")
end))
in (

let positive_if_pure = (fun _60_809 l -> ())
in (

let tc_data = (fun env tcs _60_1 -> (match (_60_1) with
| FStar_Syntax_Syntax.Sig_datacon (c, _uvs, t, tc_lid, ntps, quals, _mutual_tcs, r) -> begin
(

let _60_826 = ()
in (

let _60_861 = (

let tps_u_opt = (FStar_Util.find_map tcs (fun _60_830 -> (match (_60_830) with
| (se, u_tc) -> begin
if (let _158_539 = (let _158_538 = (FStar_Syntax_Util.lid_of_sigelt se)
in (FStar_Util.must _158_538))
in (FStar_Ident.lid_equals tc_lid _158_539)) then begin
(

let tps = (match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_60_832, _60_834, tps, _60_837, _60_839, _60_841, _60_843, _60_845) -> begin
(FStar_All.pipe_right tps (FStar_List.map (fun _60_851 -> (match (_60_851) with
| (x, _60_850) -> begin
((x), (Some (FStar_Syntax_Syntax.imp_tag)))
end))))
end
| _60_853 -> begin
(FStar_All.failwith "Impossible")
end)
in Some (((tps), (u_tc))))
end else begin
None
end
end)))
in (match (tps_u_opt) with
| Some (x) -> begin
x
end
| None -> begin
if (FStar_Ident.lid_equals tc_lid FStar_Syntax_Const.exn_lid) then begin
(([]), (FStar_Syntax_Syntax.U_zero))
end else begin
(Prims.raise (FStar_Syntax_Syntax.Error ((("Unexpected data constructor"), (r)))))
end
end))
in (match (_60_861) with
| (tps, u_tc) -> begin
(

let _60_881 = (match ((let _158_541 = (FStar_Syntax_Subst.compress t)
in _158_541.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (bs, res) -> begin
(

let _60_869 = (FStar_Util.first_N ntps bs)
in (match (_60_869) with
| (_60_867, bs') -> begin
(

let t = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow (((bs'), (res)))) None t.FStar_Syntax_Syntax.pos)
in (

let subst = (FStar_All.pipe_right tps (FStar_List.mapi (fun i _60_875 -> (match (_60_875) with
| (x, _60_874) -> begin
FStar_Syntax_Syntax.DB ((((ntps - ((Prims.parse_int "1") + i))), (x)))
end))))
in (let _158_544 = (FStar_Syntax_Subst.subst subst t)
in (FStar_Syntax_Util.arrow_formals _158_544))))
end))
end
| _60_878 -> begin
(([]), (t))
end)
in (match (_60_881) with
| (arguments, result) -> begin
(

let _60_882 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _158_547 = (FStar_Syntax_Print.lid_to_string c)
in (let _158_546 = (FStar_Syntax_Print.binders_to_string "->" arguments)
in (let _158_545 = (FStar_Syntax_Print.term_to_string result)
in (FStar_Util.print3 "Checking datacon  %s : %s -> %s \n" _158_547 _158_546 _158_545))))
end else begin
()
end
in (

let _60_887 = (tc_tparams env arguments)
in (match (_60_887) with
| (arguments, env', us) -> begin
(

let _60_890 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env' result)
in (match (_60_890) with
| (result, res_lcomp) -> begin
(

let _60_895 = (match ((let _158_548 = (FStar_Syntax_Subst.compress res_lcomp.FStar_Syntax_Syntax.res_typ)
in _158_548.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_type (_60_892) -> begin
()
end
| ty -> begin
(let _158_553 = (let _158_552 = (let _158_551 = (let _158_550 = (FStar_Syntax_Print.term_to_string result)
in (let _158_549 = (FStar_Syntax_Print.term_to_string res_lcomp.FStar_Syntax_Syntax.res_typ)
in (FStar_Util.format2 "The type of %s is %s, but since this is the result type of a constructor its type should be Type" _158_550 _158_549)))
in ((_158_551), (r)))
in FStar_Syntax_Syntax.Error (_158_552))
in (Prims.raise _158_553))
end)
in (

let _60_900 = (FStar_Syntax_Util.head_and_args result)
in (match (_60_900) with
| (head, _60_899) -> begin
(

let _60_905 = (match ((let _158_554 = (FStar_Syntax_Subst.compress head)
in _158_554.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_fvar (fv) when (FStar_Syntax_Syntax.fv_eq_lid fv tc_lid) -> begin
()
end
| _60_904 -> begin
(let _158_559 = (let _158_558 = (let _158_557 = (let _158_556 = (FStar_Syntax_Print.lid_to_string tc_lid)
in (let _158_555 = (FStar_Syntax_Print.term_to_string head)
in (FStar_Util.format2 "Expected a constructor of type %s; got %s" _158_556 _158_555)))
in ((_158_557), (r)))
in FStar_Syntax_Syntax.Error (_158_558))
in (Prims.raise _158_559))
end)
in (

let g = (FStar_List.fold_left2 (fun g _60_911 u_x -> (match (_60_911) with
| (x, _60_910) -> begin
(

let _60_913 = ()
in (let _158_563 = (FStar_TypeChecker_Rel.universe_inequality u_x u_tc)
in (FStar_TypeChecker_Rel.conj_guard g _158_563)))
end)) FStar_TypeChecker_Rel.trivial_guard arguments us)
in (

let t = (let _158_567 = (let _158_565 = (FStar_All.pipe_right tps (FStar_List.map (fun _60_919 -> (match (_60_919) with
| (x, _60_918) -> begin
((x), (Some (FStar_Syntax_Syntax.Implicit (true))))
end))))
in (FStar_List.append _158_565 arguments))
in (let _158_566 = (FStar_Syntax_Syntax.mk_Total result)
in (FStar_Syntax_Util.arrow _158_567 _158_566)))
in ((FStar_Syntax_Syntax.Sig_datacon (((c), ([]), (t), (tc_lid), (ntps), (quals), ([]), (r)))), (g)))))
end)))
end))
end)))
end))
end)))
end
| _60_922 -> begin
(FStar_All.failwith "impossible")
end))
in (

let generalize_and_inst_within = (fun env g tcs datas -> (

let _60_928 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (

let binders = (FStar_All.pipe_right tcs (FStar_List.map (fun _60_2 -> (match (_60_2) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_60_932, _60_934, tps, k, _60_938, _60_940, _60_942, _60_944) -> begin
(let _158_578 = (let _158_577 = (FStar_Syntax_Syntax.mk_Total k)
in (FStar_All.pipe_left (FStar_Syntax_Util.arrow tps) _158_577))
in (FStar_Syntax_Syntax.null_binder _158_578))
end
| _60_948 -> begin
(FStar_All.failwith "Impossible")
end))))
in (

let binders' = (FStar_All.pipe_right datas (FStar_List.map (fun _60_3 -> (match (_60_3) with
| FStar_Syntax_Syntax.Sig_datacon (_60_952, _60_954, t, _60_957, _60_959, _60_961, _60_963, _60_965) -> begin
(FStar_Syntax_Syntax.null_binder t)
end
| _60_969 -> begin
(FStar_All.failwith "Impossible")
end))))
in (

let t = (let _158_580 = (FStar_Syntax_Syntax.mk_Total FStar_TypeChecker_Common.t_unit)
in (FStar_Syntax_Util.arrow (FStar_List.append binders binders') _158_580))
in (

let _60_972 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _158_581 = (FStar_TypeChecker_Normalize.term_to_string env t)
in (FStar_Util.print1 "@@@@@@Trying to generalize universes in %s\n" _158_581))
end else begin
()
end
in (

let _60_976 = (FStar_TypeChecker_Util.generalize_universes env t)
in (match (_60_976) with
| (uvs, t) -> begin
(

let _60_978 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _158_585 = (let _158_583 = (FStar_All.pipe_right uvs (FStar_List.map (fun u -> u.FStar_Ident.idText)))
in (FStar_All.pipe_right _158_583 (FStar_String.concat ", ")))
in (let _158_584 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print2 "@@@@@@Generalized to (%s, %s)\n" _158_585 _158_584)))
end else begin
()
end
in (

let _60_982 = (FStar_Syntax_Subst.open_univ_vars uvs t)
in (match (_60_982) with
| (uvs, t) -> begin
(

let _60_986 = (FStar_Syntax_Util.arrow_formals t)
in (match (_60_986) with
| (args, _60_985) -> begin
(

let _60_989 = (FStar_Util.first_N (FStar_List.length binders) args)
in (match (_60_989) with
| (tc_types, data_types) -> begin
(

let tcs = (FStar_List.map2 (fun _60_993 se -> (match (_60_993) with
| (x, _60_992) -> begin
(match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (tc, _60_997, tps, _60_1000, mutuals, datas, quals, r) -> begin
(

let ty = (FStar_Syntax_Subst.close_univ_vars uvs x.FStar_Syntax_Syntax.sort)
in (

let _60_1023 = (match ((let _158_588 = (FStar_Syntax_Subst.compress ty)
in _158_588.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (binders, c) -> begin
(

let _60_1014 = (FStar_Util.first_N (FStar_List.length tps) binders)
in (match (_60_1014) with
| (tps, rest) -> begin
(

let t = (match (rest) with
| [] -> begin
(FStar_Syntax_Util.comp_result c)
end
| _60_1017 -> begin
(let _158_589 = (FStar_ST.read x.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.tk)
in (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow (((rest), (c)))) _158_589 x.FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.pos))
end)
in ((tps), (t)))
end))
end
| _60_1020 -> begin
(([]), (ty))
end)
in (match (_60_1023) with
| (tps, t) -> begin
FStar_Syntax_Syntax.Sig_inductive_typ (((tc), (uvs), (tps), (t), (mutuals), (datas), (quals), (r)))
end)))
end
| _60_1025 -> begin
(FStar_All.failwith "Impossible")
end)
end)) tc_types tcs)
in (

let datas = (match (uvs) with
| [] -> begin
datas
end
| _60_1029 -> begin
(

let uvs_universes = (FStar_All.pipe_right uvs (FStar_List.map (fun _158_590 -> FStar_Syntax_Syntax.U_name (_158_590))))
in (

let tc_insts = (FStar_All.pipe_right tcs (FStar_List.map (fun _60_4 -> (match (_60_4) with
| FStar_Syntax_Syntax.Sig_inductive_typ (tc, _60_1034, _60_1036, _60_1038, _60_1040, _60_1042, _60_1044, _60_1046) -> begin
((tc), (uvs_universes))
end
| _60_1050 -> begin
(FStar_All.failwith "Impossible")
end))))
in (FStar_List.map2 (fun _60_1055 d -> (match (_60_1055) with
| (t, _60_1054) -> begin
(match (d) with
| FStar_Syntax_Syntax.Sig_datacon (l, _60_1059, _60_1061, tc, ntps, quals, mutuals, r) -> begin
(

let ty = (let _158_594 = (FStar_Syntax_InstFV.instantiate tc_insts t.FStar_Syntax_Syntax.sort)
in (FStar_All.pipe_right _158_594 (FStar_Syntax_Subst.close_univ_vars uvs)))
in FStar_Syntax_Syntax.Sig_datacon (((l), (uvs), (ty), (tc), (ntps), (quals), (mutuals), (r))))
end
| _60_1071 -> begin
(FStar_All.failwith "Impossible")
end)
end)) data_types datas)))
end)
in ((tcs), (datas))))
end))
end))
end)))
end))))))))
in (

let _60_1081 = (FStar_All.pipe_right ses (FStar_List.partition (fun _60_5 -> (match (_60_5) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_60_1075) -> begin
true
end
| _60_1078 -> begin
false
end))))
in (match (_60_1081) with
| (tys, datas) -> begin
(

let _60_1088 = if (FStar_All.pipe_right datas (FStar_Util.for_some (fun _60_6 -> (match (_60_6) with
| FStar_Syntax_Syntax.Sig_datacon (_60_1084) -> begin
false
end
| _60_1087 -> begin
true
end)))) then begin
(let _158_599 = (let _158_598 = (let _158_597 = (FStar_TypeChecker_Env.get_range env)
in (("Mutually defined type contains a non-inductive element"), (_158_597)))
in FStar_Syntax_Syntax.Error (_158_598))
in (Prims.raise _158_599))
end else begin
()
end
in (

let env0 = env
in (

let _60_1107 = (FStar_List.fold_right (fun tc _60_1095 -> (match (_60_1095) with
| (env, all_tcs, g) -> begin
(

let _60_1100 = (tc_tycon env tc)
in (match (_60_1100) with
| (env, tc, tc_u, guard) -> begin
(

let g' = (FStar_TypeChecker_Rel.universe_inequality FStar_Syntax_Syntax.U_zero tc_u)
in (

let _60_1102 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _158_602 = (FStar_Syntax_Print.sigelt_to_string tc)
in (FStar_Util.print1 "Checked inductive: %s\n" _158_602))
end else begin
()
end
in (let _158_604 = (let _158_603 = (FStar_TypeChecker_Rel.conj_guard guard g')
in (FStar_TypeChecker_Rel.conj_guard g _158_603))
in ((env), ((((tc), (tc_u)))::all_tcs), (_158_604)))))
end))
end)) tys ((env), ([]), (FStar_TypeChecker_Rel.trivial_guard)))
in (match (_60_1107) with
| (env, tcs, g) -> begin
(

let _60_1117 = (FStar_List.fold_right (fun se _60_1111 -> (match (_60_1111) with
| (datas, g) -> begin
(

let _60_1114 = (tc_data env tcs se)
in (match (_60_1114) with
| (data, g') -> begin
(let _158_607 = (FStar_TypeChecker_Rel.conj_guard g g')
in (((data)::datas), (_158_607)))
end))
end)) datas (([]), (g)))
in (match (_60_1117) with
| (datas, g) -> begin
(

let _60_1120 = (let _158_608 = (FStar_List.map Prims.fst tcs)
in (generalize_and_inst_within env0 g _158_608 datas))
in (match (_60_1120) with
| (tcs, datas) -> begin
(

let sig_bndle = (let _158_610 = (let _158_609 = (FStar_TypeChecker_Env.get_range env0)
in (((FStar_List.append tcs datas)), (quals), (lids), (_158_609)))
in FStar_Syntax_Syntax.Sig_bundle (_158_610))
in (

let datacon_typ = (fun data -> (match (data) with
| FStar_Syntax_Syntax.Sig_datacon (_60_1125, _60_1127, t, _60_1130, _60_1132, _60_1134, _60_1136, _60_1138) -> begin
t
end
| _60_1142 -> begin
(FStar_All.failwith "Impossible!")
end))
in (

let dr = FStar_Range.dummyRange
in (

let optimized_haseq_scheme = (fun _60_1145 -> (

let haseq_ty = (fun usubst us acc ty -> (

let _60_1172 = (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, _60_1154, bs, t, _60_1158, d_lids, _60_1161, _60_1163) -> begin
((lid), (bs), (t), (d_lids))
end
| _60_1167 -> begin
(FStar_All.failwith "Impossible!")
end)
in (match (_60_1172) with
| (lid, bs, t, d_lids) -> begin
(

let bs = (FStar_Syntax_Subst.subst_binders usubst bs)
in (

let t = (let _158_623 = (FStar_Syntax_Subst.shift_subst (FStar_List.length bs) usubst)
in (FStar_Syntax_Subst.subst _158_623 t))
in (

let _60_1177 = (FStar_Syntax_Subst.open_term bs t)
in (match (_60_1177) with
| (bs, t) -> begin
(

let ibs = (match ((let _158_624 = (FStar_Syntax_Subst.compress t)
in _158_624.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (ibs, _60_1180) -> begin
ibs
end
| _60_1184 -> begin
[]
end)
in (

let ibs = (FStar_Syntax_Subst.open_binders ibs)
in (

let ind = (let _158_627 = (FStar_Syntax_Syntax.fvar lid FStar_Syntax_Syntax.Delta_constant None)
in (let _158_626 = (FStar_List.map (fun u -> FStar_Syntax_Syntax.U_name (u)) us)
in (FStar_Syntax_Syntax.mk_Tm_uinst _158_627 _158_626)))
in (

let ind = (let _158_630 = (FStar_List.map (fun _60_1191 -> (match (_60_1191) with
| (bv, aq) -> begin
(let _158_629 = (FStar_Syntax_Syntax.bv_to_name bv)
in ((_158_629), (aq)))
end)) bs)
in (FStar_Syntax_Syntax.mk_Tm_app ind _158_630 None dr))
in (

let ind = (let _158_633 = (FStar_List.map (fun _60_1195 -> (match (_60_1195) with
| (bv, aq) -> begin
(let _158_632 = (FStar_Syntax_Syntax.bv_to_name bv)
in ((_158_632), (aq)))
end)) ibs)
in (FStar_Syntax_Syntax.mk_Tm_app ind _158_633 None dr))
in (

let haseq_ind = (let _158_635 = (let _158_634 = (FStar_Syntax_Syntax.as_arg ind)
in (_158_634)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.t_haseq _158_635 None dr))
in (

let bs' = (FStar_List.filter (fun b -> (

let _60_1206 = acc
in (match (_60_1206) with
| (_60_1200, en, _60_1203, _60_1205) -> begin
(

let opt = (let _158_638 = (let _158_637 = (FStar_Syntax_Util.type_u ())
in (Prims.fst _158_637))
in (FStar_TypeChecker_Rel.try_subtype' en (Prims.fst b).FStar_Syntax_Syntax.sort _158_638 false))
in (match (opt) with
| None -> begin
false
end
| Some (_60_1210) -> begin
true
end))
end))) bs)
in (

let haseq_bs = (FStar_List.fold_left (fun t b -> (let _158_644 = (let _158_643 = (let _158_642 = (let _158_641 = (FStar_Syntax_Syntax.bv_to_name (Prims.fst b))
in (FStar_Syntax_Syntax.as_arg _158_641))
in (_158_642)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.t_haseq _158_643 None dr))
in (FStar_Syntax_Util.mk_conj t _158_644))) FStar_Syntax_Util.t_true bs')
in (

let fml = (FStar_Syntax_Util.mk_imp haseq_bs haseq_ind)
in (

let fml = (

let _60_1217 = fml
in (let _158_650 = (let _158_649 = (let _158_648 = (let _158_647 = (let _158_646 = (let _158_645 = (FStar_Syntax_Syntax.as_arg haseq_ind)
in (_158_645)::[])
in (_158_646)::[])
in FStar_Syntax_Syntax.Meta_pattern (_158_647))
in ((fml), (_158_648)))
in FStar_Syntax_Syntax.Tm_meta (_158_649))
in {FStar_Syntax_Syntax.n = _158_650; FStar_Syntax_Syntax.tk = _60_1217.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _60_1217.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _60_1217.FStar_Syntax_Syntax.vars}))
in (

let fml = (FStar_List.fold_right (fun b t -> (let _158_656 = (let _158_655 = (let _158_654 = (let _158_653 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_653 None))
in (FStar_Syntax_Syntax.as_arg _158_654))
in (_158_655)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_656 None dr))) ibs fml)
in (

let fml = (FStar_List.fold_right (fun b t -> (let _158_662 = (let _158_661 = (let _158_660 = (let _158_659 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_659 None))
in (FStar_Syntax_Syntax.as_arg _158_660))
in (_158_661)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_662 None dr))) bs fml)
in (

let guard = (FStar_Syntax_Util.mk_conj haseq_bs fml)
in (

let _60_1231 = acc
in (match (_60_1231) with
| (l_axioms, env, guard', cond') -> begin
(

let env = (FStar_TypeChecker_Env.push_binders env bs)
in (

let env = (FStar_TypeChecker_Env.push_binders env ibs)
in (

let t_datas = (FStar_List.filter (fun s -> (match (s) with
| FStar_Syntax_Syntax.Sig_datacon (_60_1236, _60_1238, _60_1240, t_lid, _60_1243, _60_1245, _60_1247, _60_1249) -> begin
(t_lid = lid)
end
| _60_1253 -> begin
(FStar_All.failwith "Impossible")
end)) datas)
in (

let haseq_data = (fun data -> (

let dt = (datacon_typ data)
in (

let dt = (FStar_Syntax_Subst.subst usubst dt)
in (match ((let _158_666 = (FStar_Syntax_Subst.compress dt)
in _158_666.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (dbs, _60_1261) -> begin
(

let dbs = (let _158_667 = (FStar_List.splitAt (FStar_List.length bs) dbs)
in (Prims.snd _158_667))
in (

let dbs = (let _158_668 = (FStar_Syntax_Subst.opening_of_binders bs)
in (FStar_Syntax_Subst.subst_binders _158_668 dbs))
in (

let dbs = (FStar_Syntax_Subst.open_binders dbs)
in (

let cond = (FStar_List.fold_left (fun t b -> (

let haseq_b = (let _158_672 = (let _158_671 = (FStar_Syntax_Syntax.as_arg (Prims.fst b).FStar_Syntax_Syntax.sort)
in (_158_671)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.t_haseq _158_672 None dr))
in (

let sort_range = (Prims.fst b).FStar_Syntax_Syntax.sort.FStar_Syntax_Syntax.pos
in (

let haseq_b = (let _158_674 = (let _158_673 = (FStar_Syntax_Print.term_to_string ind)
in (FStar_Util.format1 "Failed to prove that the type \'%s\' supports decidable equality because of this argument; add the \'noeq\' qualifier" _158_673))
in (FStar_TypeChecker_Util.label _158_674 sort_range haseq_b))
in (FStar_Syntax_Util.mk_conj t haseq_b))))) FStar_Syntax_Util.t_true dbs)
in (FStar_List.fold_right (fun b t -> (let _158_680 = (let _158_679 = (let _158_678 = (let _158_677 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_677 None))
in (FStar_Syntax_Syntax.as_arg _158_678))
in (_158_679)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_680 None dr))) dbs cond)))))
end
| _60_1276 -> begin
FStar_Syntax_Util.t_true
end))))
in (

let cond = (FStar_List.fold_left (fun acc d -> (let _158_683 = (haseq_data d)
in (FStar_Syntax_Util.mk_conj acc _158_683))) FStar_Syntax_Util.t_true t_datas)
in (

let axiom_lid = (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns (((FStar_Ident.id_of_text (Prims.strcat lid.FStar_Ident.ident.FStar_Ident.idText "_haseq")))::[])))
in (let _158_685 = (FStar_Syntax_Util.mk_conj guard' guard)
in (let _158_684 = (FStar_Syntax_Util.mk_conj cond' cond)
in (((FStar_List.append l_axioms ((((axiom_lid), (fml)))::[]))), (env), (_158_685), (_158_684))))))))))
end)))))))))))))))
end))))
end)))
in (

let us = (

let ty = (FStar_List.hd tcs)
in (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (_60_1283, us, _60_1286, _60_1288, _60_1290, _60_1292, _60_1294, _60_1296) -> begin
us
end
| _60_1300 -> begin
(FStar_All.failwith "Impossible!")
end))
in (

let _60_1304 = (FStar_Syntax_Subst.univ_var_opening us)
in (match (_60_1304) with
| (usubst, us) -> begin
(

let env = (FStar_TypeChecker_Env.push_sigelt env0 sig_bndle)
in (

let _60_1306 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.push "haseq")
in (

let _60_1308 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_sig env sig_bndle)
in (

let env = (FStar_TypeChecker_Env.push_univ_vars env us)
in (

let _60_1315 = (FStar_List.fold_left (haseq_ty usubst us) (([]), (env), (FStar_Syntax_Util.t_true), (FStar_Syntax_Util.t_true)) tcs)
in (match (_60_1315) with
| (axioms, env, guard, cond) -> begin
(

let phi = (FStar_Syntax_Util.mk_imp guard cond)
in (

let _60_1320 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env phi)
in (match (_60_1320) with
| (phi, _60_1319) -> begin
(

let _60_1321 = if (FStar_TypeChecker_Env.should_verify env) then begin
(let _158_686 = (FStar_TypeChecker_Rel.guard_of_guard_formula (FStar_TypeChecker_Common.NonTrivial (phi)))
in (FStar_TypeChecker_Rel.force_trivial_guard env _158_686))
end else begin
()
end
in (

let ses = (FStar_List.fold_left (fun l _60_1326 -> (match (_60_1326) with
| (lid, fml) -> begin
(

let se = (tc_assume env lid fml [] dr)
in (FStar_List.append l ((se)::[])))
end)) [] axioms)
in (

let _60_1329 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.pop "haseq")
in ses)))
end)))
end))))))
end)))))
in (

let unoptimized_haseq_scheme = (fun _60_1332 -> (

let mutuals = (FStar_List.map (fun ty -> (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, _60_1337, _60_1339, _60_1341, _60_1343, _60_1345, _60_1347, _60_1349) -> begin
lid
end
| _60_1353 -> begin
(FStar_All.failwith "Impossible!")
end)) tcs)
in (

let haseq_ty = (fun usubst us acc ty -> (

let _60_1380 = (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, _60_1362, bs, t, _60_1366, d_lids, _60_1369, _60_1371) -> begin
((lid), (bs), (t), (d_lids))
end
| _60_1375 -> begin
(FStar_All.failwith "Impossible!")
end)
in (match (_60_1380) with
| (lid, bs, t, d_lids) -> begin
(

let bs = (FStar_Syntax_Subst.subst_binders usubst bs)
in (

let t = (let _158_700 = (FStar_Syntax_Subst.shift_subst (FStar_List.length bs) usubst)
in (FStar_Syntax_Subst.subst _158_700 t))
in (

let _60_1385 = (FStar_Syntax_Subst.open_term bs t)
in (match (_60_1385) with
| (bs, t) -> begin
(

let ibs = (match ((let _158_701 = (FStar_Syntax_Subst.compress t)
in _158_701.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (ibs, _60_1388) -> begin
ibs
end
| _60_1392 -> begin
[]
end)
in (

let ibs = (FStar_Syntax_Subst.open_binders ibs)
in (

let ind = (let _158_704 = (FStar_Syntax_Syntax.fvar lid FStar_Syntax_Syntax.Delta_constant None)
in (let _158_703 = (FStar_List.map (fun u -> FStar_Syntax_Syntax.U_name (u)) us)
in (FStar_Syntax_Syntax.mk_Tm_uinst _158_704 _158_703)))
in (

let ind = (let _158_707 = (FStar_List.map (fun _60_1399 -> (match (_60_1399) with
| (bv, aq) -> begin
(let _158_706 = (FStar_Syntax_Syntax.bv_to_name bv)
in ((_158_706), (aq)))
end)) bs)
in (FStar_Syntax_Syntax.mk_Tm_app ind _158_707 None dr))
in (

let ind = (let _158_710 = (FStar_List.map (fun _60_1403 -> (match (_60_1403) with
| (bv, aq) -> begin
(let _158_709 = (FStar_Syntax_Syntax.bv_to_name bv)
in ((_158_709), (aq)))
end)) ibs)
in (FStar_Syntax_Syntax.mk_Tm_app ind _158_710 None dr))
in (

let haseq_ind = (let _158_712 = (let _158_711 = (FStar_Syntax_Syntax.as_arg ind)
in (_158_711)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.t_haseq _158_712 None dr))
in (

let rec is_mutual = (fun t -> (match ((let _158_716 = (FStar_Syntax_Subst.compress t)
in _158_716.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_fvar (fv) -> begin
(FStar_List.existsb (fun lid -> (FStar_Ident.lid_equals lid fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)) mutuals)
end
| FStar_Syntax_Syntax.Tm_uinst (t', _60_1414) -> begin
(is_mutual t')
end
| FStar_Syntax_Syntax.Tm_refine (bv, t') -> begin
(is_mutual bv.FStar_Syntax_Syntax.sort)
end
| FStar_Syntax_Syntax.Tm_app (t', args) -> begin
if (is_mutual t') then begin
true
end else begin
(let _158_718 = (FStar_List.map Prims.fst args)
in (exists_mutual _158_718))
end
end
| FStar_Syntax_Syntax.Tm_meta (t', _60_1427) -> begin
(is_mutual t')
end
| _60_1431 -> begin
false
end))
and exists_mutual = (fun _60_7 -> (match (_60_7) with
| [] -> begin
false
end
| (hd)::tl -> begin
((is_mutual hd) || (exists_mutual tl))
end))
in (

let haseq_data = (fun acc data -> (

let dt = (datacon_typ data)
in (

let dt = (FStar_Syntax_Subst.subst usubst dt)
in (match ((let _158_724 = (FStar_Syntax_Subst.compress dt)
in _158_724.FStar_Syntax_Syntax.n)) with
| FStar_Syntax_Syntax.Tm_arrow (dbs, _60_1444) -> begin
(

let dbs = (let _158_725 = (FStar_List.splitAt (FStar_List.length bs) dbs)
in (Prims.snd _158_725))
in (

let dbs = (let _158_726 = (FStar_Syntax_Subst.opening_of_binders bs)
in (FStar_Syntax_Subst.subst_binders _158_726 dbs))
in (

let dbs = (FStar_Syntax_Subst.open_binders dbs)
in (

let cond = (FStar_List.fold_left (fun t b -> (

let sort = (Prims.fst b).FStar_Syntax_Syntax.sort
in (

let haseq_sort = (let _158_730 = (let _158_729 = (FStar_Syntax_Syntax.as_arg (Prims.fst b).FStar_Syntax_Syntax.sort)
in (_158_729)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.t_haseq _158_730 None dr))
in (

let haseq_sort = if (is_mutual sort) then begin
(FStar_Syntax_Util.mk_imp haseq_ind haseq_sort)
end else begin
haseq_sort
end
in (FStar_Syntax_Util.mk_conj t haseq_sort))))) FStar_Syntax_Util.t_true dbs)
in (

let cond = (FStar_List.fold_right (fun b t -> (let _158_736 = (let _158_735 = (let _158_734 = (let _158_733 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_733 None))
in (FStar_Syntax_Syntax.as_arg _158_734))
in (_158_735)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_736 None dr))) dbs cond)
in (FStar_Syntax_Util.mk_conj acc cond))))))
end
| _60_1460 -> begin
acc
end))))
in (

let t_datas = (FStar_List.filter (fun s -> (match (s) with
| FStar_Syntax_Syntax.Sig_datacon (_60_1463, _60_1465, _60_1467, t_lid, _60_1470, _60_1472, _60_1474, _60_1476) -> begin
(t_lid = lid)
end
| _60_1480 -> begin
(FStar_All.failwith "Impossible")
end)) datas)
in (

let data_cond = (FStar_List.fold_left haseq_data FStar_Syntax_Util.t_true t_datas)
in (

let fml = (FStar_Syntax_Util.mk_imp data_cond haseq_ind)
in (

let fml = (

let _60_1484 = fml
in (let _158_743 = (let _158_742 = (let _158_741 = (let _158_740 = (let _158_739 = (let _158_738 = (FStar_Syntax_Syntax.as_arg haseq_ind)
in (_158_738)::[])
in (_158_739)::[])
in FStar_Syntax_Syntax.Meta_pattern (_158_740))
in ((fml), (_158_741)))
in FStar_Syntax_Syntax.Tm_meta (_158_742))
in {FStar_Syntax_Syntax.n = _158_743; FStar_Syntax_Syntax.tk = _60_1484.FStar_Syntax_Syntax.tk; FStar_Syntax_Syntax.pos = _60_1484.FStar_Syntax_Syntax.pos; FStar_Syntax_Syntax.vars = _60_1484.FStar_Syntax_Syntax.vars}))
in (

let fml = (FStar_List.fold_right (fun b t -> (let _158_749 = (let _158_748 = (let _158_747 = (let _158_746 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_746 None))
in (FStar_Syntax_Syntax.as_arg _158_747))
in (_158_748)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_749 None dr))) ibs fml)
in (

let fml = (FStar_List.fold_right (fun b t -> (let _158_755 = (let _158_754 = (let _158_753 = (let _158_752 = (FStar_Syntax_Subst.close ((b)::[]) t)
in (FStar_Syntax_Util.abs (((((Prims.fst b)), (None)))::[]) _158_752 None))
in (FStar_Syntax_Syntax.as_arg _158_753))
in (_158_754)::[])
in (FStar_Syntax_Syntax.mk_Tm_app FStar_Syntax_Util.tforall _158_755 None dr))) bs fml)
in (FStar_Syntax_Util.mk_conj acc fml)))))))))))))))
end))))
end)))
in (

let _60_1514 = (

let ty = (FStar_List.hd tcs)
in (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, us, _60_1497, _60_1499, _60_1501, _60_1503, _60_1505, _60_1507) -> begin
((lid), (us))
end
| _60_1511 -> begin
(FStar_All.failwith "Impossible!")
end))
in (match (_60_1514) with
| (lid, us) -> begin
(

let _60_1517 = (FStar_Syntax_Subst.univ_var_opening us)
in (match (_60_1517) with
| (usubst, us) -> begin
(

let fml = (FStar_List.fold_left (haseq_ty usubst us) FStar_Syntax_Util.t_true tcs)
in (

let env = (FStar_TypeChecker_Env.push_sigelt env0 sig_bndle)
in (

let _60_1520 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.push "haseq")
in (

let _60_1522 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_sig env sig_bndle)
in (

let env = (FStar_TypeChecker_Env.push_univ_vars env us)
in (

let se = (let _158_756 = (FStar_Ident.lid_of_ids (FStar_List.append lid.FStar_Ident.ns (((FStar_Ident.id_of_text (Prims.strcat lid.FStar_Ident.ident.FStar_Ident.idText "_haseq")))::[])))
in (tc_assume env _158_756 fml [] dr))
in (

let _60_1526 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.pop "haseq")
in (se)::[])))))))
end))
end)))))
in (

let skip_prims_type = (fun _60_1529 -> (

let lid = (

let ty = (FStar_List.hd tcs)
in (match (ty) with
| FStar_Syntax_Syntax.Sig_inductive_typ (lid, _60_1534, _60_1536, _60_1538, _60_1540, _60_1542, _60_1544, _60_1546) -> begin
lid
end
| _60_1550 -> begin
(FStar_All.failwith "Impossible")
end))
in (

let types_to_skip = ("c_False")::("c_True")::("equals")::("h_equals")::("c_and")::("c_or")::[]
in (FStar_List.existsb (fun s -> (s = lid.FStar_Ident.ident.FStar_Ident.idText)) types_to_skip))))
in (

let is_noeq = (FStar_List.existsb (fun q -> (q = FStar_Syntax_Syntax.Noeq)) quals)
in if ((((FStar_List.length tcs) = (Prims.parse_int "0")) || ((FStar_Ident.lid_equals env.FStar_TypeChecker_Env.curmodule FStar_Syntax_Const.prims_lid) && (skip_prims_type ()))) || is_noeq) then begin
(sig_bndle)::[]
end else begin
(

let is_unopteq = (FStar_List.existsb (fun q -> (q = FStar_Syntax_Syntax.Unopteq)) quals)
in (

let ses = if is_unopteq then begin
(unoptimized_haseq_scheme ())
end else begin
(optimized_haseq_scheme ())
end
in (let _158_764 = (let _158_763 = (let _158_762 = (FStar_TypeChecker_Env.get_range env0)
in (((FStar_List.append tcs datas)), (quals), (lids), (_158_762)))
in FStar_Syntax_Syntax.Sig_bundle (_158_763))
in (_158_764)::ses)))
end)))))))
end))
end))
end))))
end)))))))))
and tc_decl : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env se -> (

let env = (set_hint_correlator env se)
in (

let _60_1562 = (FStar_TypeChecker_Util.check_sigelt_quals env se)
in (match (se) with
| (FStar_Syntax_Syntax.Sig_inductive_typ (_)) | (FStar_Syntax_Syntax.Sig_datacon (_)) -> begin
(FStar_All.failwith "Impossible bare data-constructor")
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, lids, r) when (FStar_All.pipe_right lids (FStar_Util.for_some (FStar_Ident.lid_equals FStar_Syntax_Const.lex_t_lid))) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let se = (tc_lex_t env ses quals lids)
in (let _158_767 = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (_158_767)))))
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, lids, r) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let ses = (tc_inductive env ses quals lids)
in (

let env = (FStar_List.fold_left (fun env' se -> (FStar_TypeChecker_Env.push_sigelt env' se)) env ses)
in ((ses), (env)))))
end
| FStar_Syntax_Syntax.Sig_pragma (p, r) -> begin
(

let set_options = (fun t s -> (match ((FStar_Options.set_options t s)) with
| FStar_Getopt.Success -> begin
()
end
| FStar_Getopt.Help -> begin
(Prims.raise (FStar_Syntax_Syntax.Error ((("Failed to process pragma: use \'fstar --help\' to see which options are available"), (r)))))
end
| FStar_Getopt.Error (s) -> begin
(Prims.raise (FStar_Syntax_Syntax.Error ((((Prims.strcat "Failed to process pragma: " s)), (r)))))
end))
in (match (p) with
| FStar_Syntax_Syntax.SetOptions (o) -> begin
(

let _60_1602 = (set_options FStar_Options.Set o)
in (((se)::[]), (env)))
end
| FStar_Syntax_Syntax.ResetOptions (sopt) -> begin
(

let _60_1606 = (let _158_774 = (FStar_Options.restore_cmd_line_options false)
in (FStar_All.pipe_right _158_774 Prims.ignore))
in (

let _60_1611 = (match (sopt) with
| None -> begin
()
end
| Some (s) -> begin
(set_options FStar_Options.Reset s)
end)
in (

let _60_1613 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.refresh ())
in (((se)::[]), (env)))))
end))
end
| FStar_Syntax_Syntax.Sig_new_effect_for_free (_60_1616) -> begin
(FStar_All.failwith "impossible")
end
| FStar_Syntax_Syntax.Sig_new_effect (ne, r) -> begin
(

let ne = (tc_eff_decl env ne)
in (

let se = FStar_Syntax_Syntax.Sig_new_effect (((ne), (r)))
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (

let _60_1632 = (FStar_All.pipe_right ne.FStar_Syntax_Syntax.actions (FStar_List.fold_left (fun _60_1627 a -> (match (_60_1627) with
| (env, ses) -> begin
(

let se_let = (FStar_Syntax_Util.action_as_lb a)
in (let _158_777 = (FStar_TypeChecker_Env.push_sigelt env se_let)
in ((_158_777), ((se_let)::ses))))
end)) ((env), ((se)::[]))))
in (match (_60_1632) with
| (env, ses) -> begin
(((se)::[]), (env))
end)))))
end
| FStar_Syntax_Syntax.Sig_sub_effect (sub, r) -> begin
(

let ed_src = (FStar_TypeChecker_Env.get_effect_decl env sub.FStar_Syntax_Syntax.source)
in (

let ed_tgt = (FStar_TypeChecker_Env.get_effect_decl env sub.FStar_Syntax_Syntax.target)
in (

let _60_1641 = (let _158_778 = (FStar_TypeChecker_Env.lookup_effect_lid env sub.FStar_Syntax_Syntax.source)
in (monad_signature env sub.FStar_Syntax_Syntax.source _158_778))
in (match (_60_1641) with
| (a, wp_a_src) -> begin
(

let _60_1644 = (let _158_779 = (FStar_TypeChecker_Env.lookup_effect_lid env sub.FStar_Syntax_Syntax.target)
in (monad_signature env sub.FStar_Syntax_Syntax.target _158_779))
in (match (_60_1644) with
| (b, wp_b_tgt) -> begin
(

let wp_a_tgt = (let _158_783 = (let _158_782 = (let _158_781 = (let _158_780 = (FStar_Syntax_Syntax.bv_to_name a)
in ((b), (_158_780)))
in FStar_Syntax_Syntax.NT (_158_781))
in (_158_782)::[])
in (FStar_Syntax_Subst.subst _158_783 wp_b_tgt))
in (

let expected_k = (let _158_788 = (let _158_786 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_785 = (let _158_784 = (FStar_Syntax_Syntax.null_binder wp_a_src)
in (_158_784)::[])
in (_158_786)::_158_785))
in (let _158_787 = (FStar_Syntax_Syntax.mk_Total wp_a_tgt)
in (FStar_Syntax_Util.arrow _158_788 _158_787)))
in (

let repr_type = (fun eff_name a wp -> (

let no_reify = (fun l -> (let _158_800 = (let _158_799 = (let _158_798 = (FStar_Util.format1 "Effect %s cannot be reified" l.FStar_Ident.str)
in (let _158_797 = (FStar_TypeChecker_Env.get_range env)
in ((_158_798), (_158_797))))
in FStar_Syntax_Syntax.Error (_158_799))
in (Prims.raise _158_800)))
in (match ((FStar_TypeChecker_Env.effect_decl_opt env eff_name)) with
| None -> begin
(no_reify eff_name)
end
| Some (ed) -> begin
(

let repr = (FStar_TypeChecker_Env.inst_effect_fun_with ((FStar_Syntax_Syntax.U_unknown)::[]) env ed (([]), (ed.FStar_Syntax_Syntax.repr)))
in if (not ((FStar_All.pipe_right ed.FStar_Syntax_Syntax.qualifiers (FStar_List.contains FStar_Syntax_Syntax.Reifiable)))) then begin
(no_reify eff_name)
end else begin
(let _158_807 = (let _158_805 = (let _158_804 = (let _158_803 = (FStar_Syntax_Syntax.as_arg a)
in (let _158_802 = (let _158_801 = (FStar_Syntax_Syntax.as_arg wp)
in (_158_801)::[])
in (_158_803)::_158_802))
in ((repr), (_158_804)))
in FStar_Syntax_Syntax.Tm_app (_158_805))
in (let _158_806 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Syntax_Syntax.mk _158_807 None _158_806)))
end)
end)))
in (

let _60_1685 = (match (((sub.FStar_Syntax_Syntax.lift), (sub.FStar_Syntax_Syntax.lift_wp))) with
| (None, None) -> begin
(FStar_All.failwith "Impossible")
end
| (lift, Some (_60_1662, lift_wp)) -> begin
(let _158_808 = (check_and_gen env lift_wp expected_k)
in ((lift), (_158_808)))
end
| (Some (what, lift), None) -> begin
(

let dmff_env = (FStar_TypeChecker_DMFF.empty env (FStar_TypeChecker_TcTerm.tc_constant FStar_Range.dummyRange))
in (

let _60_1678 = (FStar_TypeChecker_DMFF.star_expr dmff_env lift)
in (match (_60_1678) with
| (_60_1675, lift_wp, lift_elab) -> begin
(

let _60_1679 = (recheck_debug "lift-wp" env lift_wp)
in (

let _60_1681 = (recheck_debug "lift-elab" env lift_elab)
in ((Some ((([]), (lift_elab)))), ((([]), (lift_wp))))))
end)))
end)
in (match (_60_1685) with
| (lift, lift_wp) -> begin
(

let lax = env.FStar_TypeChecker_Env.lax
in (

let env = (

let _60_1687 = env
in {FStar_TypeChecker_Env.solver = _60_1687.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_1687.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_1687.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_1687.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_1687.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_1687.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_1687.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_1687.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_1687.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_1687.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_1687.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_1687.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_1687.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_1687.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_1687.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_1687.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_1687.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_1687.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = _60_1687.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_1687.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_1687.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_1687.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_1687.FStar_TypeChecker_Env.qname_and_index})
in (

let lift = (match (lift) with
| None -> begin
None
end
| Some (_60_1692, lift) -> begin
(

let _60_1698 = (let _158_809 = (FStar_TypeChecker_Env.lookup_effect_lid env sub.FStar_Syntax_Syntax.source)
in (monad_signature env sub.FStar_Syntax_Syntax.source _158_809))
in (match (_60_1698) with
| (a, wp_a_src) -> begin
(

let wp_a = (FStar_Syntax_Syntax.new_bv None wp_a_src)
in (

let a_typ = (FStar_Syntax_Syntax.bv_to_name a)
in (

let wp_a_typ = (FStar_Syntax_Syntax.bv_to_name wp_a)
in (

let repr_f = (repr_type sub.FStar_Syntax_Syntax.source a_typ wp_a_typ)
in (

let repr_result = (

let lift_wp = (FStar_TypeChecker_Normalize.normalize ((FStar_TypeChecker_Normalize.EraseUniverses)::(FStar_TypeChecker_Normalize.AllowUnboundUniverses)::[]) env (Prims.snd lift_wp))
in (

let lift_wp_a = (let _158_816 = (let _158_814 = (let _158_813 = (let _158_812 = (FStar_Syntax_Syntax.as_arg a_typ)
in (let _158_811 = (let _158_810 = (FStar_Syntax_Syntax.as_arg wp_a_typ)
in (_158_810)::[])
in (_158_812)::_158_811))
in ((lift_wp), (_158_813)))
in FStar_Syntax_Syntax.Tm_app (_158_814))
in (let _158_815 = (FStar_TypeChecker_Env.get_range env)
in (FStar_Syntax_Syntax.mk _158_816 None _158_815)))
in (repr_type sub.FStar_Syntax_Syntax.target a_typ lift_wp_a)))
in (

let expected_k = (let _158_823 = (let _158_821 = (FStar_Syntax_Syntax.mk_binder a)
in (let _158_820 = (let _158_819 = (FStar_Syntax_Syntax.mk_binder wp_a)
in (let _158_818 = (let _158_817 = (FStar_Syntax_Syntax.null_binder repr_f)
in (_158_817)::[])
in (_158_819)::_158_818))
in (_158_821)::_158_820))
in (let _158_822 = (FStar_Syntax_Syntax.mk_Total repr_result)
in (FStar_Syntax_Util.arrow _158_823 _158_822)))
in (

let _60_1712 = (FStar_TypeChecker_TcTerm.tc_tot_or_gtot_term env expected_k)
in (match (_60_1712) with
| (expected_k, _60_1709, _60_1711) -> begin
(

let lift = (check_and_gen env lift expected_k)
in Some (lift))
end))))))))
end))
end)
in (

let env = (

let _60_1715 = env
in {FStar_TypeChecker_Env.solver = _60_1715.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_1715.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_1715.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_1715.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_1715.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_1715.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_1715.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_1715.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_1715.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_1715.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_1715.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_1715.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_1715.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_1715.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_1715.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_1715.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_1715.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_1715.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = lax; FStar_TypeChecker_Env.lax_universes = _60_1715.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_1715.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_1715.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_1715.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_1715.FStar_TypeChecker_Env.qname_and_index})
in (

let sub = (

let _60_1718 = sub
in {FStar_Syntax_Syntax.source = _60_1718.FStar_Syntax_Syntax.source; FStar_Syntax_Syntax.target = _60_1718.FStar_Syntax_Syntax.target; FStar_Syntax_Syntax.lift_wp = Some (lift_wp); FStar_Syntax_Syntax.lift = lift})
in (

let se = FStar_Syntax_Syntax.Sig_sub_effect (((sub), (r)))
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (env)))))))))
end)))))
end))
end))))
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (lid, uvs, tps, c, tags, flags, r) -> begin
(

let _60_1732 = ()
in (

let env0 = env
in (

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let _60_1738 = (FStar_Syntax_Subst.open_comp tps c)
in (match (_60_1738) with
| (tps, c) -> begin
(

let _60_1742 = (tc_tparams env tps)
in (match (_60_1742) with
| (tps, env, us) -> begin
(

let _60_1746 = (FStar_TypeChecker_TcTerm.tc_comp env c)
in (match (_60_1746) with
| (c, u, g) -> begin
(

let _60_1747 = (FStar_TypeChecker_Rel.force_trivial_guard env g)
in (

let tps = (FStar_Syntax_Subst.close_binders tps)
in (

let c = (FStar_Syntax_Subst.close_comp tps c)
in (

let _60_1753 = (let _158_824 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow (((tps), (c)))) None r)
in (FStar_TypeChecker_Util.generalize_universes env0 _158_824))
in (match (_60_1753) with
| (uvs, t) -> begin
(

let _60_1772 = (match ((let _158_826 = (let _158_825 = (FStar_Syntax_Subst.compress t)
in _158_825.FStar_Syntax_Syntax.n)
in ((tps), (_158_826)))) with
| ([], FStar_Syntax_Syntax.Tm_arrow (_60_1756, c)) -> begin
(([]), (c))
end
| (_60_1762, FStar_Syntax_Syntax.Tm_arrow (tps, c)) -> begin
((tps), (c))
end
| _60_1769 -> begin
(FStar_All.failwith "Impossible")
end)
in (match (_60_1772) with
| (tps, c) -> begin
(

let _60_1777 = if (((FStar_List.length uvs) <> (Prims.parse_int "1")) && (not ((FStar_Ident.lid_equals lid FStar_Syntax_Const.effect_Lemma_lid)))) then begin
(

let _60_1776 = (FStar_Syntax_Subst.open_univ_vars uvs t)
in (match (_60_1776) with
| (_60_1774, t) -> begin
(let _158_832 = (let _158_831 = (let _158_830 = (let _158_829 = (FStar_Syntax_Print.lid_to_string lid)
in (let _158_828 = (FStar_All.pipe_right (FStar_List.length uvs) FStar_Util.string_of_int)
in (let _158_827 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.format3 "Effect abbreviations must be polymorphic in exactly 1 universe; %s has %s universes (%s)" _158_829 _158_828 _158_827))))
in ((_158_830), (r)))
in FStar_Syntax_Syntax.Error (_158_831))
in (Prims.raise _158_832))
end))
end else begin
()
end
in (

let se = FStar_Syntax_Syntax.Sig_effect_abbrev (((lid), (uvs), (tps), (c), (tags), (flags), (r)))
in (

let env = (FStar_TypeChecker_Env.push_sigelt env0 se)
in (((se)::[]), (env)))))
end))
end)))))
end))
end))
end)))))
end
| FStar_Syntax_Syntax.Sig_declare_typ (lid, uvs, t, quals, r) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let _60_1789 = ()
in (

let _60_1793 = (let _158_834 = (let _158_833 = (FStar_Syntax_Util.type_u ())
in (Prims.fst _158_833))
in (check_and_gen env t _158_834))
in (match (_60_1793) with
| (uvs, t) -> begin
(

let se = FStar_Syntax_Syntax.Sig_declare_typ (((lid), (uvs), (t), (quals), (r)))
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (env))))
end))))
end
| FStar_Syntax_Syntax.Sig_assume (lid, phi, quals, r) -> begin
(

let se = (tc_assume env lid phi quals r)
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (env))))
end
| FStar_Syntax_Syntax.Sig_main (e, r) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let env = (FStar_TypeChecker_Env.set_expected_typ env FStar_TypeChecker_Common.t_unit)
in (

let _60_1813 = (FStar_TypeChecker_TcTerm.tc_term env e)
in (match (_60_1813) with
| (e, c, g1) -> begin
(

let _60_1818 = (let _158_838 = (let _158_835 = (FStar_Syntax_Util.ml_comp FStar_TypeChecker_Common.t_unit r)
in Some (_158_835))
in (let _158_837 = (let _158_836 = (c.FStar_Syntax_Syntax.comp ())
in ((e), (_158_836)))
in (FStar_TypeChecker_TcTerm.check_expected_effect env _158_838 _158_837)))
in (match (_60_1818) with
| (e, _60_1816, g) -> begin
(

let _60_1819 = (let _158_839 = (FStar_TypeChecker_Rel.conj_guard g1 g)
in (FStar_TypeChecker_Rel.force_trivial_guard env _158_839))
in (

let se = FStar_Syntax_Syntax.Sig_main (((e), (r)))
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (env)))))
end))
end))))
end
| FStar_Syntax_Syntax.Sig_let (lbs, r, lids, quals) -> begin
(

let env = (FStar_TypeChecker_Env.set_range env r)
in (

let check_quals_eq = (fun l qopt q -> (match (qopt) with
| None -> begin
Some (q)
end
| Some (q') -> begin
if (((FStar_List.length q) = (FStar_List.length q')) && (FStar_List.forall2 FStar_Syntax_Util.qualifier_equal q q')) then begin
Some (q)
end else begin
(let _158_851 = (let _158_850 = (let _158_849 = (let _158_848 = (FStar_Syntax_Print.lid_to_string l)
in (let _158_847 = (FStar_Syntax_Print.quals_to_string q)
in (let _158_846 = (FStar_Syntax_Print.quals_to_string q')
in (FStar_Util.format3 "Inconsistent qualifier annotations on %s; Expected {%s}, got {%s}" _158_848 _158_847 _158_846))))
in ((_158_849), (r)))
in FStar_Syntax_Syntax.Error (_158_850))
in (Prims.raise _158_851))
end
end))
in (

let _60_1863 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.fold_left (fun _60_1840 lb -> (match (_60_1840) with
| (gen, lbs, quals_opt) -> begin
(

let lbname = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (

let _60_1859 = (match ((FStar_TypeChecker_Env.try_lookup_val_decl env lbname.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v)) with
| None -> begin
((gen), (lb), (quals_opt))
end
| Some ((uvs, tval), quals) -> begin
(

let quals_opt = (check_quals_eq lbname.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v quals_opt quals)
in (

let _60_1854 = (match (lb.FStar_Syntax_Syntax.lbtyp.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_unknown -> begin
()
end
| _60_1853 -> begin
(FStar_TypeChecker_Errors.warn r "Annotation from val declaration overrides inline type annotation")
end)
in (let _158_854 = (FStar_Syntax_Syntax.mk_lb ((FStar_Util.Inr (lbname)), (uvs), (FStar_Syntax_Const.effect_ALL_lid), (tval), (lb.FStar_Syntax_Syntax.lbdef)))
in ((false), (_158_854), (quals_opt)))))
end)
in (match (_60_1859) with
| (gen, lb, quals_opt) -> begin
((gen), ((lb)::lbs), (quals_opt))
end)))
end)) ((true), ([]), (if (quals = []) then begin
None
end else begin
Some (quals)
end))))
in (match (_60_1863) with
| (should_generalize, lbs', quals_opt) -> begin
(

let quals = (match (quals_opt) with
| None -> begin
(FStar_Syntax_Syntax.Visible_default)::[]
end
| Some (q) -> begin
if (FStar_All.pipe_right q (FStar_Util.for_some (fun _60_8 -> (match (_60_8) with
| (FStar_Syntax_Syntax.Irreducible) | (FStar_Syntax_Syntax.Visible_default) | (FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen) -> begin
true
end
| _60_1872 -> begin
false
end)))) then begin
q
end else begin
(FStar_Syntax_Syntax.Visible_default)::q
end
end)
in (

let lbs' = (FStar_List.rev lbs')
in (

let e = (let _158_858 = (let _158_857 = (let _158_856 = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_unit)) None r)
in (((((Prims.fst lbs)), (lbs'))), (_158_856)))
in FStar_Syntax_Syntax.Tm_let (_158_857))
in (FStar_Syntax_Syntax.mk _158_858 None r))
in (

let _60_1906 = (match ((FStar_TypeChecker_TcTerm.tc_maybe_toplevel_term (

let _60_1876 = env
in {FStar_TypeChecker_Env.solver = _60_1876.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_1876.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_1876.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_1876.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_1876.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_1876.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_1876.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_1876.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_1876.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_1876.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_1876.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = should_generalize; FStar_TypeChecker_Env.letrecs = _60_1876.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = true; FStar_TypeChecker_Env.check_uvars = _60_1876.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_1876.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_1876.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_1876.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = _60_1876.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = _60_1876.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_1876.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_1876.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_1876.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_1876.FStar_TypeChecker_Env.qname_and_index}) e)) with
| ({FStar_Syntax_Syntax.n = FStar_Syntax_Syntax.Tm_let (lbs, e); FStar_Syntax_Syntax.tk = _60_1883; FStar_Syntax_Syntax.pos = _60_1881; FStar_Syntax_Syntax.vars = _60_1879}, _60_1890, g) when (FStar_TypeChecker_Rel.is_trivial g) -> begin
(

let quals = (match (e.FStar_Syntax_Syntax.n) with
| FStar_Syntax_Syntax.Tm_meta (_60_1894, FStar_Syntax_Syntax.Meta_desugared (FStar_Syntax_Syntax.Masked_effect)) -> begin
(FStar_Syntax_Syntax.HasMaskedEffect)::quals
end
| _60_1900 -> begin
quals
end)
in ((FStar_Syntax_Syntax.Sig_let (((lbs), (r), (lids), (quals)))), (lbs)))
end
| _60_1903 -> begin
(FStar_All.failwith "impossible")
end)
in (match (_60_1906) with
| (se, lbs) -> begin
(

let _60_1912 = if (log env) then begin
(let _158_866 = (let _158_865 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (

let should_log = (match ((let _158_862 = (let _158_861 = (let _158_860 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in _158_860.FStar_Syntax_Syntax.fv_name)
in _158_861.FStar_Syntax_Syntax.v)
in (FStar_TypeChecker_Env.try_lookup_val_decl env _158_862))) with
| None -> begin
true
end
| _60_1910 -> begin
false
end)
in if should_log then begin
(let _158_864 = (FStar_Syntax_Print.lbname_to_string lb.FStar_Syntax_Syntax.lbname)
in (let _158_863 = (FStar_Syntax_Print.term_to_string lb.FStar_Syntax_Syntax.lbtyp)
in (FStar_Util.format2 "let %s : %s" _158_864 _158_863)))
end else begin
""
end))))
in (FStar_All.pipe_right _158_865 (FStar_String.concat "\n")))
in (FStar_Util.print1 "%s\n" _158_866))
end else begin
()
end
in (

let env = (FStar_TypeChecker_Env.push_sigelt env se)
in (((se)::[]), (env))))
end)))))
end))))
end))))


let for_export : FStar_Ident.lident Prims.list  ->  FStar_Syntax_Syntax.sigelt  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Ident.lident Prims.list) = (fun hidden se -> (

let is_abstract = (fun quals -> (FStar_All.pipe_right quals (FStar_Util.for_some (fun _60_9 -> (match (_60_9) with
| FStar_Syntax_Syntax.Abstract -> begin
true
end
| _60_1922 -> begin
false
end)))))
in (

let is_hidden_proj_or_disc = (fun q -> (match (q) with
| (FStar_Syntax_Syntax.Projector (l, _)) | (FStar_Syntax_Syntax.Discriminator (l)) -> begin
(FStar_All.pipe_right hidden (FStar_Util.for_some (FStar_Ident.lid_equals l)))
end
| _60_1932 -> begin
false
end))
in (match (se) with
| FStar_Syntax_Syntax.Sig_pragma (_60_1934) -> begin
(([]), (hidden))
end
| (FStar_Syntax_Syntax.Sig_inductive_typ (_)) | (FStar_Syntax_Syntax.Sig_datacon (_)) -> begin
(FStar_All.failwith "Impossible")
end
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, _60_1945, r) -> begin
if (is_abstract quals) then begin
(FStar_List.fold_right (fun se _60_1952 -> (match (_60_1952) with
| (out, hidden) -> begin
(match (se) with
| FStar_Syntax_Syntax.Sig_inductive_typ (l, us, bs, t, _60_1958, _60_1960, quals, r) -> begin
(

let dec = (let _158_880 = (let _158_879 = (let _158_878 = (FStar_Syntax_Syntax.mk_Total t)
in (FStar_Syntax_Util.arrow bs _158_878))
in ((l), (us), (_158_879), ((FStar_Syntax_Syntax.Assumption)::(FStar_Syntax_Syntax.New)::quals), (r)))
in FStar_Syntax_Syntax.Sig_declare_typ (_158_880))
in (((dec)::out), (hidden)))
end
| FStar_Syntax_Syntax.Sig_datacon (l, us, t, _60_1970, _60_1972, _60_1974, _60_1976, r) -> begin
(

let dec = FStar_Syntax_Syntax.Sig_declare_typ (((l), (us), (t), ((FStar_Syntax_Syntax.Assumption)::[]), (r)))
in (((dec)::out), ((l)::hidden)))
end
| _60_1982 -> begin
((out), (hidden))
end)
end)) ses (([]), (hidden)))
end else begin
(((se)::[]), (hidden))
end
end
| FStar_Syntax_Syntax.Sig_assume (_60_1984, _60_1986, quals, _60_1989) -> begin
if (is_abstract quals) then begin
(([]), (hidden))
end else begin
(((se)::[]), (hidden))
end
end
| FStar_Syntax_Syntax.Sig_declare_typ (l, us, t, quals, r) -> begin
if (FStar_All.pipe_right quals (FStar_Util.for_some is_hidden_proj_or_disc)) then begin
(((FStar_Syntax_Syntax.Sig_declare_typ (((l), (us), (t), ((FStar_Syntax_Syntax.Assumption)::[]), (r))))::[]), ((l)::hidden))
end else begin
if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _60_10 -> (match (_60_10) with
| (FStar_Syntax_Syntax.Assumption) | (FStar_Syntax_Syntax.Projector (_)) | (FStar_Syntax_Syntax.Discriminator (_)) -> begin
true
end
| _60_2008 -> begin
false
end)))) then begin
(((se)::[]), (hidden))
end else begin
(([]), (hidden))
end
end
end
| FStar_Syntax_Syntax.Sig_main (_60_2010) -> begin
(([]), (hidden))
end
| (FStar_Syntax_Syntax.Sig_new_effect (_)) | (FStar_Syntax_Syntax.Sig_new_effect_for_free (_)) | (FStar_Syntax_Syntax.Sig_sub_effect (_)) | (FStar_Syntax_Syntax.Sig_effect_abbrev (_)) -> begin
(((se)::[]), (hidden))
end
| FStar_Syntax_Syntax.Sig_let ((false, (lb)::[]), _60_2029, _60_2031, quals) when (FStar_All.pipe_right quals (FStar_Util.for_some is_hidden_proj_or_disc)) -> begin
(

let fv = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (

let lid = fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v
in if (FStar_All.pipe_right hidden (FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv))) then begin
(([]), (hidden))
end else begin
(

let dec = FStar_Syntax_Syntax.Sig_declare_typ (((fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v), (lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbtyp), ((FStar_Syntax_Syntax.Assumption)::[]), ((FStar_Ident.range_of_lid lid))))
in (((dec)::[]), ((lid)::hidden)))
end))
end
| FStar_Syntax_Syntax.Sig_let (lbs, r, l, quals) -> begin
if (is_abstract quals) then begin
(let _158_887 = (FStar_All.pipe_right (Prims.snd lbs) (FStar_List.map (fun lb -> (let _158_886 = (let _158_885 = (let _158_884 = (let _158_883 = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in _158_883.FStar_Syntax_Syntax.fv_name)
in _158_884.FStar_Syntax_Syntax.v)
in ((_158_885), (lb.FStar_Syntax_Syntax.lbunivs), (lb.FStar_Syntax_Syntax.lbtyp), ((FStar_Syntax_Syntax.Assumption)::quals), (r)))
in FStar_Syntax_Syntax.Sig_declare_typ (_158_886)))))
in ((_158_887), (hidden)))
end else begin
(((se)::[]), (hidden))
end
end))))


let tc_decls : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  (FStar_Syntax_Syntax.sigelt Prims.list * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env ses -> (

let process_one_decl = (fun _60_2052 se -> (match (_60_2052) with
| (ses, exports, env, hidden) -> begin
(

let _60_2054 = if (FStar_TypeChecker_Env.debug env FStar_Options.Low) then begin
(let _158_896 = (FStar_Syntax_Print.sigelt_to_string se)
in (FStar_Util.print1 ">>>>>>>>>>>>>>Checking top-level decl %s\n" _158_896))
end else begin
()
end
in (

let _60_2058 = (tc_decl env se)
in (match (_60_2058) with
| (ses', env) -> begin
(

let _60_2061 = if ((FStar_Options.log_types ()) || (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env) (FStar_Options.Other ("LogTypes")))) then begin
(let _158_901 = (FStar_List.fold_left (fun s se -> (let _158_900 = (let _158_899 = (FStar_Syntax_Print.sigelt_to_string se)
in (Prims.strcat _158_899 "\n"))
in (Prims.strcat s _158_900))) "" ses')
in (FStar_Util.print1 "Checked: %s\n" _158_901))
end else begin
()
end
in (

let _60_2064 = (FStar_List.iter (fun se -> (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_sig env se)) ses')
in (

let _60_2073 = (FStar_List.fold_left (fun _60_2068 se -> (match (_60_2068) with
| (le, lh) -> begin
(

let tup = (for_export hidden se)
in (((FStar_List.rev_append (Prims.fst tup) le)), ((FStar_List.rev_append (Prims.snd tup) lh))))
end)) (([]), ([])) ses')
in (match (_60_2073) with
| (exported, hidden) -> begin
(((FStar_List.rev_append ses' ses)), (((FStar_List.rev_append exported []))::exports), (env), (hidden))
end))))
end)))
end))
in (

let _60_2103 = (FStar_List.fold_left (fun acc se -> (match (se) with
| FStar_Syntax_Syntax.Sig_new_effect_for_free (ne, r) -> begin
(

let _60_2087 = acc
in (match (_60_2087) with
| (_60_2081, _60_2083, env, _60_2086) -> begin
(

let _60_2091 = (cps_and_elaborate env ne)
in (match (_60_2091) with
| (ses, ne, lift_from_pure_opt) -> begin
(

let ses = (match (lift_from_pure_opt) with
| Some (lift) -> begin
(FStar_List.append ses ((FStar_Syntax_Syntax.Sig_new_effect (((ne), (r))))::(lift)::[]))
end
| None -> begin
(FStar_List.append ses ((FStar_Syntax_Syntax.Sig_new_effect (((ne), (r))))::[]))
end)
in (FStar_List.fold_left process_one_decl acc ses))
end))
end))
end
| _60_2097 -> begin
(process_one_decl acc se)
end)) (([]), ([]), (env), ([])) ses)
in (match (_60_2103) with
| (ses, exports, env, _60_2102) -> begin
(let _158_907 = (FStar_All.pipe_right (FStar_List.rev_append exports []) FStar_List.flatten)
in (((FStar_List.rev_append ses [])), (_158_907), (env)))
end))))


let tc_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env modul -> (

let name = (FStar_Util.format2 "%s %s" (if modul.FStar_Syntax_Syntax.is_interface then begin
"interface"
end else begin
"module"
end) modul.FStar_Syntax_Syntax.name.FStar_Ident.str)
in (

let msg = (Prims.strcat "Internals for " name)
in (

let env = (

let _60_2108 = env
in (let _158_912 = (not ((FStar_Options.should_verify modul.FStar_Syntax_Syntax.name.FStar_Ident.str)))
in {FStar_TypeChecker_Env.solver = _60_2108.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_2108.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_2108.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_2108.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_2108.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_2108.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_2108.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_2108.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_2108.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_2108.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_2108.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_2108.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_2108.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = _60_2108.FStar_TypeChecker_Env.top_level; FStar_TypeChecker_Env.check_uvars = _60_2108.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_2108.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = modul.FStar_Syntax_Syntax.is_interface; FStar_TypeChecker_Env.admit = _158_912; FStar_TypeChecker_Env.lax = _60_2108.FStar_TypeChecker_Env.lax; FStar_TypeChecker_Env.lax_universes = _60_2108.FStar_TypeChecker_Env.lax_universes; FStar_TypeChecker_Env.type_of = _60_2108.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_2108.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_2108.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_2108.FStar_TypeChecker_Env.qname_and_index}))
in (

let _60_2111 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.push msg)
in (

let env = (FStar_TypeChecker_Env.set_current_module env modul.FStar_Syntax_Syntax.name)
in (

let _60_2117 = (tc_decls env modul.FStar_Syntax_Syntax.declarations)
in (match (_60_2117) with
| (ses, exports, env) -> begin
(((

let _60_2118 = modul
in {FStar_Syntax_Syntax.name = _60_2118.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = ses; FStar_Syntax_Syntax.exports = _60_2118.FStar_Syntax_Syntax.exports; FStar_Syntax_Syntax.is_interface = _60_2118.FStar_Syntax_Syntax.is_interface})), (exports), (env))
end))))))))


let tc_more_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  (FStar_Syntax_Syntax.modul * FStar_Syntax_Syntax.sigelt Prims.list * FStar_TypeChecker_Env.env) = (fun env modul decls -> (

let _60_2126 = (tc_decls env decls)
in (match (_60_2126) with
| (ses, exports, env) -> begin
(

let modul = (

let _60_2127 = modul
in {FStar_Syntax_Syntax.name = _60_2127.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = (FStar_List.append modul.FStar_Syntax_Syntax.declarations ses); FStar_Syntax_Syntax.exports = _60_2127.FStar_Syntax_Syntax.exports; FStar_Syntax_Syntax.is_interface = _60_2127.FStar_Syntax_Syntax.is_interface})
in ((modul), (exports), (env)))
end)))


let check_exports : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_Syntax_Syntax.sigelt Prims.list  ->  Prims.unit = (fun env modul exports -> (

let env = (

let _60_2133 = env
in {FStar_TypeChecker_Env.solver = _60_2133.FStar_TypeChecker_Env.solver; FStar_TypeChecker_Env.range = _60_2133.FStar_TypeChecker_Env.range; FStar_TypeChecker_Env.curmodule = _60_2133.FStar_TypeChecker_Env.curmodule; FStar_TypeChecker_Env.gamma = _60_2133.FStar_TypeChecker_Env.gamma; FStar_TypeChecker_Env.gamma_cache = _60_2133.FStar_TypeChecker_Env.gamma_cache; FStar_TypeChecker_Env.modules = _60_2133.FStar_TypeChecker_Env.modules; FStar_TypeChecker_Env.expected_typ = _60_2133.FStar_TypeChecker_Env.expected_typ; FStar_TypeChecker_Env.sigtab = _60_2133.FStar_TypeChecker_Env.sigtab; FStar_TypeChecker_Env.is_pattern = _60_2133.FStar_TypeChecker_Env.is_pattern; FStar_TypeChecker_Env.instantiate_imp = _60_2133.FStar_TypeChecker_Env.instantiate_imp; FStar_TypeChecker_Env.effects = _60_2133.FStar_TypeChecker_Env.effects; FStar_TypeChecker_Env.generalize = _60_2133.FStar_TypeChecker_Env.generalize; FStar_TypeChecker_Env.letrecs = _60_2133.FStar_TypeChecker_Env.letrecs; FStar_TypeChecker_Env.top_level = true; FStar_TypeChecker_Env.check_uvars = _60_2133.FStar_TypeChecker_Env.check_uvars; FStar_TypeChecker_Env.use_eq = _60_2133.FStar_TypeChecker_Env.use_eq; FStar_TypeChecker_Env.is_iface = _60_2133.FStar_TypeChecker_Env.is_iface; FStar_TypeChecker_Env.admit = _60_2133.FStar_TypeChecker_Env.admit; FStar_TypeChecker_Env.lax = true; FStar_TypeChecker_Env.lax_universes = true; FStar_TypeChecker_Env.type_of = _60_2133.FStar_TypeChecker_Env.type_of; FStar_TypeChecker_Env.universe_of = _60_2133.FStar_TypeChecker_Env.universe_of; FStar_TypeChecker_Env.use_bv_sorts = _60_2133.FStar_TypeChecker_Env.use_bv_sorts; FStar_TypeChecker_Env.qname_and_index = _60_2133.FStar_TypeChecker_Env.qname_and_index})
in (

let check_term = (fun lid univs t -> (

let _60_2142 = (FStar_Syntax_Subst.open_univ_vars univs t)
in (match (_60_2142) with
| (univs, t) -> begin
(

let _60_2144 = if (let _158_932 = (let _158_931 = (FStar_TypeChecker_Env.set_current_module env modul.FStar_Syntax_Syntax.name)
in (FStar_TypeChecker_Env.debug _158_931))
in (FStar_All.pipe_left _158_932 (FStar_Options.Other ("Exports")))) then begin
(let _158_937 = (FStar_Syntax_Print.lid_to_string lid)
in (let _158_936 = (let _158_934 = (FStar_All.pipe_right univs (FStar_List.map (fun x -> (FStar_Syntax_Print.univ_to_string (FStar_Syntax_Syntax.U_name (x))))))
in (FStar_All.pipe_right _158_934 (FStar_String.concat ", ")))
in (let _158_935 = (FStar_Syntax_Print.term_to_string t)
in (FStar_Util.print3 "Checking for export %s <%s> : %s\n" _158_937 _158_936 _158_935))))
end else begin
()
end
in (

let env = (FStar_TypeChecker_Env.push_univ_vars env univs)
in (let _158_938 = (FStar_TypeChecker_TcTerm.tc_trivial_guard env t)
in (FStar_All.pipe_right _158_938 Prims.ignore))))
end)))
in (

let check_term = (fun lid univs t -> (

let _60_2151 = (let _158_947 = (let _158_946 = (FStar_Syntax_Print.lid_to_string modul.FStar_Syntax_Syntax.name)
in (let _158_945 = (FStar_Syntax_Print.lid_to_string lid)
in (FStar_Util.format2 "Interface of %s violates its abstraction (add a \'private\' qualifier to \'%s\'?)" _158_946 _158_945)))
in (FStar_TypeChecker_Errors.message_prefix.FStar_TypeChecker_Errors.set_prefix _158_947))
in (

let _60_2153 = (check_term lid univs t)
in (FStar_TypeChecker_Errors.message_prefix.FStar_TypeChecker_Errors.clear_prefix ()))))
in (

let rec check_sigelt = (fun _60_11 -> (match (_60_11) with
| FStar_Syntax_Syntax.Sig_bundle (ses, quals, _60_2160, _60_2162) -> begin
if (not ((FStar_All.pipe_right quals (FStar_List.contains FStar_Syntax_Syntax.Private)))) then begin
(FStar_All.pipe_right ses (FStar_List.iter check_sigelt))
end else begin
()
end
end
| FStar_Syntax_Syntax.Sig_inductive_typ (l, univs, binders, typ, _60_2170, _60_2172, _60_2174, r) -> begin
(

let t = (let _158_952 = (let _158_951 = (let _158_950 = (FStar_Syntax_Syntax.mk_Total typ)
in ((binders), (_158_950)))
in FStar_Syntax_Syntax.Tm_arrow (_158_951))
in (FStar_Syntax_Syntax.mk _158_952 None r))
in (check_term l univs t))
end
| FStar_Syntax_Syntax.Sig_datacon (l, univs, t, _60_2183, _60_2185, _60_2187, _60_2189, _60_2191) -> begin
(check_term l univs t)
end
| FStar_Syntax_Syntax.Sig_declare_typ (l, univs, t, quals, _60_2199) -> begin
if (not ((FStar_All.pipe_right quals (FStar_List.contains FStar_Syntax_Syntax.Private)))) then begin
(check_term l univs t)
end else begin
()
end
end
| FStar_Syntax_Syntax.Sig_let ((_60_2203, lbs), _60_2207, _60_2209, quals) -> begin
if (not ((FStar_All.pipe_right quals (FStar_List.contains FStar_Syntax_Syntax.Private)))) then begin
(FStar_All.pipe_right lbs (FStar_List.iter (fun lb -> (

let fv = (FStar_Util.right lb.FStar_Syntax_Syntax.lbname)
in (check_term fv.FStar_Syntax_Syntax.fv_name.FStar_Syntax_Syntax.v lb.FStar_Syntax_Syntax.lbunivs lb.FStar_Syntax_Syntax.lbtyp)))))
end else begin
()
end
end
| FStar_Syntax_Syntax.Sig_effect_abbrev (l, univs, binders, comp, quals, flags, r) -> begin
if (not ((FStar_All.pipe_right quals (FStar_List.contains FStar_Syntax_Syntax.Private)))) then begin
(

let arrow = (FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_arrow (((binders), (comp)))) None r)
in (check_term l univs arrow))
end else begin
()
end
end
| (FStar_Syntax_Syntax.Sig_main (_)) | (FStar_Syntax_Syntax.Sig_assume (_)) | (FStar_Syntax_Syntax.Sig_new_effect (_)) | (FStar_Syntax_Syntax.Sig_new_effect_for_free (_)) | (FStar_Syntax_Syntax.Sig_sub_effect (_)) | (FStar_Syntax_Syntax.Sig_pragma (_)) -> begin
()
end))
in if (FStar_Ident.lid_equals modul.FStar_Syntax_Syntax.name FStar_Syntax_Const.prims_lid) then begin
()
end else begin
(FStar_List.iter check_sigelt exports)
end)))))


let finish_partial_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  FStar_Syntax_Syntax.sigelts  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env modul exports -> (

let modul = (

let _60_2246 = modul
in {FStar_Syntax_Syntax.name = _60_2246.FStar_Syntax_Syntax.name; FStar_Syntax_Syntax.declarations = _60_2246.FStar_Syntax_Syntax.declarations; FStar_Syntax_Syntax.exports = exports; FStar_Syntax_Syntax.is_interface = modul.FStar_Syntax_Syntax.is_interface})
in (

let env = (FStar_TypeChecker_Env.finish_module env modul)
in (

let _60_2250 = (check_exports env modul exports)
in (

let _60_2252 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.pop (Prims.strcat "Ending modul " modul.FStar_Syntax_Syntax.name.FStar_Ident.str))
in (

let _60_2254 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.encode_modul env modul)
in (

let _60_2256 = (env.FStar_TypeChecker_Env.solver.FStar_TypeChecker_Env.refresh ())
in (

let _60_2258 = (let _158_960 = (FStar_Options.restore_cmd_line_options true)
in (FStar_All.pipe_right _158_960 Prims.ignore))
in ((modul), (env))))))))))


let tc_modul : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env modul -> (

let _60_2265 = (tc_partial_modul env modul)
in (match (_60_2265) with
| (modul, non_private_decls, env) -> begin
(finish_partial_modul env modul non_private_decls)
end)))


let check_module : FStar_TypeChecker_Env.env  ->  FStar_Syntax_Syntax.modul  ->  (FStar_Syntax_Syntax.modul * FStar_TypeChecker_Env.env) = (fun env m -> (

let _60_2268 = if (FStar_Options.debug_any ()) then begin
(let _158_969 = (FStar_Syntax_Print.lid_to_string m.FStar_Syntax_Syntax.name)
in (FStar_Util.print2 "Checking %s: %s\n" (if m.FStar_Syntax_Syntax.is_interface then begin
"i\'face"
end else begin
"module"
end) _158_969))
end else begin
()
end
in (

let _60_2272 = (tc_modul env m)
in (match (_60_2272) with
| (m, env) -> begin
(

let _60_2273 = if (FStar_Options.dump_module m.FStar_Syntax_Syntax.name.FStar_Ident.str) then begin
(let _158_970 = (FStar_Syntax_Print.modul_to_string m)
in (FStar_Util.print1 "%s\n" _158_970))
end else begin
()
end
in ((m), (env)))
end))))




