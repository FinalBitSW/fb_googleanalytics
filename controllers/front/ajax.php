<?php
/**
 * Copyright © 2017 FinalBit Solution. All rights reserved.
 * @author FinalBit
 * @copyright FinalBit - http://www.finalbit.ch
 * @license See LICENSE.txt for license details.
 */

class fb_GoogleanalyticsAjaxModuleFrontController extends ModuleFrontController
{
    public $ssl = true;
    /*
     * @see FrontController::initContent()
     */
    public function initContent()
    {
        parent::initContent();

        $order = new Order((int)Tools::getValue('orderid'));
        if (!Validate::isLoadedObject($order) || $order->id_customer != (int)Tools::getValue('customer')) {
            die;
        }
        Db::getInstance()->execute(
            'UPDATE `'._DB_PREFIX_.'ganalytics` SET sent = 1, date_add = NOW() WHERE id_order = '.(int)Tools::getValue('orderid').' LIMIT 1'
        );
        die;
    }
}
