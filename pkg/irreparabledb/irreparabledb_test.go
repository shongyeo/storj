// Copyright (C) 2018 Storj Labs, Inc.
// See LICENSE for copying information.

package irreparabledb

import (
	"context"
	"fmt"
	"math/rand"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"go.uber.org/zap"

	dbx "storj.io/storj/pkg/irreparabledb/dbx"
	"storj.io/storj/pkg/pb"
)

var (
	ctx = context.Background()
)

func TestPutDoesNotExist(t *testing.T) {
	dbPath := getDBPath()
	irrdb, _, err := getServerAndDB(dbPath)
	assert.NoError(t, err)

	apiKey := []byte("")
	rmtsegkey := []byte("irreparableremotesegkey")
	rmtsegval := []byte("irreparableremotesegval")
	rmtseginfo := &pb.RmtSegInfo{
		Key: rmtsegkey,
		Val: rmtsegval,
	}
	createReq := &pb.PutIrrSegRequest{
		Info:   rmtseginfo,
		APIKey: apiKey,
	}
	resp, err := irrdb.Put(ctx, createReq)
	assert.NoError(t, err)
	status := resp.Status
	assert.EqualValues(t, 1, status)
}

func TestPutExists(t *testing.T) {
	dbPath := getDBPath()
	irrdb, db, err := getServerAndDB(dbPath)
	assert.NoError(t, err)

	apiKey := []byte("")
	rmtsegkey := []byte("irreparableremotesegkey")
	rmtsegval := []byte("irreparableremotesegval")
	piecesLost := int64(10)
	damagedsegUnixSec := time.Now().Unix()
	repairAttemptCount := int64(10)

	err = createRmtSegInfo(ctx, db, rmtsegkey, rmtsegval, piecesLost, damagedsegUnixSec, repairAttemptCount)
	assert.NoError(t, err)

	rmtseginfo := &pb.RmtSegInfo{
		Key:                rmtsegkey,
		Val:                rmtsegval,
		LostPiecesCount:    piecesLost,
		RepairUnixSec:      damagedsegUnixSec,
		RepairAttemptCount: repairAttemptCount,
	}
	createReq := &pb.PutIrrSegRequest{
		Info:   rmtseginfo,
		APIKey: apiKey,
	}

	_, err = irrdb.Put(ctx, createReq)
	assert.Error(t, err)
}

func TestCreateWithRmtSegInfo(t *testing.T) {
	dbPath := getDBPath()
	irrdb, db, err := getServerAndDB(dbPath)
	assert.NoError(t, err)

	apiKey := []byte("")
	rmtsegkey := []byte("irreparableremotesegkey")
	rmtsegval := []byte("irreparableremotesegval")
	piecesLost := int64(10)
	damagedsegUnixSec := time.Now().Unix()
	repairAttemptCount := int64(10)

	rmtseginfo := &pb.RmtSegInfo{
		Key:                rmtsegkey,
		Val:                rmtsegval,
		LostPiecesCount:    piecesLost,
		RepairUnixSec:      damagedsegUnixSec,
		RepairAttemptCount: repairAttemptCount,
	}
	createReq := &pb.PutIrrSegRequest{
		Info:   rmtseginfo,
		APIKey: apiKey,
	}

	resp, err := irrdb.Put(ctx, createReq)
	assert.NoError(t, err)
	status := resp.Status
	assert.EqualValues(t, 1, status)

	dbrmtsegInfo, err := db.Get_Irreparabledb_By_Segmentkey(ctx, dbx.Irreparabledb_Segmentkey(rmtsegkey))
	assert.NoError(t, err)

	assert.EqualValues(t, rmtsegkey, dbrmtsegInfo.Segmentkey, rmtsegkey)
	assert.EqualValues(t, rmtsegval, dbrmtsegInfo.Segmentval, rmtsegval)
	assert.EqualValues(t, piecesLost, dbrmtsegInfo.PiecesLostCount, piecesLost)
	assert.EqualValues(t, damagedsegUnixSec, dbrmtsegInfo.SegDamagedUnixSec, damagedsegUnixSec)
	assert.EqualValues(t, repairAttemptCount, dbrmtsegInfo.RepairAttemptCount, repairAttemptCount)
}

func TestGetExists(t *testing.T) {
	dbPath := getDBPath()
	irrdb, db, err := getServerAndDB(dbPath)
	assert.NoError(t, err)

	apiKey := []byte("")
	rmtsegkey := []byte("irreparableremotesegkey")
	rmtsegval := []byte("irreparableremotesegval")
	piecesLost := int64(10)
	damagedsegUnixSec := time.Now().Unix()
	repairAttemptCount := int64(10)

	err = createRmtSegInfo(ctx, db, rmtsegkey, rmtsegval, piecesLost, damagedsegUnixSec, repairAttemptCount)
	assert.NoError(t, err)

	getReq := &pb.GetIrrSegRequest{
		Key:    rmtsegkey,
		APIKey: apiKey,
	}
	resp, err := irrdb.Get(ctx, getReq)
	assert.NoError(t, err)

	dbrmtsegInfo := resp.GetInfo()

	assert.EqualValues(t, rmtsegkey, dbrmtsegInfo.Key, rmtsegkey)
	assert.EqualValues(t, rmtsegval, dbrmtsegInfo.Val, rmtsegval)
	assert.EqualValues(t, piecesLost, dbrmtsegInfo.LostPiecesCount, piecesLost)
	assert.EqualValues(t, damagedsegUnixSec, dbrmtsegInfo.RepairUnixSec, damagedsegUnixSec)
	assert.EqualValues(t, repairAttemptCount, dbrmtsegInfo.RepairAttemptCount, repairAttemptCount)
}

func TestDeleteExists(t *testing.T) {
	dbPath := getDBPath()
	irrdb, db, err := getServerAndDB(dbPath)
	assert.NoError(t, err)

	apiKey := []byte("")
	rmtsegkey := []byte("irreparableremotesegkey")
	rmtsegval := []byte("irreparableremotesegval")
	piecesLost := int64(10)
	damagedsegUnixSec := time.Now().Unix()
	repairAttemptCount := int64(10)

	err = createRmtSegInfo(ctx, db, rmtsegkey, rmtsegval, piecesLost, damagedsegUnixSec, repairAttemptCount)
	assert.NoError(t, err)

	delReq := &pb.DeleteIrrSegRequest{
		Key:    rmtsegkey,
		APIKey: apiKey,
	}
	resp, err := irrdb.Delete(ctx, delReq)
	assert.NoError(t, err)

	status := resp.GetStatus()
	assert.EqualValues(t, pb.DeleteIrrSegResponse_OK, status)
}

func getDBPath() string {
	return fmt.Sprintf("file:memdb%d?mode=memory&cache=shared", rand.Int63())
}

func getServerAndDB(path string) (s *Server, db *dbx.DB, err error) {
	s, err = NewServer("sqlite3", path, zap.NewNop())
	if err != nil {
		return &Server{}, &dbx.DB{}, err
	}
	db, err = dbx.Open("sqlite3", path)
	if err != nil {
		return &Server{}, &dbx.DB{}, err
	}
	return s, db, err
}

func createRmtSegInfo(ctx context.Context, db *dbx.DB, rmtsegkey []byte, rmtsegval []byte,
	piecesLost int64, damagedsegUnixSec int64, repairAttemptCount int64) error {
	_, err := db.Create_Irreparabledb(
		ctx,
		dbx.Irreparabledb_Segmentkey(rmtsegkey),
		dbx.Irreparabledb_Segmentval(rmtsegval),
		dbx.Irreparabledb_PiecesLostCount(piecesLost),
		dbx.Irreparabledb_SegDamagedUnixSec(damagedsegUnixSec),
		dbx.Irreparabledb_SegCreatedAt(time.Unix(damagedsegUnixSec, 0)),
		dbx.Irreparabledb_RepairAttemptCount(repairAttemptCount),
	)

	return err
}
