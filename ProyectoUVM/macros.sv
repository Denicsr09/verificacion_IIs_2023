`define ROWS 4
`define COLUMS 4
`define pckg_sz 40
`define deep_fifo 4
`define num_transaciones 3

`define revision\
fork \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(11 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(11 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(11 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(11 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(12 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(12 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(12 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(12 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(13 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(13 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(13 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(13 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(14 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(14 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(14 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(14 == gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(21 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(21 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(21 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(21 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(22 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(22 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(22 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(22 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(23 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(23 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(23 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(23 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(24 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(24 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(24 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(24 == gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(31 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(31 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(31 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(31 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(32 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(32 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(32 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(32 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(33 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(33 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(33 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(33 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(34 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(34 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(34 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(34 == gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(41 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(41 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(41 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(41 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(42 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(42 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(42 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(42 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(43 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(43 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(43 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(43 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(44 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(44 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(44 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
begin \
    forever begin \
        @(posedge tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop); \
              foreach (gold_path[i])begin \
  if (tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]==i)begin \
 foreach (gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin  \
 if(44 == gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]][a])begin \
  gold_path[tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.data_out[`pckg_sz-9:0]].delete(a);\
 end \
 end \
 end \
 end \
 end \
 end \
join_none
