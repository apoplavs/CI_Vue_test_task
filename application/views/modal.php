<!--add modal-->
<modal v-if="addModal" @close="closeModal()">

<h3 slot="head" >Добавить коментарий</h3>
<div slot="body" class="row">
    <div class="col-md-6">
        <div class="form-group">
            <label>Коментарий</label>
            <textarea cols="55" rows="5" name="comment" v-model="newComment.comment" class="form-control"></textarea>
        </div>
    </div>
</div>
<div slot="foot">
    <button class="btn btn-dark" @click="addComment()">Добавить</button>
</div>

</modal>
