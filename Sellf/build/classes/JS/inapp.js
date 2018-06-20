angular.module('impwww')

.controller('demoCtrl', function($scope, $http, $timeout, $window) {

    function init() {
        $scope.use_escrow = false;
        $scope.in_app = false;
        $scope.is_response = false;

        $scope.pg = $scope.pgProviders[0];
        $scope.payMethod = $scope.pg.payMethod[0];

        $scope.name = "결제테스트";
        $scope.merchant_uid = 'merchant_' + new Date().getTime();
        $scope.amount = 1004;
        $scope.buyer_email = "iamport@siot.do"; 
        $scope.buyer_name = "구매자"; 
        $scope.buyer_tel = "010-1234-5678";
        $scope.buyer_addr = "서울특별시 강남구 삼성동";
        $scope.buyer_postcode = "123-456";
        $scope.vbank_due = moment().add(2, 'day').format('YYYYMMDD');
    };

    $scope.$watch('pg', function(newPg, oldPg) {
        if ( newPg != oldPg ) {
            $scope.payMethod = newPg.payMethod[0];
        }
    });
    
    $scope.pgProviders = [
        {
            id : "kakaopay",
            name : "카카오페이",
            userCode : 'imp10391932',
            payMethod : [{ value : "card", name:"신용카드"}]
        },
        {
            id : "kakaopay_billing",
            name : "카카오페이(정기결제)",
            userCode : 'imp10391932',
            pgId : 'TCSUBSCRIP',
            payMethod : [{ value : "card", name:"신용카드"}]
        },
        {
            id : "naverco",
            name : "네이버페이",
            userCode : 'imp41073887',
            payMethod : [
                            { value : "card", name:"신용카드"}
                        ]
        },
        {
            id : "payco",
            name : "PAYCO",
            userCode : 'imp09215616',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "html5_inicis",
            name : "KG이니시스(웹표준결제)",
            userCode : 'imp68124833',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"},
                            { value : "samsung", name :"삼성페이"},
                            { value : "kpay", name :"KPay"},
                            { value : "cultureland", name :"문화상품권"},
                            { value : "smartculture", name :"스마트문상"},
                            { value : "happymoney", name :"해피머니"}
                        ]
        },
        {
            id : "kcp",
            name : "NHN KCP",
            userCode : 'imp33886024',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "samsung", name:"삼성페이"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "nice",
            name : "나이스정보통신",
            userCode : 'imp84043725',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "jtnet",
            name : "JTNet",
            userCode : 'imp57843720',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "danal",
            name : "다날-휴대폰소액결제전용",
            userCode : 'imp00357859',
            payMethod : [{ value : "phone", name:"휴대폰소액결제"}]
        },
        {
            id : "danal_tpay",
            name : "다날-다날일반결제",
            userCode : 'imp00807605',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"}
                        ]
        },
        {
            id : "mobilians",
            name : "모빌리언스-휴대폰소액결제",
            userCode : 'imp60029475',
            payMethod : [{ value : "phone", name:"휴대폰소액결제"}]
        },
        {
            id : "uplus",
            name : "LGU+",
            userCode : 'imp46648599',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "kicc",
            name : "KICC",
            userCode : 'imp53939833',
            payMethod : [
                            { value : "card", name:"신용카드"},
                            { value : "trans", name:"실시간계좌이체"},
                            { value : "vbank", name:"가상계좌"},
                            { value : "phone", name:"휴대폰소액결제"}
                        ]
        },
        {
            id : "paypal",
            name : "페이팔",
            userCode : 'imp09350031',
            payMethod : [{ value : "card", name:"신용카드"}]
        },
        {
            id : "html5_inicis_billing",
            name : "KG이니시스(빌링결제)",
            userCode : 'imp86058634',
            payMethod : [
                            { value : "card", name:"신용카드"}
                        ]
        },
        {
            id : "jtnet_billing",
            name : "JTNet(빌링결제)",
            userCode : 'imp17732827',
            pgId : 'tpaytest2m',
            payMethod : [
                            { value : "card", name:"신용카드"}
                        ]
        }
    ];

    $scope.getHelpText = function(pg){
        var helpText = "실제 승인이 이루어진 테스트 결제건은 자정에 이니시스에서 자동 취소처리합니다.";

        switch(pg) {
            case 'uplus' :
                helpText = '실제 승인이 이루어지 않기 때문에 청구되지 않습니다.';
                break;

            case 'danal' :
            case 'danal_tpay':
            case 'kakaopay' :
                helpText = '실제 승인이 이루어진 테스트 결제건은 약 30분 후 자동 취소처리됩니다.';
                break;

            default:
                helpText = '실제 승인이 이루어진 테스트 결제건은 매일 자정(23:00~23:50분 사이)에 자동 취소처리합니다.';
                break;
        }

        return helpText;
    }

    $scope.payRequest = function() {
        var IMP = window.IMP;
        var userCode = $scope.pg.userCode || 'iamport';

        IMP.init(userCode);

        var param = {
            pay_method : $scope.payMethod.value,
            escrow : $scope.use_escrow,
            merchant_uid : $scope.merchant_uid,
            name:$scope.name, 
            amount:$scope.amount, 
            buyer_email:$scope.buyer_email, 
            buyer_name:$scope.buyer_name, 
            buyer_tel:$scope.buyer_tel, 
            buyer_addr:$scope.buyer_addr,
            buyer_postcode:$scope.buyer_postcode,
            vbank_due:$scope.vbank_due,
            m_redirect_url:'http://www.iamport.kr/demo',
            kcpProducts : [
                {
                    "orderNumber" : "xxxx",
                    "name" : "상품A",
                    "quantity" : 3,
                    "amount" : 1000
                },
                {
                    "orderNumber" : "yyyy",
                    "name" : "상품B",
                    "quantity" : 2,
                    "amount" : 3000
                }
            ],
            naverProducts : [
                {
                    id : "singleProduct",
                    name : "네이버페이 상품1",
                    basePrice : 1000,
                    taxType : 'FREE', //TAX or FREE
                    quantity : 2,
                    infoUrl : "http://www.naver.com",
                    imageUrl : "http://www.naver.com",
                    shipping : {
                        groupId : "",
                        method : "DELIVERY", //DELIVERY(택배·소포·등기), QUICK_SVC(퀵 서비스), DIRECT_DELIVERY(직접 전달), VISIT_RECEIPT(방문 수령), NOTHING(배송 없음)
                        baseFee : 0,
                        feeType : "FREE", //FREE(무료), CHARGE(유료), CONDITIONAL_FREE(조건부 무료), CHARGE_BY_QUANTITY(수량별 부과)
                        feePayType : "FREE" //FREE(무료), PREPAYED(선불), CASH_ON_DELIVERY(착불)
                    }
                },
                {
                    id : "optionProduct",
                    name : "네이버페이 상품2",
                    basePrice : 1000,
                    taxType : 'FREE', //TAX or FREE
                    quantity : 2,
                    infoUrl : "http://www.naver.com",
                    imageUrl : "http://www.naver.com",
                    option : {
                        optionPrice : 200,
                        selectionCode : "R_L",
                        selections : [
                            {
                                code : "RED",
                                label : "색상",
                                value : "빨강"
                            },
                            {
                                code : "180",
                                label : "사이즈",
                                value : "180"
                            }
                        ]
                    },
                    shipping : {
                        groupId : "",
                        method : "DELIVERY", //DELIVERY(택배·소포·등기), QUICK_SVC(퀵 서비스), DIRECT_DELIVERY(직접 전달), VISIT_RECEIPT(방문 수령), NOTHING(배송 없음)
                        baseFee : 0,
                        feeType : "FREE", //FREE(무료), CHARGE(유료), CONDITIONAL_FREE(조건부 무료), CHARGE_BY_QUANTITY(수량별 부과)
                        feePayType : "FREE" //FREE(무료), PREPAYED(선불), CASH_ON_DELIVERY(착불)
                    }
                }
            ]
        };

        if ( $scope.in_app ) param.app_scheme = 'iamporttest';
        if ( $scope.pg.pgId ) param.pg = $scope.pg.pgId;

        if ( $scope.pg.id === 'html5_inicis_billing' ) {
            param.customer_uid = 'iamport_billing_test';
        }

        if ( $scope.pg.id === 'jtnet_billing' ) {
            param.pg = "jtnet." + $scope.pg.pgId;
            param.customer_uid = 'iamport_billing_test';
        }

        if ( $scope.pg.id === 'kakaopay_billing' ) {
            param.pg = "kakaopay." + $scope.pg.pgId;
            param.customer_uid = 'iamport_billing_test';
        }

        if ( $scope.pg.id === 'naverco' )               param.amount = 4400;
        if ( $scope.pg.id === 'danal_tpay' ) {
            if ( $scope.payMethod.value === 'trans' ) {
                param.pg = "danal_tpay.A010002002";
            } else if ( $scope.payMethod.value === 'vbank' ) {
                alert('가상계좌는 테스트가 진행되지 않습니다. 계약 후 이용부탁드립니다.');
                return false;
            }
        }
        if ( $scope.pg.id === 'kcp' ) {
            if ( $scope.use_escrow && $scope.payMethod.value != 'trans' && $scope.payMethod.value != 'vbank' )   return alert('에스크로 결제는 계좌이체, 가상계좌인 경우에만 적용됩니다.');
        }
        if ( $scope.pg.id === 'paypal' ) {
            param.popup = "redirect";
        }


        IMP.request_pay(param, function(rsp) {
            if ( rsp.success ) {
                var msg = '결제가 완료되었습니다.\n';
                msg += '고유ID : ' + rsp.imp_uid + '\n';
                msg += '상점 거래ID : ' + rsp.merchant_uid + '\n';
                msg += '결제 금액 : ' + rsp.paid_amount + '\n';

                if ( rsp.pay_method === 'card' ) {
                    msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
                } else if ( rsp.pay_method === 'vbank' ) {
                    msg += '가상계좌 번호 : ' + rsp.vbank_num + '\n';
                    msg += '가상계좌 은행 : ' + rsp.vbank_name + '\n';
                    msg += '가상계좌 예금주 : ' + rsp.vbank_holder + '\n';
                    msg += '가상계좌 입금기한 : ' + rsp.vbank_date + '\n';
                }
            } else {
                var msg = '결제에 실패하였습니다.' + '\n';
                msg += '에러내용 : ' + rsp.error_msg + '\n';
            }

            $scope.$apply(function() {
                $scope.is_response = true;
                $scope.response = msg;
            });

            $timeout(function(){
                $scope.is_response = false;
                $window.location.reload();
            }, 10000, true);
        });
        return false;
    }
    
    init();
});

