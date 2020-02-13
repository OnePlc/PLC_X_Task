<?php
/**
 * TaskTable.php - Task Table
 *
 * Table Model for Task
 *
 * @category Model
 * @package Task
 * @author Verein onePlace
 * @copyright (C) 2020 Verein onePlace <admin@1plc.ch>
 * @license https://opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 1.0.0
 */

namespace OnePlace\Task\Model;

use Application\Controller\CoreController;
use Application\Model\CoreEntityTable;
use Laminas\Db\TableGateway\TableGateway;
use Laminas\Db\ResultSet\ResultSet;
use Laminas\Db\Sql\Select;
use Laminas\Db\Sql\Where;
use Laminas\Paginator\Paginator;
use Laminas\Paginator\Adapter\DbSelect;

class TaskTable extends CoreEntityTable {

    /**
     * TaskTable constructor.
     *
     * @param TableGateway $tableGateway
     * @since 1.0.0
     */
    public function __construct(TableGateway $tableGateway) {
        parent::__construct($tableGateway);

        # Set Single Form Name
        $this->sSingleForm = 'task-single';
    }

    /**
     * Get Task Entity
     *
     * @param int $id
     * @param string $sKey
     * @return mixed
     * @since 1.0.0
     */
    public function getSingle($id,$sKey = 'Task_ID') {
        # Use core function
        return $this->getSingleEntity($id,$sKey);
    }

    /**
     * Save Task Entity
     *
     * @param Task $oTask
     * @return int Task ID
     * @since 1.0.0
     */
    public function saveSingle(Task $oTask) {
        $aDefaultData = [
            'label' => $oTask->label,
        ];

        return $this->saveSingleEntity($oTask,'Task_ID',$aDefaultData);
    }

    /**
     * Generate new single Entity
     *
     * @return Task
     * @since 1.0.1
     */
    public function generateNew() {
        return new Task($this->oTableGateway->getAdapter());
    }
}