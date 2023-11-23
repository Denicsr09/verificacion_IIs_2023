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






`define pop_drv_coverG\
coverpoint tb_top.dut_wr0.dut.pop[0]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[1]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[2]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[3]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[4]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[5]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[6]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[7]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[8]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[9]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[10]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[11]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[12]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[13]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[14]{bins b1 = {1};}  \
coverpoint tb_top.dut_wr0.dut.pop[15]{bins b1 = {1};}  

`define colum_cov\
coverpoint tb_top.dut_wr0.dut.data_out[0][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[1][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[2][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[3][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[4][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[5][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[6][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[7][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[8][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[9][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[10][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[11][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[12][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[13][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[14][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} \
coverpoint tb_top.dut_wr0.dut.data_out[15][`pckg_sz-13:`pckg_sz-16]{bins c = {[0:5]};} 


`define terminal_cov\
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[1]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[2]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[3]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[1].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[2].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[3].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[0].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[1].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[2].rtr_ntrfs_.pop{bins pop = {1};}  \
coverpoint tb_top.dut_wr0.dut._rw_[4]._clm_[4].rtr._nu_[3].rtr_ntrfs_.pop{bins pop = {1};}  

