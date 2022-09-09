import { LightningElement,wire } from 'lwc';
import accounthometab from '@salesforce/apex/accountHome.accounthometab';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
// import { updateRecord } from 'lightning/uiRecordApi';
import {refreshApex} from '@salesforce/apex';

const columnsStructure =[
    {label:'Name', fieldName: 'Name' },
    {label:'Type', fieldName: 'Type' },
    {label:'Phone', fieldName: 'Phone' },
    
];
export default class Accounthomepage extends LightningElement {
    columnsList = columnsStructure;
    dataList;
    error;
    Refreshdata;
    recordId =[];
    selectedRecords;
    showAddAccount = false;
    showDeleteAccount = false;
    showUpdateAccount= false;


    @wire(accounthometab)
    allAccountData(result){
        const {data,error} = result;
        this.Refreshdata = result;
        // this.template.querySelector("lightning-datatable").getSelectedRows();
        // this.refreshTable=result;
        if(data){
            this.dataList = data;
        }else if(error){
            this.error = error;
         }
    }

    handleAdd(){
        this.showAddAccount = true;
    }

    handleDelete(){
        this.showDeleteAccount = true;
    }
    handleUpdate(){
        this.selectedRecords = this.template.querySelector("lightning-datatable").getSelectedRows();
        console.log('this.selectedRecords : '+ JSON.stringify(this.selectedRecords));
        this.selectedRecords.forEach(element => {
            this.recordId.push(element.Id);
        });
        
    
    if(this.selectedRecords.length > 0){
        this.showUpdateAccount = true;
    }
    else {
        this.dispatchEvent(new ShowToastEvent({
            title: 'Please select a Record.',
            variant: 'error'
        }));
    }
}
handleClick(){
    // updateRecord({ fields: { Id: this.dataList } });
    return refreshApex(this.Refreshdata);
}
}