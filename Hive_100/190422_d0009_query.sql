select
  d0009.`data_dt` as `报表日期`,
  d0009.`col_01` as `序号`,
  d0009.`col_02` as `机构号`,
  d0009.`col_03` as `分公司`,
  d0009.`col_04` as `商户号`,
  d0009.`col_05` as `商户名称`,
  d0009.`col_06` as `法人姓名`,
  d0009.`col_07` as `借据号`,
  d0009.`col_08` as `贷款起息日`,
  d0009.`col_09` as `贷款结束日`,
  d0009.`col_10` as `贷款本金`,
  d0009.`col_11` as `贷款期限`,
  d0009.`col_12` as `贷款利率`,
  d0009.`col_13` as `罚息利率`,
  d0009.`col_14` as `滞纳金利率`,
  d0009.`col_15` as `还款方式（日/周/双周/月）`,
  d0009.`col_16` as `累计应收金额.本金`,
  d0009.`col_17` as `累计应收金额.本金借记调整`,
  d0009.`col_18` as `累计应收金额.本金贷记调整`,
  d0009.`col_19` as `累计应收金额.账户管理费1`,
  d0009.`col_20` as `累计应收金额.账户管理费1借记调整`,
  d0009.`col_21` as `累计应收金额.账户管理费1贷记调整（表内）`,
  d0009.`col_22` as `累计应收金额.账户管理费2`,
  d0009.`col_23` as `累计应收金额.账户管理费2借记调整`,
  d0009.`col_24` as `累计应收金额.账户管理费2贷记调整（表内）`,
  d0009.`col_25` as `累计应收金额.滞纳金`,
  d0009.`col_26` as `累计应收金额.滞纳金借记调整`,
  d0009.`col_27` as `累计应收金额.滞纳金贷记调整（表内）`,
  d0009.`col_28` as `累计应收金额.其他或有转入:账户管理费1`,
  d0009.`col_29` as `累计应收金额.其他或有转入:账户管理费2`,
  d0009.`col_30` as `累计应收金额.其他或有转入:滞纳金`,
  d0009.`col_31` as `累计应收金额.合计`,
  d0009.`col_32` as `累计已还金额.本金`,
  d0009.`col_33` as `累计已还金额.账户管理费1`,
  d0009.`col_34` as `累计已还金额.账户管理费2`,
  d0009.`col_35` as `累计已还金额.滞纳金`,
  d0009.`col_36` as `累计已还金额.其他或有转入:账户管理费1`,
  d0009.`col_37` as `累计已还金额.其他或有转入:账户管理费2`,
  d0009.`col_38` as `累计已还金额.其他或有转入:滞纳金`,
  d0009.`col_39` as `累计已还金额.合计`,
  d0009.`col_40` as `贷款余额.本金`,
  d0009.`col_41` as `贷款余额.账户管理费1`,
  d0009.`col_42` as `贷款余额.账户管理费2`,
  d0009.`col_43` as `贷款余额.滞纳金`,
  d0009.`col_44` as `贷款余额.合计`,
  d0009.`col_45` as `贷款余额.贷款状态`,
  d0009.`col_46` as `是否逾期`,
  d0009.`col_47` as `逾期天数`,
  mcht.merchant_ap,
  mcht.merchant_name,
  mcht.mcc
from (
    select * from allinpal_rpt.`thbl_rpt_d0009` where `data_dt`='2019-04-18' and col_47 >0
    )
    d0009
LEFT JOIN
    rds_rc.merchant
        mcht
on
    d0009.col_04 = mcht.merchant_ap
order by
         `序号`