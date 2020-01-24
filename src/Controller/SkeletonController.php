<?php
/**
 * TaskController.php - Main Controller
 *
 * Main Controller Task Module
 *
 * @category Controller
 * @package Task
 * @author Verein onePlace
 * @copyright (C) 2020  Verein onePlace <admin@1plc.ch>
 * @license https://opensource.org/licenses/BSD-3-Clause
 * @version 1.0.0
 * @since 1.0.0
 */

declare(strict_types=1);

namespace OnePlace\Task\Controller;

use Application\Controller\CoreController;
use Application\Model\CoreEntityModel;
use OnePlace\Task\Model\Task;
use OnePlace\Task\Model\TaskTable;
use Laminas\View\Model\ViewModel;
use Laminas\Db\Adapter\AdapterInterface;

class TaskController extends CoreController {
    /**
     * Task Table Object
     *
     * @since 1.0.0
     */
    private $oTableGateway;

    /**
     * TaskController constructor.
     *
     * @param AdapterInterface $oDbAdapter
     * @param TaskTable $oTableGateway
     * @since 1.0.0
     */
    public function __construct(AdapterInterface $oDbAdapter,TaskTable $oTableGateway,$oServiceManager) {
        $this->oTableGateway = $oTableGateway;
        $this->sSingleForm = 'task-single';
        parent::__construct($oDbAdapter,$oTableGateway,$oServiceManager);

        if($oTableGateway) {
            # Attach TableGateway to Entity Models
            if(!isset(CoreEntityModel::$aEntityTables[$this->sSingleForm])) {
                CoreEntityModel::$aEntityTables[$this->sSingleForm] = $oTableGateway;
            }
        }
    }

    /**
     * Task Index
     *
     * @since 1.0.0
     * @return ViewModel - View Object with Data from Controller
     */
    public function indexAction() {
        # Set Layout based on users theme
        $this->setThemeBasedLayout('task');

        # Add Buttons for breadcrumb
        $this->setViewButtons('task-index');

        # Set Table Rows for Index
        $this->setIndexColumns('task-index');

        # Get Paginator
        $oPaginator = $this->oTableGateway->fetchAll(true);
        $iPage = (int) $this->params()->fromQuery('page', 1);
        $iPage = ($iPage < 1) ? 1 : $iPage;
        $oPaginator->setCurrentPageNumber($iPage);
        $oPaginator->setItemCountPerPage(3);

        # Log Performance in DB
        $aMeasureEnd = getrusage();
        $this->logPerfomance('task-index',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

        return new ViewModel([
            'sTableName'=>'task-index',
            'aItems'=>$oPaginator,
        ]);
    }

    /**
     * Task Add Form
     *
     * @since 1.0.0
     * @return ViewModel - View Object with Data from Controller
     */
    public function addAction() {
        # Set Layout based on users theme
        $this->setThemeBasedLayout('task');

        # Get Request to decide wether to save or display form
        $oRequest = $this->getRequest();

        # Display Add Form
        if(!$oRequest->isPost()) {
            # Add Buttons for breadcrumb
            $this->setViewButtons('task-single');

            # Load Tabs for View Form
            $this->setViewTabs($this->sSingleForm);

            # Load Fields for View Form
            $this->setFormFields($this->sSingleForm);

            # Log Performance in DB
            $aMeasureEnd = getrusage();
            $this->logPerfomance('task-add',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

            return new ViewModel([
                'sFormName' => $this->sSingleForm,
            ]);
        }

        # Get and validate Form Data
        $aFormData = $this->parseFormData($_REQUEST);

        # Save Add Form
        $oTask = new Task($this->oDbAdapter);
        $oTask->exchangeArray($aFormData);
        $iTaskID = $this->oTableGateway->saveSingle($oTask);
        $oTask = $this->oTableGateway->getSingle($iTaskID);

        # Save Multiselect
        $this->updateMultiSelectFields($_REQUEST,$oTask,'task-single');

        # Log Performance in DB
        $aMeasureEnd = getrusage();
        $this->logPerfomance('task-save',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

        # Display Success Message and View New Task
        $this->flashMessenger()->addSuccessMessage('Task successfully created');
        return $this->redirect()->toRoute('task',['action'=>'view','id'=>$iTaskID]);
    }

    /**
     * Task Edit Form
     *
     * @since 1.0.0
     * @return ViewModel - View Object with Data from Controller
     */
    public function editAction() {
        # Set Layout based on users theme
        $this->setThemeBasedLayout('task');

        # Get Request to decide wether to save or display form
        $oRequest = $this->getRequest();

        # Display Edit Form
        if(!$oRequest->isPost()) {

            # Get Task ID from URL
            $iTaskID = $this->params()->fromRoute('id', 0);

            # Try to get Task
            try {
                $oTask = $this->oTableGateway->getSingle($iTaskID);
            } catch (\RuntimeException $e) {
                echo 'Task Not found';
                return false;
            }

            # Attach Task Entity to Layout
            $this->setViewEntity($oTask);

            # Add Buttons for breadcrumb
            $this->setViewButtons('task-single');

            # Load Tabs for View Form
            $this->setViewTabs($this->sSingleForm);

            # Load Fields for View Form
            $this->setFormFields($this->sSingleForm);

            # Log Performance in DB
            $aMeasureEnd = getrusage();
            $this->logPerfomance('task-edit',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

            return new ViewModel([
                'sFormName' => $this->sSingleForm,
                'oTask' => $oTask,
            ]);
        }

        $iTaskID = $oRequest->getPost('Item_ID');
        $oTask = $this->oTableGateway->getSingle($iTaskID);

        # Update Task with Form Data
        $oTask = $this->attachFormData($_REQUEST,$oTask);

        # Save Task
        $iTaskID = $this->oTableGateway->saveSingle($oTask);

        $this->layout('layout/json');

        # Save Multiselect
        $this->updateMultiSelectFields($_REQUEST,$oTask,'task-single');

        # Log Performance in DB
        $aMeasureEnd = getrusage();
        $this->logPerfomance('task-save',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

        # Display Success Message and View New User
        $this->flashMessenger()->addSuccessMessage('Task successfully saved');
        return $this->redirect()->toRoute('task',['action'=>'view','id'=>$iTaskID]);
    }

    /**
     * Task View Form
     *
     * @since 1.0.0
     * @return ViewModel - View Object with Data from Controller
     */
    public function viewAction() {
        # Set Layout based on users theme
        $this->setThemeBasedLayout('task');

        # Get Task ID from URL
        $iTaskID = $this->params()->fromRoute('id', 0);

        # Try to get Task
        try {
            $oTask = $this->oTableGateway->getSingle($iTaskID);
        } catch (\RuntimeException $e) {
            echo 'Task Not found';
            return false;
        }

        # Attach Task Entity to Layout
        $this->setViewEntity($oTask);

        # Add Buttons for breadcrumb
        $this->setViewButtons('task-view');

        # Load Tabs for View Form
        $this->setViewTabs($this->sSingleForm);

        # Load Fields for View Form
        $this->setFormFields($this->sSingleForm);

        # Log Performance in DB
        $aMeasureEnd = getrusage();
        $this->logPerfomance('task-view',$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"utime"),$this->rutime($aMeasureEnd,CoreController::$aPerfomanceLogStart,"stime"));

        return new ViewModel([
            'sFormName'=>$this->sSingleForm,
            'oTask'=>$oTask,
        ]);
    }
}
