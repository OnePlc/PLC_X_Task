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
     * @return mixed
     * @since 1.0.0
     */
    public function getSingle($id) {
        # Use core function
        return $this->getSingleEntity($id,'Task_ID');
    }

    /**
     * Save Task Entity
     *
     * @param Task $oTask
     * @return int Task ID
     * @since 1.0.0
     */
    public function saveSingle(Task $oTask) {
        $aData = [
            'label' => $oTask->label,
        ];

        $aData = $this->attachDynamicFields($aData,$oTask);

        $id = (int) $oTask->id;

        if ($id === 0) {
            # Add Metadata
            $aData['created_by'] = CoreController::$oSession->oUser->getID();
            $aData['created_date'] = date('Y-m-d H:i:s',time());
            $aData['modified_by'] = CoreController::$oSession->oUser->getID();
            $aData['modified_date'] = date('Y-m-d H:i:s',time());

            # Insert Task
            $this->oTableGateway->insert($aData);

            # Return ID
            return $this->oTableGateway->lastInsertValue;
        }

        # Check if Task Entity already exists
        try {
            $this->getSingle($id);
        } catch (\RuntimeException $e) {
            throw new \RuntimeException(sprintf(
                'Cannot update task with identifier %d; does not exist',
                $id
            ));
        }

        # Update Metadata
        $aData['modified_by'] = CoreController::$oSession->oUser->getID();
        $aData['modified_date'] = date('Y-m-d H:i:s',time());

        # Update Task
        $this->oTableGateway->update($aData, ['Task_ID' => $id]);

        return $id;
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