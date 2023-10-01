gui_set_pref_value -category {coveragesetting} -key {geninfodumping} -value 1
gui_exclusion -set_force true
gui_assert_mode -mode flat
gui_class_mode -mode hier
gui_excl_mgr_flat_list -on  0
gui_covdetail_select -id  CovDetail.1   -name   Line
verdiWindowWorkMode -win $_vdCoverage_1 -coverageAnalysis
gui_open_cov  -hier salida.vdb -testdir {} -test {salida/test} -merge MergedTest -db_max_tests 10 -fsm transition
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_covtable_show -show  { Module List } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Function Groups } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Asserts } -id  CoverageTable.1  -test  MergedTest
gui_covtable_show -show  { Design Hierarchy } -id  CoverageTable.1  -test  MergedTest
verdiWindowResize -win $_vdCoverage_1 "100" "103" "915" "704"
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[0]._dp2_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[0]._dp2_.D_reg}
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[0]._dp2_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[0]._dp2_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_select -id CoverageTable.1 -list covtblInstancesList { {test_bench.uut._dp_[1]._dp3_.D_reg}   }
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_select -id CoverageTable.1 -list covtblInstancesList { {test_bench.uut._dp_[1]._dp3_.D_reg}  {test_bench.uut._dp_[1]._dp3_.D_reg.bit_[4].prll_regstr_}   }
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} {test_bench.uut._dp_[1]._dp3_.D_reg}
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_select -id CoverageTable.1 -list covtblInstancesList { {test_bench.uut._dp_[1]._dp3_.D_reg.bit_[4].prll_regstr_}  {test_bench.uut._dp_[0]._dp2_.D_reg}   }
gui_list_select -id CoverageTable.1 -list covtblInstancesList { {test_bench.uut._dp_[0]._dp2_.D_reg}  {test_bench.uut._dp_[1]._dp3_.D_reg}   }
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_expand -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
gui_list_collapse -id  CoverageTable.1   -list {covtblInstancesList} test_bench.uut
vdCovExit -noprompt
