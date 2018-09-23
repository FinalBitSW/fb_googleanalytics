<?php
/**
 * Copyright © 2017 FinalBit Solution. All rights reserved.
 * @author FinalBit
 * @copyright FinalBit
 * http://www.finalbit.ch
 * See LICENSE.txt for license details.
 */

class AdminGanalyticsAjaxController extends ModuleAdminController
{
    public $ssl = true;

    public function init()
    {
        $order = new Order((int)Tools::getValue('orderid'));
        $context = Context::getContext();
        if (Validate::isLoadedObject($order) && (isset($context->employee->id) && $context->employee->id))
        {
            Db::getInstance()->execute('
                UPDATE `'._DB_PREFIX_.'ganalytics` SET sent = 1, date_add = NOW() WHERE id_order = '.(int)Tools::getValue('orderid')
            );
            die('OK');
        }
        die('KO');
    }
}
