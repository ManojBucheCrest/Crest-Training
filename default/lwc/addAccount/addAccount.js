import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';


export default class AddAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    myFields = [NAME_FIELD,TYPE_FIELD,PHONE_FIELD];

    handleClose(){
        window.location.reload();
    }

handleadd(){
    this.dispatchEvent(new ShowToastEvent({
        title: 'Record Updated Successfully',
        variant: 'success'
    }));
    window.location.reload();
}
}
